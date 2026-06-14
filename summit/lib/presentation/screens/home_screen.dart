import 'package:flutter/material.dart';

import 'package:summit/core/theme/app_colors.dart';
import 'package:summit/core/theme/app_text_styles.dart';
import 'package:summit/shared/widgets/home_hero_header.dart';
import 'package:summit/shared/widgets/quick_stat_card.dart';
import 'package:summit/shared/widgets/workout_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const _quickStats = [
    QuickStat(
      icon: Icons.local_fire_department_outlined,
      value: '1,842',
      label: 'kcal',
    ),
    QuickStat(
      icon: Icons.trending_up,
      value: '+8%',
      label: 'load',
    ),
    QuickStat(
      icon: Icons.emoji_events_outlined,
      value: '12',
      label: 'streak',
    ),
  ];

  static const _recentWorkouts = [
    WorkoutEntry(
      icon: Icons.directions_run,
      label: 'Morning tempo run',
      date: 'Today',
      distance: '8.4 km',
      duration: '42 min',
      pace: '5:00/km',
    ),
    WorkoutEntry(
      icon: Icons.fitness_center,
      label: 'Upper body strength',
      date: 'Yesterday',
      duration: '55 min',
    ),
    WorkoutEntry(
      icon: Icons.directions_bike,
      label: 'Zone 2 ride',
      date: 'Jun 12',
      distance: '34.8 km',
      duration: '1h 28m',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final horizontalPadding = constraints.maxWidth > 640 ? 32.0 : 20.0;

            return SingleChildScrollView(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const HomeHeroHeader(
                        userName: 'Alex',
                        weekLabel: 'Week 24 summary',
                        workoutsCount: '5',
                        totalKm: '42.6',
                        totalTime: '4h 35m',
                        weekGoalPercent: 78,
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
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                        ),
                        child: const QuickStatsRow(stats: _quickStats),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          horizontalPadding,
                          28,
                          horizontalPadding,
                          12,
                        ),
                        child: const _SectionTitle(title: 'Recent Workouts'),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                          horizontalPadding,
                          0,
                          horizontalPadding,
                          24,
                        ),
                        child: Column(
                          children: [
                            for (final workout in _recentWorkouts) ...[
                              WorkoutListItem(entry: workout),
                              if (workout != _recentWorkouts.last)
                                const SizedBox(height: 10),
                            ],
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
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
