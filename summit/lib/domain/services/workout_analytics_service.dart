import 'package:summit/data/local/database/app_database.dart';
import 'package:summit/data/streams/workout_dashboard_stream.dart';

class WorkoutAnalyticsService {
  const WorkoutAnalyticsService();

  WorkoutDashboard buildDashboard(List<Workout> workouts) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 7));
    final weekly = workouts.where((workout) {
      return !workout.date.isBefore(startOfWeek) &&
          workout.date.isBefore(endOfWeek);
    }).toList();
    final weeklyMinutes = weekly.fold<int>(
      0,
      (total, workout) => total + workout.duration,
    );

    return WorkoutDashboard(
      workouts: workouts,
      recent: workouts.take(5).toList(),
      weekly: weekly,
      weeklyMinutes: weeklyMinutes,
      goalPercent: ((weekly.length / 5) * 100).clamp(0.0, 100.0),
    );
  }
}
