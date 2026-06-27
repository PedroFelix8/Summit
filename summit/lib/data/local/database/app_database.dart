import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'package:summit/data/local/database/tables/endurance_activities.dart';
import 'package:summit/data/local/database/tables/exercise_sets.dart';
import 'package:summit/data/local/database/tables/goals.dart';
import 'package:summit/data/local/database/tables/strava_connections.dart';
import 'package:summit/data/local/database/tables/strength_exercises.dart';
import 'package:summit/data/local/database/tables/users.dart';
import 'package:summit/data/local/database/tables/workouts.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    Users,
    Workouts,
    EnduranceActivities,
    StrengthExercises,
    ExerciseSets,
    Goals,
    StravaConnections,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor])
      : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'summit',
      web: DriftWebOptions(
        sqlite3Wasm: Uri.parse('/sqlite3.wasm'),
        driftWorker: Uri.parse('/drift_worker.js'),
      ),
    );
  }
}
