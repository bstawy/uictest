import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../app_config_cubit/app_config_cubit.dart';

class GetConfigs {
  static bool isArabicLanguage(BuildContext context) {
    return context.read<AppConfigCubit>().currentLanguage == 'ar';
  }

  static bool themeIsDark(BuildContext context) {
    return context.read<AppConfigCubit>().currentTheme == ThemeMode.dark;
  }
}
