import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';

class AppThemes {
  const AppThemes._();

  static final lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor, primary: AppColors.primaryColor),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: AppColors.primaryColor),
      appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          iconTheme: IconThemeData(color: AppColors.hintColor)),
      useMaterial3: true,
      fontFamily: GoogleFonts.roboto().fontFamily,
      textTheme: const TextTheme(
        displayLarge: TextStyle(color: AppColors.textColor),
        displayMedium: TextStyle(color: AppColors.textColor),
        displaySmall: TextStyle(color: AppColors.textColor),
        headlineMedium: TextStyle(color: AppColors.textColor),
        headlineSmall: TextStyle(color: AppColors.textColor),
        titleLarge: TextStyle(color: AppColors.textColor),
        titleMedium: TextStyle(color: AppColors.textColor),
        titleSmall: TextStyle(color: AppColors.textColor),
        bodyLarge: TextStyle(color: AppColors.textColor),
        bodyMedium: TextStyle(color: AppColors.textColor),
        bodySmall: TextStyle(color: AppColors.textColor),
        labelLarge: TextStyle(color: AppColors.textColor),
        labelSmall: TextStyle(color: AppColors.textColor),
      ));
}
