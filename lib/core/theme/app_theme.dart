import 'package:flutter/material.dart';

import 'custom_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: CustomColors.whiteLight,
    colorScheme: ColorScheme.fromSeed(
      seedColor: CustomColors.purple,
      primary: CustomColors.purple,
      surface: CustomColors.whiteLight,
      onSurface: CustomColors.dark,
      onInverseSurface: CustomColors.grey,
      surfaceContainer: Colors.white,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: CustomColors.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: CustomColors.purple,
      primary: CustomColors.purple,
      surface: CustomColors.dark,
      onSurface: CustomColors.white,
      onInverseSurface: CustomColors.lightGrey,
      surfaceContainer: CustomColors.darkGrey,
    ),
  );
}
