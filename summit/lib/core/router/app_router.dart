import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:summit/presentation/screens/goals_screen.dart';
import 'package:summit/presentation/screens/home_screen.dart';
import 'package:summit/presentation/screens/profile_screen.dart';
import 'package:summit/presentation/screens/statistics_screen.dart';
import 'package:summit/presentation/screens/training_history_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/training',
      builder: (context, state) => const TrainingHistoryScreen(),
    ),
    GoRoute(
      path: '/statistics',
      builder: (context, state) => const StatisticsScreen(),
    ),
    GoRoute(
      path: '/goals',
      builder: (context, state) => const GoalsScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfileScreen(),
    ),
  ],
);
