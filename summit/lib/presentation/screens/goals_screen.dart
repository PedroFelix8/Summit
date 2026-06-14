import 'package:flutter/material.dart';

import 'package:summit/shared/widgets/section_placeholder.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionPlaceholder(
      icon: Icons.flag,
      title: 'Goals',
      subtitle: 'Weekly targets and milestones will appear here.',
    );
  }
}
