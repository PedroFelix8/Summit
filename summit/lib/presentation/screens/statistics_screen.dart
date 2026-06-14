import 'package:flutter/material.dart';

import 'package:summit/shared/widgets/section_placeholder.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionPlaceholder(
      icon: Icons.bar_chart,
      title: 'Statistics',
      subtitle: 'Performance trends and training insights will appear here.',
    );
  }
}
