import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/common.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(StateInitial());
  bool? isDarkTheme;

  Future<void> onAppThemeChanged({bool isDarkMode = false}) async {
    isDarkTheme ??= Common.isDarkMode();
    //_updateThemeSetting(isDarkTheme);
    emit(AppThemeState(isDarkTheme: isDarkTheme!));
    //debugPrint("Current Theme :: ${AppThemeSetting.currentAppThemeType}");
    debugPrint("Current Theme DarkMode:: ${isDarkTheme!}");
  }

/*  void _updateThemeSetting(bool isDarkTheme) {
    AppThemeSetting.currentAppThemeType =
        isDarkTheme ? AppThemeType.dark : AppThemeType.light;
  }*/
}
