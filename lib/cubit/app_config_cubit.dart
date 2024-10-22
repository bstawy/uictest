import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_config_state.dart';

class AppConfigCubit extends Cubit<AppConfigState> {
  AppConfigCubit() : super(AppConfigInitial());

  ThemeMode currentTheme = ThemeMode.system;

  void getTheme() {
    emit(ChangeTheme(currentTheme));
  }

  void changeTheme() {
    currentTheme =
        currentTheme == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(ChangeTheme(currentTheme));
  }
}
