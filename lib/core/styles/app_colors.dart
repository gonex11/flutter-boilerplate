import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static Color primary = Color(0xFF49ADE1);
  static Color transparent = Color(0x00000000);
  static Color white = Color(0xFFFFFFFF);
  static Color black = Color(0xFF2E2E2E);
  static Color grey = Color(0xFF828282);
  static Color placeholder = Color(0xFFABABAB);
  static Color blueA20 = Color(0xFFFFFFFF).withOpacity(0.16);
  static Color red = Color(0xFFDD2419);
  static Color orange = Color(0xFFFFAB00);
  static Color green = Color(0xFF70C787);

  static Color lightBackground = Color(0xFFF8F8F8);
  static Color lightText = black;
  static Color lightSurface = white;
  static Color lightDivider = Color(0xFFE0E0E0);
  static Color lightDisabled = Color(0x05000000);

  static Color darkBackground = Color(0xFF121212);
  static Color darkText = white;
  static Color darkSurface = black;
  static Color darkDivider = Color(0xFF333333);
  static Color darkDisabled = Color(0x0DFFFFFF);

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
