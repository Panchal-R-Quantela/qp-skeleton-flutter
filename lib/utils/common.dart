import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qp_skeleton_flutter/utils/global_keys.dart';
import 'package:qp_skeleton_flutter/utils/styles/app_themes.dart';

class Common {
  static void showToast({required String msg, int timeInSec = 1}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: timeInSec,
    );
  }

  static hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static bool isDarkMode() {
    return AppThemeSetting.currentAppThemeType == AppThemeType.dark;
    /*var brightness = SchedulerBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return isDarkMode;*/
  }

  static openDrawer() {
    if (!GlobalKeys.scaffoldDashBoardKey.currentState!.isDrawerOpen) {
      GlobalKeys.scaffoldDashBoardKey.currentState!.openDrawer();
    }
  }

  static closeDrawer() {
    if (GlobalKeys.scaffoldDashBoardKey.currentState!.isDrawerOpen) {
      GlobalKeys.scaffoldDashBoardKey.currentState!.closeDrawer();
    }
  }
}
