import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import 'package:summit/core/dependencies/workout_dependencies.dart';
import 'package:summit/core/theme/app_colors.dart';
import 'package:summit/core/theme/app_text_styles.dart';
import 'package:summit/data/local/database/app_database.dart';
import 'package:summit/domain/entities/workout_dashboard.dart';
import 'package:summit/presentation/providers/workout_dashboard_provider.dart';
import 'package:summit/presentation/screens/add_workout/add_workout_screen.dart';
import 'package:summit/presentation/screens/edit_workout/edit_workout_screen.dart';
import 'package:summit/shared/widgets/gradient_card.dart';
import 'package:summit/shared/widgets/home_hero_header.dart';
import 'package:summit/shared/widgets/quick_stat_card.dart';
import 'package:summit/shared/widgets/workout_list_item.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardAsync = ref.watch(workoutDashboardProvider);
    final dashboard = dashboardAsync.value ?? WorkoutDashboard.empty();
    final isLoading = dashboardAsync.isLoading;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _HomeContent(
          dashboard: dashboard,
          isLoading: isLoading,
          hasError: dashboardAsync.hasError,
          onAddWorkout: () => _openAddWorkout(context),
          onEditWorkout: (workout) => _openEditWorkout(context, workout),
        ),
      ),
    );
  }

  Future<void> _openAddWorkout(BuildContext context) async {
    await Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) => AddWorkoutScreen(
          addWorkout: WorkoutDependencies.addWorkout,
        ),
      ),
    );
  }

  Future<void> _openEditWorkout(BuildContext context, Workout workout) async {
    await Navigator.push<void>(
      context,
      MaterialPageRoute(
        builder: (context) => EditWorkoutScreen(
          updateWorkout: WorkoutDependencies.updateWorkout,
          deleteWorkout: WorkoutDependencies.deleteWorkout,
          workout: workout,
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({
    required this.dashboard,
    required this.isLoading,
    required this.hasError,
    required this.onAddWorkout,
    required this.onEditWorkout,
  });

  final WorkoutDashboard dashboard;
  final bool isLoading;
  final bool hasError;
  final VoidCallback onAddWorkout;
  final ValueChanged<Workout> onEditWorkout;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding =
        MediaQuery.sizeOf(context).width > 640 ? 32.0 : 20.0;

    return SingleChildScrollView(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HomeHeroHeader(
                userName: 'Alex',
                weekLabel: 'This week',
                workoutsCount: dashboard.weekly.length.toString(),
                totalKm: '0.0',
                totalTime: _formatDuration(dashboard.weeklyMinutes),
                weekGoalPercent: dashboard.goalPercent,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  24,
                  horizontalPadding,
                  12,
                ),
                child: const _SectionTitle(title: 'Quick Stats'),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: QuickStatsRow(
                  stats: [
                    QuickStat(
                      icon: Icons.event_available_outlined,
                      value: dashboard.workouts.length.toString(),
                      label: 'total',
                    ),
                    QuickStat(
                      icon: Icons.timer_outlined,
                      value: _formatDuration(dashboard.weeklyMinutes),
                      label: 'time',
                    ),
                    QuickStat(
                      icon: Icons.local_fire_department_outlined,
                      value: dashboard.weekly.length.toString(),
                      label: 'week',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  28,
                  horizontalPadding,
                  12,
                ),
                child: _SectionHeader(
                  title: 'Recent Workouts',
                  onAddWorkout: onAddWorkout,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  horizontalPadding,
                  0,
                  horizontalPadding,
                  24,
                ),
                child: _WorkoutSection(
                  workouts: dashboard.recent,
                  isLoading: isLoading,
                  hasError: hasError,
                  onEditWorkout: onEditWorkout,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static String _formatDuration(int minutes) {
    if (minutes < 60) {
      return '${minutes}m';
    }

    final hours = minutes ~/ 60;
    final remainingMinutes = minutes % 60;
    return remainingMinutes == 0
        ? '${hours}h'
        : '${hours}h ${remainingMinutes}m';
  }
}

class _WorkoutSection extends StatelessWidget {
  const _WorkoutSection({
    required this.workouts,
    required this.isLoading,
    required this.hasError,
    required this.onEditWorkout,
  });

  final List<Workout> workouts;
  final bool isLoading;
  final bool hasError;
  final ValueChanged<Workout> onEditWorkout;

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const _StateCard(message: 'Loading workouts...');
    }

    if (hasError) {
      return const _StateCard(message: 'Unable to load workouts.');
    }

    if (workouts.isEmpty) {
      return const _StateCard(message: 'No workouts yet.');
    }

    return Column(
      children: [
        for (final workout in workouts) ...[
          WorkoutListItem(
            entry: _toWorkoutEntry(workout),
            onTap: () => onEditWorkout(workout),
          ),
          if (workout != workouts.last) const SizedBox(height: 10),
        ],
      ],
    );
  }

  static WorkoutEntry _toWorkoutEntry(Workout workout) {
    return WorkoutEntry(
      icon: _iconForType(workout.type),
      label: workout.notes?.isNotEmpty == true
          ? workout.notes!
          : '${_titleCase(workout.type)} workout',
      date: DateFormat.MMMd().format(workout.date),
      duration: _HomeContent._formatDuration(workout.duration),
    );
  }

  static IconData _iconForType(String type) {
    return switch (type.toLowerCase()) {
      'strength' => Icons.fitness_center,
      'cycling' || 'bike' => Icons.directions_bike,
      'running' || 'run' || 'endurance' => Icons.directions_run,
      _ => Icons.sports,
    };
  }

  static String _titleCase(String value) {
    if (value.isEmpty) {
      return 'Training';
    }

    return value[0].toUpperCase() + value.substring(1).toLowerCase();
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.title,
    required this.onAddWorkout,
  });

  final String title;
  final VoidCallback onAddWorkout;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _SectionTitle(title: title),
        const Spacer(),
        TextButton.icon(
          onPressed: onAddWorkout,
          icon: const Icon(Icons.add),
          label: const Text('Add'),
        ),
      ],
    );
  }
}

class _StateCard extends StatelessWidget {
  const _StateCard({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return GradientCard(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(message, style: AppTextStyles.bodySmMuted),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyles.bodySmRegular.copyWith(
        color: AppColors.foreground,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
