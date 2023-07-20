import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/features/app/app_bloc.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import '../../../../common_widgets/text_widgets.dart';
import '../../../../utils/dimens/dimens.dart';
import '../../../../utils/styles/app_colors.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../app/app_state.dart';
import '../widgets/login_screen.dart';

class QpSkeletonLoginPage extends StatelessWidget {
  final String? assetImagePath;
  final String? loginHeader;
  final String? firstTextFieldHint;
  final String? secondTextFieldHint;
  final String? buttonText;
  final ValueChanged<String>? onChangedFirstField;
  final ValueChanged<String>? onChangedSecondField;
  final Widget? imageAssetWidget;

  QpSkeletonLoginPage(
      {Key? key,
      this.assetImagePath,
      this.loginHeader,
      this.buttonText,
      this.secondTextFieldHint,
      this.firstTextFieldHint,
      this.onChangedFirstField,
      this.onChangedSecondField,
      this.imageAssetWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  imageAssetWidget ??
                      Image.asset(
                        assetImagePath ?? "assets/coffeback.jpg",
                        height: MediaQuery.of(context).size.height / 2.5,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.fitWidth,
                      ),
                  const ThemeChangeWidget()
                ],
              ),
              LoginForm(
                buttonText: buttonText,
                firstTextFieldHint: firstTextFieldHint,
                loginHeader: loginHeader,
                onChangedFirstField: onChangedFirstField,
                onChangedSecondField: onChangedSecondField,
                secondTextFieldHint: secondTextFieldHint,
              ),
              VP(size: Dimens.d30.responsive()),
              const LoginIssueSignUp()
            ],
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
        return SizedBox(
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
