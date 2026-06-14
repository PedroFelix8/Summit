import 'package:flutter/material.dart';

import 'package:summit/shared/widgets/section_placeholder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SectionPlaceholder(
      icon: Icons.person,
      title: 'Profile',
      subtitle: 'Account, preferences, and connected services will appear here.',
    );
  }
}
