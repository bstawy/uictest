import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/caching/caching_prefs_factory.dart';
import '../core/utils/app_constants.dart';

part 'app_config_state.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit() : super(AppConfigInitial());

  String currentLanguage = 'en';
  ThemeMode currentTheme = ThemeMode.light;
  bool themeIsDark = false;

  void getCachedConfiguration() {
    getTheme();
    getLanguage();
  }

  void getTheme() async {
    final String? data =
        await CachingPrefsFactory.readString(AppConstants.cachingThemeKey);

    if (data != null) {
      currentTheme =
          data == AppConstants.darkThemeKey ? ThemeMode.dark : ThemeMode.light;
      themeIsDark = currentTheme == ThemeMode.dark;
    }

    emit(ChangeTheme(currentTheme));
  }

  void changeTheme() async {
    currentTheme =
        currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    themeIsDark = currentTheme == ThemeMode.dark;
    await CachingPrefsFactory.writeString(
      key: AppConstants.cachingThemeKey,
      value:
          themeIsDark ? AppConstants.darkThemeKey : AppConstants.lightThemeKey,
    );
    emit(ChangeTheme(currentTheme));
  }

  void getLanguage() async {
    final String? data =
        await CachingPrefsFactory.readString(AppConstants.cachingLanguageKey);

    if (data != null) {
      currentLanguage = data;
    }

    final currentLocale = Locale(currentLanguage);
    emit(ChangeLanguage(currentLocale));
  }

  void changeLanguage(String language) async {
    await CachingPrefsFactory.writeString(
      key: AppConstants.cachingLanguageKey,
      value: language,
    );
    currentLanguage = language;
    final currentLocale = Locale(currentLanguage);
    emit(ChangeLanguage(currentLocale));
  }
}
