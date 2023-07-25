import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../utils/common.dart';
import 'app_state.dart';

class AppCubit extends Cubit<AppCubitState> {
  AppCubit() : super(StateInitial());
  bool? isDarkTheme;

  Future<void> onAppThemeChanged({bool isDarkMode = false}) async {
    if (isDarkTheme == null) {
      isDarkTheme ??= Common.isDarkMode();
    } else {
      isDarkTheme = isDarkMode;
    }

    emit(AppThemeState(isDarkTheme: isDarkTheme!));
    debugPrint("Current Theme DarkMode:: ${isDarkTheme!}");
  }
}
