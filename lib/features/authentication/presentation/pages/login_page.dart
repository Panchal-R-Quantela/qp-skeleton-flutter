import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/common_widgets/custom_cardview.dart';
import 'package:qp_skeleton_flutter/common_widgets/edit_text_field.dart';
import 'package:qp_skeleton_flutter/features/app/app_bloc.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import '../../../../common_widgets/buttons.dart';
import '../../../../common_widgets/text_widgets.dart';
import '../../../../utils/common.dart';
import '../../../../utils/dimens/dimens.dart';
import '../../../../utils/styles/app_colors.dart';
import '../../../../utils/styles/app_text_styles.dart';
import '../../../app/app_state.dart';

class QpSkeletonLoginPage extends StatelessWidget {
  final String loginHeader;
  final String firstTextFieldHint;
  final String secondTextFieldHint;
  final String buttonText1;
  final String buttonText2;
  final ValueChanged<String>? onChangedFirstField;
  final ValueChanged<String>? onChangedSecondField;
  final Function? onLogin;
  final Function? onLoginWithScanner;
  final bool selectedRememberMe;
  final ValueChanged<bool>? onChangedRememberMe;
  final GestureTapCallback? forgetPasswordOnTap;

  final TextStyle? bodyTextStyle;

  QpSkeletonLoginPage(
      {Key? key,
      this.loginHeader = "Title",
      this.onChangedSecondField,
      this.onChangedFirstField,
      this.onLogin,
      this.firstTextFieldHint = "Email",
      this.buttonText1 = "Login",
      this.buttonText2 = "Login with Touch ID",
      this.secondTextFieldHint = "Password",
      this.onChangedRememberMe,
      this.selectedRememberMe = false,
      this.onLoginWithScanner,
      this.forgetPasswordOnTap,
      this.bodyTextStyle})
      : super(key: key);

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: loginFormKey,
        child: Center(
          /** Card Widget **/
          child: Container(
            margin: EdgeInsets.all(Dimens.d14.responsive()),
            child: CustomCardViewWidget(
              child: SizedBox(
                height: 400,
                child: SingleChildScrollView(
                  child: SymPadding(
                    padding: Dimens.d18.responsive(),
                    child: Column(
                      children: [
                        QpTitleTextBlackWidget(loginHeader),
                        VP(size: Dimens.d15.responsive()),
                        bindRow(
                            icon: Icons.person,
                            child: QpEmailTextFormField(
                              hintText: firstTextFieldHint,
                              onChanged: onChangedFirstField,
                            )),
                        const VP(),
                        bindRow(
                            icon: Icons.lock,
                            child: QpPasswordTextFormField(
                              hintText: secondTextFieldHint,
                              onChanged: onChangedSecondField,
                            )),
                        VP(size: Dimens.d20.responsive()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RememberMe(
                              onChangedRememberMe: onChangedRememberMe,
                              selectedRememberMe: selectedRememberMe,
                              bodyTextStyle: bodyTextStyle,
                            ),
                            QpBodyTextWidget(
                              "Forgot password",
                              onTap: forgetPasswordOnTap,
                              textStyle: bodyTextStyle,
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: Dimens.d24.responsive(),
                              vertical: Dimens.d15.responsive()),
                          child: Column(
                            children: [
                              QpRectangularCircleButton(
                                btnText: buttonText1,
                                onTap: () {
                                  if (loginFormKey.currentState != null &&
                                      loginFormKey.currentState!.validate()) {
                                    Common.hideKeyboard();
                                    if (onLogin != null) {
                                      onLogin!();
                                    }
                                    debugPrint("LoggedIn");
                                  } else if (loginFormKey.currentState !=
                                      null) {
                                    loginFormKey.currentState!.validate();
                                  }
                                },
                              ),
                              VP(size: Dimens.d15.responsive()),
                              QpRectangularCircleButton(
                                btnText: buttonText2,
                                iconData: Icons.qr_code_scanner,
                                onTap: () {
                                  if (onLoginWithScanner != null) {
                                    onLoginWithScanner!();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ), //Padding
              ),
            ),
          ), //Card
        ),
      ),
    );
  }
}

Widget bindRow({required IconData icon, required Widget child}) {
  return Row(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Icon(
          icon,
          size: Dimens.d24.responsive(),
        ),
      ),
      const HP(),
      Expanded(child: child)
    ],
  );
}

class RememberMe extends StatefulWidget {
  bool selectedRememberMe;
  final ValueChanged<bool>? onChangedRememberMe;
  final TextStyle? bodyTextStyle;

  RememberMe(
      {Key? key,
      this.selectedRememberMe = false,
      this.onChangedRememberMe,
      this.bodyTextStyle})
      : super(key: key);

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  late bool isRememberMe;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isRememberMe = widget.selectedRememberMe;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 25.0,
          width: 25.0,
          child: Checkbox(
            value: isRememberMe,
            onChanged: (value) {
              setState(() {
                isRememberMe = !isRememberMe;
                if (widget.onChangedRememberMe != null) {
                  widget.onChangedRememberMe!(isRememberMe);
                }
              });
            },
          ),
        ),
        const HP(size: 5),
        QpBodyTextWidget(
          "Remember Me?",
          textStyle: widget.bodyTextStyle,
        )
      ],
    );
  }
}

//
// class ThemeChangeWidget extends StatelessWidget {
//   const ThemeChangeWidget({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AppCubit, AppCubitState>(
//       buildWhen: (previous, current) {
//         return current is AppThemeState;
//       },
//       builder: (context, state) {
//         return SizedBox(
//           width: 150,
//           child: SwitchListTile.adaptive(
//             title: Text(
//               "Dark Mode",
//               style: AppTextStyles.s14w400Primary(),
//             ),
//             tileColor: AppColors.current.primaryColor,
//             value: (state as AppThemeState).isDarkTheme,
//             onChanged: (isDarkTheme) => context
//                 .read<AppCubit>()
//                 .onAppThemeChanged(isDarkMode: isDarkTheme),
//           ),
//         );
//       },
//     );
//   }
// }
