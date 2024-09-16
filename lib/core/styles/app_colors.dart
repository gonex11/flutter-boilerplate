import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color primary = const Color(0xFF49ADE1);
  static Color transparent = const Color(0x00000000);
  static Color white = const Color(0xFFFFFFFF);
  static Color black = const Color(0xFF2E2E2E);
  static Color grey = const Color(0xFF828282);
  static Color placeholder = const Color(0xFFABABAB);
  static Color blueA20 = const Color(0xFFFFFFFF).withOpacity(0.16);
  static Color red = const Color(0xFFDD2419);
  static Color orange = const Color(0xFFFFAB00);
  static Color green = const Color(0xFF70C787);

  static Color lightBackground = const Color(0xFFF8F8F8);
  static Color lightText = black;
  static Color lightSurface = white;
  static Color lightDivider = const Color(0xFFE0E0E0);
  static Color lightDisabled = const Color(0x05000000);

  static Color darkBackground = const Color(0xFF121212);
  static Color darkText = white;
  static Color darkSurface = black;
  static Color darkDivider = const Color(0xFF444444);
  static Color darkDisabled = const Color(0x0DFFFFFF);

  static final ColorScheme lightScheme = ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    error: AppColors.red,
    onError: AppColors.white,
    surface: AppColors.lightBackground,
    onSurface: AppColors.lightText,
    surfaceBright: AppColors.lightSurface,
  );

  static final ColorScheme darkScheme = ColorScheme.dark(
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    error: AppColors.red,
    onError: AppColors.white,
    surface: AppColors.darkBackground,
    onSurface: AppColors.darkText,
    surfaceBright: AppColors.darkSurface,
  );
}
