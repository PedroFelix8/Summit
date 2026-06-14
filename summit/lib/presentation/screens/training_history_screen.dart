import 'package:flutter/material.dart';

import 'package:summit/shared/widgets/section_placeholder.dart';

class TrainingHistoryScreen extends StatelessWidget {
  const TrainingHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionPlaceholder(
      icon: Icons.directions_run,
      title: 'Training',
      subtitle: 'Your workout history and training plan will appear here.',
    );
  }
}
