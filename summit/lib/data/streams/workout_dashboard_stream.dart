import 'package:drift/drift.dart';

import 'package:summit/data/local/database/app_database.dart';

class WorkoutDashboard {
  const WorkoutDashboard({
    required this.workouts,
    required this.recent,
    required this.weekly,
    required this.weeklyMinutes,
    required this.goalPercent,
  });

  factory WorkoutDashboard.fromWorkouts(List<Workout> workouts) {
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

class WorkoutDashboardStream {
  const WorkoutDashboardStream(this._database);

  final AppDatabase _database;

  Stream<WorkoutDashboard> watch() {
    return (_database.select(_database.workouts)
          ..orderBy([
            (table) => OrderingTerm.desc(table.date),
          ]))
        .watch()
        .map(WorkoutDashboard.fromWorkouts);
  }
}
