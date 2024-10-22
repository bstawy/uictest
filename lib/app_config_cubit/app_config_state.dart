part of 'app_config_cubit.dart';

sealed class AppConfigState {}

final class AppConfigInitial extends AppConfigState {}

final class ChangeTheme extends AppConfigState {
  final ThemeMode themeMode;
  ChangeTheme(this.themeMode);
}

final class ChangeLanguage extends AppConfigState {
  final Locale currentLocale;
  ChangeLanguage(this.currentLocale);
}
