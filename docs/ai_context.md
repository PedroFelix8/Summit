# Summit AI Context

This document is meant for another AI agent or developer joining the Summit Flutter project. It summarizes the current architecture, important decisions, and the direction to preserve when making changes.

## Project Overview

Summit is a Flutter fitness/training app. It currently focuses on local-first workout tracking with Drift/SQLite persistence, a reactive home dashboard, and a simple bottom-navigation shell.

The app is not a marketing site. Keep changes practical, app-first, and consistent with the existing Flutter architecture.

## Main Rules For Future Work

- Do not mix the Figma/ShadCN web export with Flutter code.
- Keep the existing folder architecture: `core`, `shared`, `presentation`, `data`, `domain`, `business`, `external`.
- Prefer `package:summit/...` imports.
- Do not create duplicate widgets if an existing widget already covers the need.
- Do not instantiate `AppDatabase()` directly outside the database provider.
- Do not close the shared database from a screen.
- Keep Drift schema changes deliberate; if tables change, regenerate Drift code.
- Keep presentation free of Drift queries and dashboard aggregation logic.

## Current Folder Roles

### `lib/core`

Infrastructure shared by the whole app.

- `core/router/app_router.dart`: GoRouter setup with a `ShellRoute`.
- `core/theme/*`: app colors, text styles, and theme.
- `core/dependencies/workout_dependencies.dart`: lightweight composition point for workout dependencies.

### `lib/shared`

Reusable UI widgets.

Important widgets:

- `HomeHeroHeader`
- `QuickStatsRow` / `QuickStat`
- `WorkoutListItem`
- `GradientCard`
- `GradientProgressBar`
- `SectionPlaceholder`

### `lib/presentation`

Screens and UI-only code.

Important screens:

- `HomeScreen`: consumes a `Stream<WorkoutDashboard>`.
- `AddWorkoutScreen`: creates workouts.
- `EditWorkoutScreen`: edits/deletes workouts.
- `WorkoutForm`: shared form used by add/edit.

Presentation may format values for display, choose icons, and navigate. It should not contain Drift queries or dashboard aggregation.

### `lib/data`

Persistence and data access.

Important files:

- `data/local/database/app_database.dart`: Drift database definition and web/native DB opening.
- `data/local/database/database_provider.dart`: singleton database instance.
- `data/local/database/tables/*`: Drift table definitions.
- `data/repositories/workout_repository.dart`: concrete Drift-backed repository.
- `data/streams/workout_stream.dart`: Drift stream returning `Stream<List<Workout>>`.

Data layer owns Drift. Keep Drift types and queries here unless the current architecture explicitly requires otherwise.

### `lib/domain`

Domain contracts, entities, use cases, and domain services.

Important files:

- `domain/entities/workout_dashboard.dart`: immutable dashboard model.
- `domain/repositories/workout_repository.dart`: repository interface.
- `domain/services/workout_analytics_service.dart`: builds `WorkoutDashboard` from workouts.
- `domain/usecases/watch_workout_dashboard.dart`: converts `Stream<List<Workout>>` into `Stream<WorkoutDashboard>`.
- `domain/usecases/add_workout.dart`, `update_workout.dart`, `delete_workout.dart`, `watch_workouts.dart`: simple use cases over the repository interface.

The intended architecture for the dashboard is:

```text
Drift workouts table
  -> data stream: Stream<List<Workout>>
  -> domain use case: WatchWorkoutDashboard
  -> domain service: WorkoutAnalyticsService
  -> domain entity: WorkoutDashboard
  -> presentation: HomeScreen
```

## Workout Dashboard Flow

`HomeScreen` should not calculate weekly workouts, recent workouts, weekly minutes, or goal percent.

Current flow:

1. `HomeScreen` initializes:
   - `_dashboardStream = WorkoutDependencies.watchWorkoutDashboard();`
2. `WorkoutDependencies` wires:
   - `DatabaseProvider.instance`
   - data `WorkoutRepository`
   - domain `WatchWorkoutDashboard`
3. data `WorkoutRepository.watchWorkouts()` returns `Stream<List<Workout>>`.
4. `WatchWorkoutDashboard` maps workouts through `WorkoutAnalyticsService`.
5. `WorkoutAnalyticsService.buildDashboard()` calculates:
   - `recent`: first 5 workouts from date-desc ordered list
   - `weekly`: workouts in current week, Monday inclusive to next Monday exclusive
   - `weeklyMinutes`: sum of `duration`
   - `goalPercent`: `(weekly.length / 5) * 100`, clamped to `0..100`
6. `HomeScreen` renders the resulting `WorkoutDashboard`.

If you need new dashboard metrics, add them to:

1. `WorkoutDashboard`
2. `WorkoutAnalyticsService`
3. UI consumption in `HomeScreen`

Do not duplicate calculations in UI.

## Database And Drift

The Drift database is defined in `lib/data/local/database/app_database.dart`.

Tables currently include:

- `Users`
- `Workouts`
- `EnduranceActivities`
- `StrengthExercises`
- `ExerciseSets`
- `Goals`
- `StravaConnections`

The generated file is:

- `lib/data/local/database/app_database.g.dart`

Do not manually edit generated Drift code.

The shared DB instance is:

```dart
DatabaseProvider.instance
```

Use that singleton. Avoid:

```dart
AppDatabase()
```

outside `database_provider.dart` or tests.

## Drift Web / WASM Notes

Flutter Web persistence depends on the browser origin. `localhost:5000` and `localhost:5001` have separate IndexedDB storage.

For stable web persistence during development, run with a fixed port:

```bash
flutter run -d chrome --web-hostname localhost --web-port 5000
```

Required web assets:

- `web/sqlite3.wasm`
- `web/drift_worker.js`
- `web/drift_worker.dart` source entrypoint

`AppDatabase` uses absolute paths:

```dart
web: DriftWebOptions(
  sqlite3Wasm: Uri.parse('/sqlite3.wasm'),
  driftWorker: Uri.parse('/drift_worker.js'),
)
```

If Chrome logs `Using WasmStorageImplementation.sharedIndexedDb...`, that is not necessarily an error. It can still persist. The real error is when `drift_worker.js` is fetched as `text/html`, which means the asset path is wrong or missing.

## Workout CRUD

Add/edit/delete exists.

- `AddWorkoutScreen` inserts a `WorkoutsCompanion`.
- `EditWorkoutScreen` updates/deletes a `Workout`.
- `WorkoutForm` contains shared form state and validation.
- Home updates automatically because it listens to the reactive dashboard stream.

The data repository currently ensures a local user exists when inserting a workout with a `userId`. This is a temporary MVP bridge until a real user/profile flow exists.

## Navigation

Navigation uses GoRouter for the main shell:

- `/home`
- `/training`
- `/statistics`
- `/goals`
- `/profile`

Add/Edit workout screens are currently pushed with `Navigator.push()` from `HomeScreen`, not declared in GoRouter.

Bottom navigation lives in:

- `presentation/widgets/main_navigation_shell.dart`

## UI Design Direction

The UI uses a dark theme with cards, subtle borders, and small fitness-dashboard components.

Keep using:

- `AppColors`
- `AppTextStyles`
- existing shared widgets

Avoid introducing CSS, Tailwind, ShadCN, React patterns, or generated web UI into Flutter code.

## Known Technical Debt

- The domain repository interface still imports Drift-generated types (`Workout`, `WorkoutsCompanion`, etc.). This is not fully pure Clean Architecture yet, but it preserves compile compatibility and avoids a large mapper refactor.
- `business/services/*` contains placeholder/older service files and is not the active path for workout dashboard logic.
- Empty or legacy files may exist, such as `data/database/sqlite_database.dart`, `training_repository.dart`, and `statistics_repository.dart`.
- `HomeScreen` still receives the concrete data repository for Add/Edit screens via `WorkoutDependencies`. A future cleanup could route Add/Edit through domain use cases too.
- The Figma export under `docs/figma-export/` is reference material only, not app code.

## Safe Next Steps

Good next refactors:

- Make data `WorkoutRepository` implement domain interface everywhere consistently.
- Move Add/Edit workout flows to domain use cases.
- Introduce pure domain workout entities and map Drift rows to domain models.
- Add tests for `WorkoutAnalyticsService`.
- Add database migrations before changing table columns.
- Add a real user/profile setup instead of the temporary default user insert.

Risky changes:

- Changing Drift table names or columns without regenerating and migration planning.
- Creating another `AppDatabase()` instance.
- Moving dashboard calculations back into `HomeScreen`.
- Removing `drift_worker.js` or `sqlite3.wasm` from `web/`.
- Running web on random ports and assuming IndexedDB data is shared.

## Useful Commands

From `summit/`:

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter analyze
flutter run -d chrome --web-hostname localhost --web-port 5000
```

Use the build runner command after Drift table/database changes.

