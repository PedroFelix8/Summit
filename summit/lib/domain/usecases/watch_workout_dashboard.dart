import 'package:summit/domain/entities/workout_dashboard.dart';
import 'package:summit/domain/repositories/workout_repository.dart';
import 'package:summit/domain/services/workout_analytics_service.dart';

class WatchWorkoutDashboard {
  const WatchWorkoutDashboard(
    this._repository, {
    WorkoutAnalyticsService analytics = const WorkoutAnalyticsService(),
  }) : _analytics = analytics;

  final WorkoutRepository _repository;
  final WorkoutAnalyticsService _analytics;

  Stream<WorkoutDashboard> call() {
    return _repository.watchWorkouts().map(_analytics.buildDashboard);
  }
}
