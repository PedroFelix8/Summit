import 'package:drift/drift.dart';

import 'package:summit/data/local/database/app_database.dart';
import 'package:summit/domain/services/workout_analytics_service.dart';

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

class WorkoutDashboardStream {
  const WorkoutDashboardStream(
    this._database, {
    WorkoutAnalyticsService analytics = const WorkoutAnalyticsService(),
  }) : _analytics = analytics;

  final AppDatabase _database;
  final WorkoutAnalyticsService _analytics;

  Stream<WorkoutDashboard> watch() {
    return (_database.select(_database.workouts)
          ..orderBy([
            (table) => OrderingTerm.desc(table.date),
          ]))
        .watch()
        .map(_analytics.buildDashboard);
  }
}
