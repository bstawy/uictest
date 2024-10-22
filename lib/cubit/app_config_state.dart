part of 'app_config_cubit.dart';

sealed class AppConfigState {}

final class AppConfigInitial extends AppConfigState {}

final class ChangeTheme implements AppConfigState {
  final ThemeMode themeMode;
  ChangeTheme(this.themeMode);
}
