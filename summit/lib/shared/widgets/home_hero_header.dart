import 'package:flutter/material.dart';

import 'package:summit/core/theme/app_colors.dart';
import 'package:summit/core/theme/app_text_styles.dart';
import 'package:summit/shared/widgets/big_metric.dart';
import 'package:summit/shared/widgets/gradient_card.dart';
import 'package:summit/shared/widgets/gradient_progress_bar.dart';

class HomeHeroHeader extends StatelessWidget {
  const HomeHeroHeader({
    super.key,
    required this.userName,
    required this.weekLabel,
    required this.workoutsCount,
    required this.totalKm,
    required this.totalTime,
    required this.weekGoalPercent,
  });

  final String userName;
  final String weekLabel;
  final String workoutsCount;
  final String totalKm;
  final String totalTime;
  final double weekGoalPercent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      decoration: const BoxDecoration(
        gradient: AppGradients.hero,
        border: Border(
          bottom: BorderSide(color: AppColors.border),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Good morning', style: AppTextStyles.greetingSubtitle),
          const SizedBox(height: 2),
          Text(userName, style: AppTextStyles.heroName),
          const SizedBox(height: 16),
          GradientCard(
            gradient: AppGradients.cardAlt,
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    weekLabel.toUpperCase(),
                    style: AppTextStyles.labelSm,
                  ),
                ),
                const SizedBox(height: 12),
                IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BigMetric(value: workoutsCount, label: 'Workouts'),
                      const VerticalDivider(
                        color: AppColors.border,
                        thickness: 1,
                        width: 1,
                      ),
                      BigMetric(value: totalKm, label: 'km', sub: 'this week'),
                      const VerticalDivider(
                        color: AppColors.border,
                        thickness: 1,
                        width: 1,
                      ),
                      BigMetric(value: totalTime, label: 'Time'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Divider(color: AppColors.border, height: 1),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text('Weekly goal', style: AppTextStyles.labelSm),
                    const Spacer(),
                    Text(
                      '${weekGoalPercent.toInt()}%',
                      style: AppTextStyles.weekGoalPct,
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                GradientProgressBar(percent: weekGoalPercent, height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
