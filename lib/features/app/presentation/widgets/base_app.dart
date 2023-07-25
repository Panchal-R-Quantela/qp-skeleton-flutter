import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qp_skeleton_flutter/features/app/presentation/cubits/app_cubit.dart';
import 'package:qp_skeleton_flutter/features/app/presentation/cubits/app_state.dart';
import 'package:qp_skeleton_flutter/features/app/injection_container_app.dart'
    as appSl;
import 'package:qp_skeleton_flutter/utils/base_theme.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/device_constants.dart';

class BaseMyApp extends StatefulWidget {
  final Widget child;
  final Function currentThemeMode;

  BaseMyApp({super.key, required this.child, required this.currentThemeMode});

  @override
  State<BaseMyApp> createState() => _BaseMyAppState();
}

class _BaseMyAppState extends State<BaseMyApp> {
  bool isWidgetBind = false;
  bool isDarkThemeState = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (!isWidgetBind) {
      AppDimen.of(context);
      isWidgetBind = true;
    }

    return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
              create: (_) => appSl.appSl<AppCubit>()..onAppThemeChanged()),
        ],
        child: BlocBuilder<AppCubit, AppCubitState>(builder: (context, state) {
          if (state is AppThemeState) {
            isDarkThemeState = state.isDarkTheme;
            debugPrint("Main View Bind ----> isDarkMode : :$isDarkThemeState");
            widget.currentThemeMode(
                isDarkThemeState ? ThemeMode.dark : ThemeMode.light);
          }
          return ScreenUtilInit(
            designSize: const Size(DeviceConstants.designDeviceWidth,
                DeviceConstants.designDeviceHeight),
            builder: (context, child) {
              return widget.child;

              /*return MaterialApp(
                title: AppStrings.kAppName,
                themeMode: isDarkThemeState ? ThemeMode.dark : ThemeMode.light,
                theme: BaseTheme.buildLightTheme(context,
                    primaryColor: ColorConstants.colorPrimary,
                    primaryColorDark: ColorConstants.colorPrimaryDark,
                    secondaryColor: ColorConstants.colorSecondary),
                darkTheme: BaseTheme.buildDarkTheme(context),
                home: DashboardDemo(),
                navigatorKey: AppNavigationRouter.instance.navigatorKey,
              );*/
            },
          );
        }));
  }
}
