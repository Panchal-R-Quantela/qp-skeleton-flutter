import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/styles/app_themes.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(StateInitial());
  bool isDarkTheme = false;

  Future<void> onAppThemeChanged({bool isDarkMode = false}) async {
    isDarkTheme = isDarkMode;
    _updateThemeSetting(isDarkTheme);
    emit(AppThemeState(isDarkTheme: isDarkTheme));
    debugPrint("Current Theme :: ${AppThemeSetting.currentAppThemeType}");
  }

  void _updateThemeSetting(bool isDarkTheme) {
    AppThemeSetting.currentAppThemeType =
        isDarkTheme ? AppThemeType.dark : AppThemeType.light;
  }
}
