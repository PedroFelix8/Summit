import 'package:summit/data/local/database/database_provider.dart';
import 'package:summit/data/repositories/workout_repository.dart';
import 'package:summit/domain/entities/workout_dashboard.dart';
import 'package:summit/domain/usecases/watch_workout_dashboard.dart';

class WorkoutDependencies {
  const WorkoutDependencies._();

  static final WorkoutRepository workoutRepository = WorkoutRepository(
    DatabaseProvider.instance,
  );

  static Stream<WorkoutDashboard> watchWorkoutDashboard() {
    return WatchWorkoutDashboard(workoutRepository).call();
  }
}
