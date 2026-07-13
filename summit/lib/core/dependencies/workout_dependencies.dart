import 'package:summit/data/local/database/database_provider.dart';
import 'package:summit/data/repositories/workout_repository.dart';
import 'package:summit/domain/entities/workout_dashboard.dart';
import 'package:summit/domain/usecases/add_workout.dart';
import 'package:summit/domain/usecases/delete_workout.dart';
import 'package:summit/domain/usecases/update_workout.dart';
import 'package:summit/domain/usecases/watch_workout_dashboard.dart';

class WorkoutDependencies {
  const WorkoutDependencies._();

  static final WorkoutRepository workoutRepository = WorkoutRepository(
    DatabaseProvider.instance,
  );

  static final AddWorkout addWorkout = AddWorkout(workoutRepository);

  static final UpdateWorkout updateWorkout = UpdateWorkout(workoutRepository);

  static final DeleteWorkout deleteWorkout = DeleteWorkout(workoutRepository);

  static Stream<WorkoutDashboard> watchWorkoutDashboard() {
    return WatchWorkoutDashboard(workoutRepository).call();
  }
}
