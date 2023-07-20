import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/features/app/app_bloc.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import '../../../../common_widgets/buttons.dart';
import '../../../../common_widgets/edit_text_field.dart';
import '../../../../common_widgets/text_widgets.dart';
import '../../../../constants/common_strings.dart';
import '../../../../constants/image_path.dart';
import '../../../../routing/navigation_route.dart';
import '../../../../routing/route_name.dart';
import '../../../../utils/common.dart';
import '../../../../utils/dimens/dimens.dart';
import '../../../../utils/global_keys.dart';
import '../../../../utils/styles/app_colors.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../app/app_state.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_cubit_states.dart';
import '../widgets/login_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocListener<AuthCubit, AuthCubitState>(
            listener: (context, state) {
              if (state is LoginSuccessState) {
                Common.showToast(msg: state.msg);
                // AppNavigationRouter.instance.pushAndRemoveUntil(
                //     NavigationRoute.getRoute(RouteName.homePage),
                //     untilRoute: RouteName.loginPage);
                AppNavigationRouter.instance.push(
                  NavigationRoute.getRoute(RouteName.homePage),
                );
              } else if (state is LoginErrorState) {
                Common.showToast(msg: state.msg);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    Image.asset(
                      ImagePath.kOnBoardingLogo2,
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.fitWidth,
                    ),
                    ThemeChangeWidget()
                  ],
                ),
                const LoginForm(),
                VP(size: Dimens.d30.responsive()),
                const LoginIssueSignUp()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ThemeChangeWidget extends StatelessWidget {
  const ThemeChangeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppCubitState>(
      buildWhen: (previous, current) {
        return current is AppThemeState;
      },
      builder: (context, state) {
        return Container(
          width: 150,
          child: SwitchListTile.adaptive(
            title: Text(
              "Dark Mode",
              style: AppTextStyles.s14w400Primary(),
            ),
            tileColor: AppColors.current.primaryColor,
            value: (state as AppThemeState).isDarkTheme,
            onChanged: (isDarkTheme) => context
                .read<AppCubit>()
                .onAppThemeChanged(isDarkMode: isDarkTheme),
          ),
        );
      },
    );
  }
}
