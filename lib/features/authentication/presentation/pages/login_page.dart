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
import '../../../../utils/global_keys.dart';
import '../../../app/app_state.dart';
import 'login_form.dart';

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

  final TextStyle? headerTextStyle;
  final TextStyle? bodyTextStyle;
  final TextStyle? btnTextStyle;
  final Color? btnColor;

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
      this.bodyTextStyle,
      this.btnTextStyle,
      this.headerTextStyle,
      this.btnColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      QpTitleTextBlackWidget(loginHeader,
                          style: headerTextStyle),
                      VP(size: Dimens.d15.responsive()),
                      LoginForm(
                        onChangedSecondField: onChangedSecondField,
                        onChangedFirstField: onChangedFirstField,
                        firstTextFieldHint: firstTextFieldHint,
                        secondTextFieldHint: secondTextFieldHint,
                      ),
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
                              btnColor: btnColor,
                              btnText: buttonText1,
                              onTap: () {
                                if (GlobalKeys.loginFormKey.currentState !=
                                        null &&
                                    GlobalKeys.loginFormKey.currentState!
                                        .validate()) {
                                  Common.hideKeyboard();
                                  if (onLogin != null) {
                                    onLogin!();
                                  }
                                  debugPrint("LoggedIn");
                                } else if (GlobalKeys
                                        .loginFormKey.currentState !=
                                    null) {
                                  GlobalKeys.loginFormKey.currentState!
                                      .validate();
                                }
                              },
                              style: btnTextStyle,
                            ),
                            VP(size: Dimens.d15.responsive()),
                            QpRectangularCircleButton(
                              btnColor: btnColor,
                              btnText: buttonText2,
                              iconData: Icons.qr_code_scanner,
                              onTap: () {
                                if (onLoginWithScanner != null) {
                                  onLoginWithScanner!();
                                }
                              },
                              style: btnTextStyle,
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
    );
  }
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
