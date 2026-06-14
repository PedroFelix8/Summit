import 'package:flutter/material.dart';

class AppColors {
  static const background = Color(0xFF0B0F17);
  static const foreground = Color(0xFFF8FAFC);

  static const card = Color(0xFF141A24);
  static const secondary = Color(0xFF1E293B);

  static const muted = Color(0xFF253044);
  static const mutedFg = Color(0xFF94A3B8);
  static const mutedText = Color(0xFF94A3B8);

  static const border = Color(0xFF2F3A4F);
  static const iconBorder = Color(0xFF3B465A);

  static const primary = Color(0xFF38BDF8);
  static const primaryFg = Color(0xFF07111F);
  static const destructive = Color(0xFFEF4444);
}

class AppGradients {
  static const hero = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0xFF111827),
      AppColors.background,
    ],
  );

  static const card = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF182033),
      Color(0xFF101722),
    ],
  );

  static const cardAlt = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF1A2638),
      Color(0xFF121A29),
    ],
  );

  static const pill = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xFF243247),
      Color(0xFF172033),
    ],
  );
}
