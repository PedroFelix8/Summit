import 'package:drift/drift.dart';

import 'package:summit/data/local/database/app_database.dart';

class WorkoutRepository {
  const WorkoutRepository(this._database);

  final AppDatabase _database;

  Future<List<Workout>> getWorkouts() {
    return (_database.select(_database.workouts)
          ..orderBy([
            (table) => OrderingTerm.desc(table.date),
          ]))
        .get();
  }

  Stream<List<Workout>> watchWorkouts() {
    return (_database.select(_database.workouts)
          ..orderBy([
            (table) => OrderingTerm.desc(table.date),
          ]))
        .watch();
  }

  Future<List<Workout>> getWorkoutsByUser(int userId) {
    return (_database.select(_database.workouts)
          ..where((table) => table.userId.equals(userId))
          ..orderBy([
            (table) => OrderingTerm.desc(table.date),
          ]))
        .get();
  }

  Future<Workout?> getWorkoutById(int id) {
    return (_database.select(_database.workouts)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  Future<int> insertWorkout(WorkoutsCompanion workout) {
    if (workout.userId.present) {
      return _insertWorkoutForExistingUser(workout);
    }

    return _database.into(_database.workouts).insert(workout);
  }

  Future<int> _insertWorkoutForExistingUser(WorkoutsCompanion workout) async {
    await _ensureUserExists(workout.userId.value);
    return _database.into(_database.workouts).insert(workout);
  }

  Future<bool> updateWorkout(Workout workout) {
    return _database.update(_database.workouts).replace(workout);
  }

  Future<int> deleteWorkout(int id) {
    return (_database.delete(_database.workouts)
          ..where((table) => table.id.equals(id)))
        .go();
  }

  Future<List<EnduranceActivity>> getEnduranceActivities(int workoutId) {
    return (_database.select(_database.enduranceActivities)
          ..where((table) => table.workoutId.equals(workoutId)))
        .get();
  }

  Future<int> insertEnduranceActivity(
    EnduranceActivitiesCompanion activity,
  ) {
    return _database.into(_database.enduranceActivities).insert(activity);
  }

  Future<bool> updateEnduranceActivity(EnduranceActivity activity) {
    return _database.update(_database.enduranceActivities).replace(activity);
  }

  Future<int> deleteEnduranceActivity(int id) {
    return (_database.delete(_database.enduranceActivities)
          ..where((table) => table.id.equals(id)))
        .go();
  }

  Future<List<StrengthExercise>> getStrengthExercises(int workoutId) {
    return (_database.select(_database.strengthExercises)
          ..where((table) => table.workoutId.equals(workoutId)))
        .get();
  }

  Future<int> insertStrengthExercise(StrengthExercisesCompanion exercise) {
    return _database.into(_database.strengthExercises).insert(exercise);
  }

  Future<bool> updateStrengthExercise(StrengthExercise exercise) {
    return _database.update(_database.strengthExercises).replace(exercise);
  }

  Future<int> deleteStrengthExercise(int id) {
    return (_database.delete(_database.strengthExercises)
          ..where((table) => table.id.equals(id)))
        .go();
  }

  Future<List<ExerciseSet>> getExerciseSets(int exerciseId) {
    return (_database.select(_database.exerciseSets)
          ..where((table) => table.exerciseId.equals(exerciseId)))
        .get();
  }

  Future<int> insertExerciseSet(ExerciseSetsCompanion exerciseSet) {
    return _database.into(_database.exerciseSets).insert(exerciseSet);
  }

  Future<bool> updateExerciseSet(ExerciseSet exerciseSet) {
    return _database.update(_database.exerciseSets).replace(exerciseSet);
  }

  Future<int> deleteExerciseSet(int id) {
    return (_database.delete(_database.exerciseSets)
          ..where((table) => table.id.equals(id)))
        .go();
  }

  Future<void> _ensureUserExists(int userId) async {
    await _database.into(_database.users).insert(
          UsersCompanion.insert(
            id: Value(userId),
            name: 'Alex',
          ),
          mode: InsertMode.insertOrIgnore,
        );
  }
}
