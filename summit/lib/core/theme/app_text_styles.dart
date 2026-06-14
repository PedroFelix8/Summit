import 'package:flutter/material.dart';

import 'package:summit/core/theme/app_colors.dart';

class AppTextStyles {
  static const greetingSubtitle = TextStyle(
    color: AppColors.mutedFg,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const heroName = TextStyle(
    color: AppColors.foreground,
    fontSize: 28,
    fontWeight: FontWeight.w800,
  );

  static const labelSm = TextStyle(
    color: AppColors.mutedFg,
    fontSize: 12,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
  );

  static const weekGoalPct = TextStyle(
    color: AppColors.primary,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const metricValue = TextStyle(
    color: AppColors.foreground,
    fontSize: 22,
    fontWeight: FontWeight.w800,
  );

  static const metricLabel = TextStyle(
    color: AppColors.mutedFg,
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  static const metricSubLabel = TextStyle(
    color: AppColors.mutedFg,
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  static const quickStatValue = TextStyle(
    color: AppColors.foreground,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  static const labelXs = TextStyle(
    color: AppColors.mutedFg,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.6,
  );

  static const bodySmRegular = TextStyle(
    color: AppColors.foreground,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const bodySmMuted = TextStyle(
    color: AppColors.mutedFg,
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
