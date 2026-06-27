import 'package:summit/data/local/database/app_database.dart';

abstract class WorkoutRepository {
  Stream<List<Workout>> watchWorkouts();

  Future<List<Workout>> getWorkouts();

  Future<List<Workout>> getWorkoutsByUser(int userId);

  Future<Workout?> getWorkoutById(int id);

  Future<int> insertWorkout(WorkoutsCompanion workout);

  Future<bool> updateWorkout(Workout workout);

  Future<int> deleteWorkout(int id);

  Future<List<EnduranceActivity>> getEnduranceActivities(int workoutId);

  Future<int> insertEnduranceActivity(EnduranceActivitiesCompanion activity);

  Future<bool> updateEnduranceActivity(EnduranceActivity activity);

  Future<int> deleteEnduranceActivity(int id);

  Future<List<StrengthExercise>> getStrengthExercises(int workoutId);

  Future<int> insertStrengthExercise(StrengthExercisesCompanion exercise);

  Future<bool> updateStrengthExercise(StrengthExercise exercise);

  Future<int> deleteStrengthExercise(int id);

  Future<List<ExerciseSet>> getExerciseSets(int exerciseId);

  Future<int> insertExerciseSet(ExerciseSetsCompanion exerciseSet);

  Future<bool> updateExerciseSet(ExerciseSet exerciseSet);

  Future<int> deleteExerciseSet(int id);
}
