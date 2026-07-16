import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:summit/core/dependencies/workout_dependencies.dart';
import 'package:summit/domain/entities/workout_dashboard.dart';

final workoutDashboardProvider = StreamProvider<WorkoutDashboard>((ref) {
  return WorkoutDependencies.watchWorkoutDashboard();
});
