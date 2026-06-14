import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:summit/core/theme/app_colors.dart';

class MainNavigationShell extends StatelessWidget {
  const MainNavigationShell({
    super.key,
    required this.child,
  });

  final Widget child;

  static const _items = [
    _NavigationItem(
      label: 'Home',
      path: '/home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    _NavigationItem(
      label: 'Training',
      path: '/training',
      icon: Icons.directions_run_outlined,
      activeIcon: Icons.directions_run,
    ),
    _NavigationItem(
      label: 'Stats',
      path: '/statistics',
      icon: Icons.bar_chart_outlined,
      activeIcon: Icons.bar_chart,
    ),
    _NavigationItem(
      label: 'Goals',
      path: '/goals',
      icon: Icons.flag_outlined,
      activeIcon: Icons.flag,
    ),
    _NavigationItem(
      label: 'Profile',
      path: '/profile',
      icon: Icons.person_outline,
      activeIcon: Icons.person,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    final currentIndex = _items.indexWhere((item) => item.path == location);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex < 0 ? 0 : currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.card,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.mutedFg,
        showUnselectedLabels: true,
        onTap: (index) => context.go(_items[index].path),
        items: [
          for (final item in _items)
            BottomNavigationBarItem(
              icon: Icon(item.icon),
              activeIcon: Icon(item.activeIcon),
              label: item.label,
            ),
        ],
      ),
    );
  }
}

class _NavigationItem {
  const _NavigationItem({
    required this.label,
    required this.path,
    required this.icon,
    required this.activeIcon,
  });

  final String label;
  final String path;
  final IconData icon;
  final IconData activeIcon;
}
