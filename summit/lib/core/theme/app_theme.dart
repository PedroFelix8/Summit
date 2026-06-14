import 'package:flutter/material.dart';

import 'package:summit/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    cardColor: AppColors.card,
    dividerColor: AppColors.border,
    primaryColor: AppColors.primary,

    colorScheme: const ColorScheme.dark(
      background: AppColors.background,
      primary: AppColors.primary,
      onPrimary: AppColors.primaryFg,
      secondary: AppColors.secondary,
      surface: AppColors.card,
      onSurface: AppColors.foreground,
      error: AppColors.destructive,
    ),

    textTheme: const TextTheme(
      headlineSmall: TextStyle(
        color: AppColors.foreground,
        fontWeight: FontWeight.w700,
      ),
      bodyMedium: TextStyle(color: AppColors.foreground),
      bodySmall: TextStyle(color: AppColors.mutedText),
    ),
  );
}
