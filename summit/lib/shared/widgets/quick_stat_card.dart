import 'package:flutter/material.dart';

import 'package:summit/core/theme/app_colors.dart';
import 'package:summit/core/theme/app_text_styles.dart';
import 'package:summit/shared/widgets/gradient_card.dart';

class QuickStat {
  const QuickStat({
    required this.icon,
    required this.value,
    required this.label,
  });
  final IconData icon;
  final String value;
  final String label;
}

/// Translated from the "Quick stats row" section of S1Home.tsx.
/// Renders 3 stat cards side by side.
class QuickStatsRow extends StatelessWidget {
  const QuickStatsRow({super.key, required this.stats});

  final List<QuickStat> stats;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: stats.map((s) {
        final isLast = s == stats.last;
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: isLast ? 0 : 8),
            child: GradientCard(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(s.icon, size: 13, color: AppColors.mutedFg),
                  const SizedBox(height: 6),
                  Text(s.value, style: AppTextStyles.quickStatValue),
                  const SizedBox(height: 3),
                  Text(
                    s.label.toUpperCase(),
                    style: AppTextStyles.labelXs,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
