import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.surfaceLight,
      // background: AppColors.backgroundLight, // Deprecated
      error: AppColors.error,
    ),
    scaffoldBackgroundColor: AppColors.backgroundLight,
    textTheme: GoogleFonts.outfitTextTheme(ThemeData.light().textTheme).apply(
      bodyColor: AppColors.textPrimaryLight,
      displayColor: AppColors.textPrimaryLight,
    ),
    iconTheme: const IconThemeData(color: AppColors.textPrimaryLight),
    cardTheme: CardThemeData(
      color: AppColors.surfaceLight,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      secondary: AppColors.accent,
      surface: AppColors.surfaceDark,
      // background: AppColors.backgroundDark, // Deprecated
      error: AppColors.error,
    ),
    scaffoldBackgroundColor: AppColors.backgroundDark,
    textTheme: GoogleFonts.outfitTextTheme(ThemeData.dark().textTheme).apply(
      bodyColor: AppColors.textPrimaryDark,
      displayColor: AppColors.textPrimaryDark,
    ),
    iconTheme: const IconThemeData(color: AppColors.textPrimaryDark),
    cardTheme: CardThemeData(
      color: AppColors.surfaceDark,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
