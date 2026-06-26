import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:summit/core/theme/app_colors.dart';
import 'package:summit/core/theme/app_text_styles.dart';
import 'package:summit/data/local/database/app_database.dart';
import 'package:summit/data/repositories/workout_repository.dart';
import 'package:summit/presentation/screens/add_workout/add_workout_screen.dart';
import 'package:summit/presentation/screens/edit_workout/edit_workout_screen.dart';
import 'package:summit/shared/widgets/gradient_card.dart';
import 'package:summit/shared/widgets/home_hero_header.dart';
import 'package:summit/shared/widgets/quick_stat_card.dart';
import 'package:summit/shared/widgets/workout_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AppDatabase _database;
  late final WorkoutRepository _workoutRepository;
  late Future<List<Workout>> _workoutsFuture;

  @override
  void initState() {
    super.initState();
    _database = AppDatabase();
    _workoutRepository = WorkoutRepository(_database);
    _workoutsFuture = _workoutRepository.getWorkouts();
  }

  @override
  void dispose() {
    _database.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: FutureBuilder<List<Workout>>(
          future: _workoutsFuture,
          builder: (context, snapshot) {
            final workouts = snapshot.data ?? const <Workout>[];
            final isLoading =
                snapshot.connectionState == ConnectionState.waiting;

            return _HomeContent(
              workouts: workouts,
              isLoading: isLoading,
              hasError: snapshot.hasError,
              onAddWorkout: _openAddWorkout,
              onEditWorkout: _openEditWorkout,
            );
          },
        ),
      ),
    );
  }

  Future<void> _openAddWorkout() async {
    final changed = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => AddWorkoutScreen(repository: _workoutRepository),
      ),
    );

    if (changed == true) {
      _reloadWorkouts();
    }
  }

  Future<void> _openEditWorkout(Workout workout) async {
    final changed = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (context) => EditWorkoutScreen(
          repository: _workoutRepository,
          workout: workout,
        ),
      ),
    );

    if (changed == true) {
      _reloadWorkouts();
    }
  }

  void _reloadWorkouts() {
    setState(() {
      _workoutsFuture = _workoutRepository.getWorkouts();
    });
  }
}

class _HomeContent extends StatelessWidget {
  const _HomeContent({
    required this.workouts,
    required this.isLoading,
    required this.hasError,
    required this.onAddWorkout,
    required this.onEditWorkout,
  });

  final List<Workout> workouts;
  final bool isLoading;
  final bool hasError;
  final VoidCallback onAddWorkout;
  final ValueChanged<Workout> onEditWorkout;

  @override
  Widget build(BuildContext context) {
    final horizontalPadding =
        MediaQuery.sizeOf(context).width > 640 ? 32.0 : 20.0;
    final recentWorkouts = workouts.take(5).toList();
    final weeklyWorkouts = workouts.where(_isCurrentWeek).toList();
    final weeklyMinutes = weeklyWorkouts.fold<int>(
      0,
      (total, workout) => total + workout.duration,
    );
    final goalPercent = weeklyWorkouts.isEmpty
        ? 0.0
        : ((weeklyWorkouts.length / 5) * 100).clamp(0.0, 100.0);

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
                workoutsCount: weeklyWorkouts.length.toString(),
                totalKm: '0.0',
                totalTime: _formatDuration(weeklyMinutes),
                weekGoalPercent: goalPercent,
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
                      value: workouts.length.toString(),
                      label: 'total',
                    ),
                    QuickStat(
                      icon: Icons.timer_outlined,
                      value: _formatDuration(weeklyMinutes),
                      label: 'time',
                    ),
                    QuickStat(
                      icon: Icons.local_fire_department_outlined,
                      value: weeklyWorkouts.length.toString(),
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
                  workouts: recentWorkouts,
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

  static bool _isCurrentWeek(Workout workout) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final startOfWeek = today.subtract(Duration(days: today.weekday - 1));
    final endOfWeek = startOfWeek.add(const Duration(days: 7));
    return !workout.date.isBefore(startOfWeek) &&
        workout.date.isBefore(endOfWeek);
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
