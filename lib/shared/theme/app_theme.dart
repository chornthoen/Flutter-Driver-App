import 'package:flutter/material.dart';

import '../colors/app_colors.dart';
import '../spacing/app_spacing.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    useMaterial3: false,
    fontFamily: 'Kantumruy Pro',
    appBarTheme: const AppBarTheme(color: AppColors.kPrimaryColor),
    colorScheme: const ColorScheme.light(
      primary: AppColors.kPrimaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: AppColors.kBackground,
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.lg,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSpacing.sm),
        ),
        elevation: 0,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppSpacing.sm),
      ),
      isDense: true,
    ),
    iconTheme: const IconThemeData(size: AppSpacing.lg),
  );
}

extension CustomTheme on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;
}
