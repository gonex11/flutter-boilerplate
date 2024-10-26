import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/styles/app_colors.dart';
import 'package:flutter_boilerplate/shared/styles/app_fonts.dart';

abstract class AppThemes {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: AppColors.lightScheme,
    dividerColor: AppColors.lightDivider,
    dividerTheme: const DividerThemeData(
      color: AppColors.lightDivider,
    ),
    disabledColor: AppColors.lightDisabled,
    appBarTheme: AppBarTheme(
      color: AppColors.lightScheme.surfaceBright,
      surfaceTintColor: AppColors.transparent,
      elevation: 0,
      titleTextStyle: AppFonts.lgSemiBold.copyWith(
        color: AppColors.lightScheme.onSurface,
      ),
      shape: const Border(
        bottom: BorderSide(
          color: AppColors.lightDivider,
          width: 1,
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.lightScheme.surfaceBright,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightScheme.primary,
      foregroundColor: AppColors.lightScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: AppFonts.smRegular,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.lightDivider,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.lightDivider,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.lightScheme.primary,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.lightScheme.error,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.lightScheme.error,
          width: 1,
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: AppColors.darkScheme,
    dividerColor: AppColors.darkDivider,
    dividerTheme: const DividerThemeData(
      color: AppColors.darkDivider,
    ),
    disabledColor: AppColors.darkDisabled,
    appBarTheme: AppBarTheme(
      color: AppColors.darkScheme.surface,
      surfaceTintColor: AppColors.transparent,
      elevation: 0,
      titleTextStyle: AppFonts.lgSemiBold.copyWith(
        color: AppColors.darkScheme.onSurface,
      ),
      shape: const Border(
        bottom: BorderSide(
          color: AppColors.darkDisabled,
          width: 1,
        ),
      ),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.darkScheme.surfaceBright,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkScheme.primary,
      foregroundColor: AppColors.darkScheme.onPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: AppFonts.smRegular,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.darkDivider,
          width: 1,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.darkDivider,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(
          color: AppColors.white,
          width: 1,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.darkScheme.error,
          width: 1,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.darkScheme.error,
          width: 1,
        ),
      ),
    ),
  );
}
