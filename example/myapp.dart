import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qp_skeleton_flutter/features/app/app_bloc.dart';
import 'package:qp_skeleton_flutter/features/app/app_state.dart';
import 'package:qp_skeleton_flutter/features/app/injection_container_app.dart'
    as appSl;
import 'package:qp_skeleton_flutter/utils/base_theme.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/device_constants.dart';
import 'constants/common_strings.dart';
import 'features/splash/splash_screen.dart';
import 'routing/navigation_route.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isWidgetBind = false;
  bool isDarkThemeState = false;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (!isWidgetBind) {
      AppDimen.of(context);
      //AppColors.of(context);
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
          }
          return ScreenUtilInit(
            designSize: const Size(DeviceConstants.designDeviceWidth,
                DeviceConstants.designDeviceHeight),
            builder: (context, child) {
              return MaterialApp(
                title: AppStrings.kAppName,
                themeMode: isDarkThemeState ? ThemeMode.dark : ThemeMode.light,
                theme: BaseTheme.buildLightTheme(context),
                darkTheme: BaseTheme.buildDarkTheme(context),
                home: SplashScreen(),
                navigatorKey: AppNavigationRouter.instance.navigatorKey,
              );
            },
          );
        }));
  }
}
