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
import 'features/authentication/presentation/cubit/auth_cubit.dart';
import 'features/splash/splash_screen.dart';
import 'features/users/injection_container_users.dart' as userSl;
import 'features/authentication/injection_container_auth.dart' as authSl;
import 'features/users/presentation/cubit/user_cubit.dart';

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
              create: (_) => authSl.authSl<AppCubit>()..onAppThemeChanged()),
          BlocProvider<AuthCubit>(create: (_) => authSl.authSl<AuthCubit>()),
          BlocProvider<UserCubit>(create: (_) => userSl.userSl<UserCubit>())
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
                //themeMode: ThemeMode.system,
                theme: lightTheme,
                darkTheme: darkTheme,
                /*theme: BaseTheme.buildLightTheme(),
                      darkTheme: BaseTheme.buildDarkTheme(),
                      themeMode: ThemeMode.system,
                      initialRoute: '/',
                      onGenerateRoute: NavigationRoute.getRoute,*/
                home: SplashScreen(),
                navigatorKey: AppNavigationRouter.instance.navigatorKey,
              );
            },
          );
        }));
  }
}
