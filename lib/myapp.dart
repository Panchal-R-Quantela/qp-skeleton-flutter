import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qp_skeleton_flutter/routing/navigation_route.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/device_constants.dart';
import 'package:qp_skeleton_flutter/utils/styles/app_colors.dart';
import 'package:qp_skeleton_flutter/utils/styles/app_themes.dart';
import 'constants/common_strings.dart';
import 'features/app/app_bloc.dart';
import 'features/app/app_state.dart';
import 'features/splash/splash_screen.dart';
import 'features/app/injection_container_app.dart' as appSl;

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
      AppColors.of(context);
      isWidgetBind = true;
    }

    return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
              create: (_) => appSl.appSl<AppCubit>()..onAppThemeChanged()),
          //BlocProvider<AuthCubit>(create: (_) => authSl.authSl<AuthCubit>()),
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
                theme: lightTheme,
                darkTheme: darkTheme,
                home: SplashScreen(),
                navigatorKey: AppNavigationRouter.instance.navigatorKey,
              );
            },
          );
        }));
  }
}
