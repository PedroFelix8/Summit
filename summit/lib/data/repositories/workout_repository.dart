import 'package:drift/drift.dart';

import 'package:summit/data/local/database/app_database.dart';
import 'package:summit/data/streams/workout_stream.dart';
import 'package:summit/domain/repositories/workout_repository.dart' as domain;

class WorkoutRepository implements domain.WorkoutRepository {
  const WorkoutRepository(this._database);

  final AppDatabase _database;

  @override
  Future<List<Workout>> getWorkouts() {
    return (_database.select(_database.workouts)
          ..orderBy([
            (table) => OrderingTerm.desc(table.date),
          ]))
        .get();
  }

  @override
  Stream<List<Workout>> watchWorkouts() {
    return WorkoutStream(_database).watch();
  }

  @override
  Future<List<Workout>> getWorkoutsByUser(int userId) {
    return (_database.select(_database.workouts)
          ..where((table) => table.userId.equals(userId))
          ..orderBy([
            (table) => OrderingTerm.desc(table.date),
          ]))
        .get();
  }

  @override
  Future<Workout?> getWorkoutById(int id) {
    return (_database.select(_database.workouts)
          ..where((table) => table.id.equals(id)))
        .getSingleOrNull();
  }

  @override
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

  @override
  Future<bool> updateWorkout(Workout workout) {
    return _database.update(_database.workouts).replace(workout);
  }

  @override
  Future<int> deleteWorkout(int id) {
    return (_database.delete(_database.workouts)
          ..where((table) => table.id.equals(id)))
        .go();
  }

  @override
  Future<List<EnduranceActivity>> getEnduranceActivities(int workoutId) {
    return (_database.select(_database.enduranceActivities)
          ..where((table) => table.workoutId.equals(workoutId)))
        .get();
  }

  @override
  Future<int> insertEnduranceActivity(
    EnduranceActivitiesCompanion activity,
  ) {
    return _database.into(_database.enduranceActivities).insert(activity);
  }

  @override
  Future<bool> updateEnduranceActivity(EnduranceActivity activity) {
    return _database.update(_database.enduranceActivities).replace(activity);
  }

  @override
  Future<int> deleteEnduranceActivity(int id) {
    return (_database.delete(_database.enduranceActivities)
          ..where((table) => table.id.equals(id)))
        .go();
  }

  @override
  Future<List<StrengthExercise>> getStrengthExercises(int workoutId) {
    return (_database.select(_database.strengthExercises)
          ..where((table) => table.workoutId.equals(workoutId)))
        .get();
  }

  @override
  Future<int> insertStrengthExercise(StrengthExercisesCompanion exercise) {
    return _database.into(_database.strengthExercises).insert(exercise);
  }

  @override
  Future<bool> updateStrengthExercise(StrengthExercise exercise) {
    return _database.update(_database.strengthExercises).replace(exercise);
  }

  @override
  Future<int> deleteStrengthExercise(int id) {
    return (_database.delete(_database.strengthExercises)
          ..where((table) => table.id.equals(id)))
        .go();
  }

  @override
  Future<List<ExerciseSet>> getExerciseSets(int exerciseId) {
    return (_database.select(_database.exerciseSets)
          ..where((table) => table.exerciseId.equals(exerciseId)))
        .get();
  }

  @override
  Future<int> insertExerciseSet(ExerciseSetsCompanion exerciseSet) {
    return _database.into(_database.exerciseSets).insert(exerciseSet);
  }

  @override
  Future<bool> updateExerciseSet(ExerciseSet exerciseSet) {
    return _database.update(_database.exerciseSets).replace(exerciseSet);
  }

  @override
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
