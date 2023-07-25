import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/common_widgets/custom_cardview.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import '../../../../common_widgets/buttons.dart';
import '../../../../common_widgets/text_widgets.dart';
import '../../../../utils/common.dart';
import '../../../../utils/dimens/dimens.dart';
import 'login_form.dart';

class QpSkeletonLoginPage extends StatefulWidget {
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
  State<QpSkeletonLoginPage> createState() => _QpSkeletonLoginPageState();
}

class _QpSkeletonLoginPageState extends State<QpSkeletonLoginPage> {
  late GlobalKey<FormState> loginFormKey;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginFormKey = GlobalKey<FormState>();
  }

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
                      QpTitleTextBlackWidget(widget.loginHeader,
                          style: widget.headerTextStyle),
                      VP(size: Dimens.d15.responsive()),
                      Form(
                        key: loginFormKey,
                        child: LoginForm(
                          onChangedSecondField: widget.onChangedSecondField,
                          onChangedFirstField: widget.onChangedFirstField,
                          firstTextFieldHint: widget.firstTextFieldHint,
                          secondTextFieldHint: widget.secondTextFieldHint,
                        ),
                      ),
                      VP(size: Dimens.d20.responsive()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RememberMe(
                            onChangedRememberMe: widget.onChangedRememberMe,
                            selectedRememberMe: widget.selectedRememberMe,
                            bodyTextStyle: widget.bodyTextStyle,
                          ),
                          QpBodyTextWidget(
                            "Forgot password",
                            onTap: widget.forgetPasswordOnTap,
                            textStyle: widget.bodyTextStyle,
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
                              btnColor: widget.btnColor,
                              btnText: widget.buttonText1,
                              onTap: () {
                                if (loginFormKey.currentState != null &&
                                    loginFormKey.currentState!.validate()) {
                                  Common.hideKeyboard();
                                  if (widget.onLogin != null) {
                                    widget.onLogin!();
                                  }
                                  debugPrint("LoggedIn");
                                } else if (loginFormKey.currentState != null) {
                                  loginFormKey.currentState!.validate();
                                }
                              },
                              style: widget.btnTextStyle,
                            ),
                            VP(size: Dimens.d15.responsive()),
                            QpRectangularCircleButton(
                              btnColor: widget.btnColor,
                              btnText: widget.buttonText2,
                              iconData: Icons.qr_code_scanner,
                              onTap: () {
                                if (widget.onLoginWithScanner != null) {
                                  widget.onLoginWithScanner!();
                                }
                              },
                              style: widget.btnTextStyle,
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
