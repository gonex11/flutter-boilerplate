import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color primary = Color(0xFF49ADE1);
  static const Color transparent = Color(0x00000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF2E2E2E);
  static const Color grey = Color(0xFF828282);
  static const Color placeholder = Color(0xFFABABAB);
  static const Color blueA20 = Color(0x29FFFFFF);
  static const Color orange = Color(0xFFFFAB00);

  static const Color error = Color(0xFFDD2419);
  static const Color warning = Color(0xFFFFAB00);
  static const Color info = Color(0xFF2F80ED);
  static const Color success = Color(0xFF36B37E);

  static const Color lightBackground = Color(0xFFF8F8F8);
  static const Color lightText = black;
  static const Color lightSurface = white;
  static const Color lightDivider = Color(0xFFE0E0E0);
  static const Color lightDisabled = Color(0x05000000);

  static const Color darkBackground = Color(0xFF121212);
  static const Color darkText = white;
  static const Color darkSurface = black;
  static const Color darkDivider = Color(0xFF444444);
  static const Color darkDisabled = Color(0x0DFFFFFF);

  static const ColorScheme lightScheme = ColorScheme.light(
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    error: AppColors.error,
    onError: AppColors.white,
    surface: AppColors.lightBackground,
    onSurface: AppColors.lightText,
    surfaceBright: AppColors.lightSurface,
    onSurfaceVariant: AppColors.grey,
  );

  static const ColorScheme darkScheme = ColorScheme.dark(
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    error: AppColors.error,
    onError: AppColors.white,
    surface: AppColors.darkBackground,
    onSurface: AppColors.darkText,
    surfaceBright: AppColors.darkSurface,
    onSurfaceVariant: AppColors.grey,
  );
}
