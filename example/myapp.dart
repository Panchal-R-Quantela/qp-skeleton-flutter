import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/features/app/presentation/cubits/app_cubit.dart';
import 'package:qp_skeleton_flutter/features/app/presentation/cubits/app_state.dart';
import 'package:qp_skeleton_flutter/features/app/presentation/widgets/base_app.dart';
import 'package:qp_skeleton_flutter/utils/base_theme.dart';
import 'constants/color_constants.dart';
import 'constants/common_strings.dart';
import 'features/dashboard/presentation/dashboard.dart';
import 'features/workflow/presentation/cubits/work_flow_cubit.dart';
import 'routing/navigation_route.dart';
import 'features/workflow/injection_container.dart' as wf_sl;

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late ThemeMode currentTheme;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorkFlowCubit>(
            create: (_) => wf_sl.workflowSl<WorkFlowCubit>()),
      ],
      child: BaseMyApp(currentThemeMode: (value) {
        currentTheme = value;
      }, child:
          BlocBuilder<AppCubit, AppCubitState>(builder: (context, snapshot) {
        //Base AppCubit for Theme
        return MaterialApp(
          title: AppStrings.kAppName,
          themeMode: currentTheme,
          theme: BaseTheme.buildLightTheme(context,
              primaryColor: ColorConstants.colorPrimary,
              primaryColorDark: ColorConstants.colorPrimaryDark,
              secondaryColor: ColorConstants.colorSecondary),
          darkTheme: BaseTheme.buildDarkTheme(context),
          home: DashboardDemo(),
          navigatorKey: AppNavigationRouter.instance.navigatorKey,
        );
      })),
    );
  }
}
