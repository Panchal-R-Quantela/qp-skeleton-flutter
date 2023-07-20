import 'package:flutter/material.dart';

import 'app_colors.dart';

/// define custom themes here
final lightTheme = ThemeData(
    brightness: Brightness.light,
    splashColor: Colors.transparent,
    inputDecorationTheme: inputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.current.primaryColor,
      selectionColor: AppColors.current.primaryTextColor,
    ))
  ..addAppColor(
    AppThemeType.light,
    AppColors.defaultAppColor,
  );

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    splashColor: Colors.transparent,
    inputDecorationTheme: inputDecorationTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.current.primaryColor,
      selectionColor: AppColors.current.primaryTextColor,
    ))
  ..addAppColor(
    AppThemeType.dark,
    AppColors.darkThemeColor,
  );

enum AppThemeType { light, dark }

extension ThemeDataExtensions on ThemeData {
  static final Map<AppThemeType, AppColors> _appColorMap = {};

  void addAppColor(AppThemeType type, AppColors appColor) {
    _appColorMap[type] = appColor;
  }

  AppColors get appColor {
    return _appColorMap[AppThemeSetting.currentAppThemeType] ??
        AppColors.defaultAppColor;
  }
}

class AppThemeSetting {
  const AppThemeSetting._();

  static late AppThemeType currentAppThemeType = AppThemeType.light;
}

var inputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: AppColors.current.secondaryTextColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: AppColors.current.secondaryTextColor),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide:
          BorderSide(width: 1, color: AppColors.current.secondaryTextColor),
    ),
    errorBorder: const OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.redAccent),
    ));
