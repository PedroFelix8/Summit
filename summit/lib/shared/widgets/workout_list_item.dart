import 'package:flutter/material.dart';

import 'package:summit/core/theme/app_colors.dart';
import 'package:summit/core/theme/app_text_styles.dart';
import 'package:summit/shared/widgets/gradient_card.dart';

class WorkoutEntry {
  const WorkoutEntry({
    required this.icon,
    required this.label,
    required this.date,
    this.distance,
    required this.duration,
    this.pace,
  });

  final IconData icon;
  final String label;
  final String date;
  final String? distance;
  final String duration;
  final String? pace;
}

class WorkoutListItem extends StatelessWidget {
  const WorkoutListItem({
    super.key,
    required this.entry,
    this.onTap,
  });

  final WorkoutEntry entry;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GradientCard(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                gradient: AppGradients.pill,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.iconBorder),
              ),
              child: Icon(entry.icon, size: 14, color: AppColors.mutedFg),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.label, style: AppTextStyles.bodySmRegular),
                  const SizedBox(height: 3),
                  _MetaRow(entry: entry),
                ],
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.chevron_right,
              size: 15,
              color: AppColors.mutedFg,
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const _MetaRow({required this.entry});

  final WorkoutEntry entry;

  @override
  Widget build(BuildContext context) {
    final parts = <String>[entry.date];
    if (entry.distance != null) parts.add(entry.distance!);
    parts.add(entry.duration);

    return Wrap(
      spacing: 5,
      children: [
        for (var i = 0; i < parts.length; i++) ...[
          if (i > 0)
            Text(
              '-',
              style: AppTextStyles.bodySmMuted.copyWith(
                color: AppColors.border,
              ),
            ),
          Text(parts[i], style: AppTextStyles.bodySmMuted),
        ],
      ],
    );
  }
}
