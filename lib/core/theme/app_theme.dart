import 'package:flutter/material.dart';

import 'custom_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.light,
      seedColor: CustomColors.purple,
      primary: CustomColors.purple,
      primaryFixed: CustomColors.purple,
      inversePrimary: Colors.white,
      onPrimary: CustomColors.purple,
      onPrimaryContainer: CustomColors.lighterGrey,
      surface: CustomColors.whiteLight,
      onSurface: CustomColors.dark,
      onInverseSurface: CustomColors.grey,
      surfaceContainer: Colors.white,
      surfaceContainerHigh: Colors.white.withOpacity(0.8),
      surfaceContainerHighest: const Color(0xFFF0F0F0).withOpacity(0.4),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.transparent,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: CustomColors.purple,
      primary: CustomColors.white,
      primaryFixed: CustomColors.lightPurple,
      inversePrimary: Colors.white.withOpacity(0.1),
      onPrimary: CustomColors.lightPurple,
      onPrimaryContainer: CustomColors.darkGrey,
      surface: CustomColors.dark,
      onSurface: CustomColors.white,
      onInverseSurface: CustomColors.lightGrey,
      surfaceContainer: CustomColors.darkGrey,
      surfaceContainerHigh: const Color(0xff26233A).withOpacity(0.4),
      surfaceContainerHighest: const Color(0xff26233A).withOpacity(0.4),
    ),
  );
}
