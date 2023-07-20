import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/utils/qp_app_strings.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/dimens.dart';
import '../../../../common_widgets/buttons.dart';
import '../../../../common_widgets/text_widgets.dart';
import '../../../../common_widgets/edit_text_field.dart';
import '../../../../utils/common.dart';

class LoginForm extends StatelessWidget {
  static GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final String? loginHeader;
  final String? firstTextFieldHint;
  final String? secondTextFieldHint;
  final String? buttonText;
  final ValueChanged<String>? onChangedFirstField;
  final ValueChanged<String>? onChangedSecondField;
  final Function? onSubmit;

  LoginForm(
      {Key? key,
      this.loginHeader,
      this.buttonText,
      this.secondTextFieldHint,
      this.firstTextFieldHint,
      this.onChangedFirstField,
      this.onChangedSecondField,
      this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: loginFormKey,
      child: SymPadding(
        padding: Dimens.d20.responsive(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VP(),
            TitleTextBlackWidget(
              loginHeader ?? QpAppStrings.kLoginHeader,
            ),
            VP(size: Dimens.d20.responsive()),
            FormTextFormField(
              hintText: firstTextFieldHint ?? QpAppStrings.kEnterUserName,
              onChanged: (value) {
                if (onChangedFirstField != null) {
                  onChangedFirstField!(value);
                }
              },
            ),
            const VP(),
            PasswordTextFormField(
              hintText: secondTextFieldHint ?? QpAppStrings.kEnterPassword,
              onChanged: (value) {
                if (onChangedSecondField != null) {
                  onChangedSecondField!(value);
                }
              },
            ),
            VP(size: Dimens.d20.responsive()),
            DemoRectangleButton(
              btnText: buttonText ?? QpAppStrings.kLoginHeader,
              iconData: Icons.arrow_forward_sharp,
              onTap: () {
                if (loginFormKey.currentState != null &&
                    loginFormKey.currentState!.validate()) {
                  Common.hideKeyboard();
                  if (onSubmit != null) {
                    onSubmit!();
                  }
                } else if (loginFormKey.currentState != null) {
                  loginFormKey.currentState!.validate();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class LoginIssueSignUp extends StatelessWidget {
  const LoginIssueSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SymPadding(
      padding: Dimens.d20.responsive(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BodyTextWidget(
            QpAppStrings.kLoginIssue,
          ),
          const VP(),
          BodyTextWidget(
            QpAppStrings.kDoNotHaveAccount,
            onTap: () {},
          ),
          VP(size: Dimens.d20.responsive()),
        ],
      ),
    );
  }
}
