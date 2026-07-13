import 'package:summit/data/local/database/app_database.dart';

class WorkoutDashboard {
  const WorkoutDashboard({
    required this.workouts,
    required this.recent,
    required this.weekly,
    required this.weeklyMinutes,
    required this.goalPercent,
  });

  factory WorkoutDashboard.empty() {
    return const WorkoutDashboard(
      workouts: [],
      recent: [],
      weekly: [],
      weeklyMinutes: 0,
      goalPercent: 0,
    );
  }

  final List<Workout> workouts;
  final List<Workout> recent;
  final List<Workout> weekly;
  final int weeklyMinutes;
  final double goalPercent;
}
