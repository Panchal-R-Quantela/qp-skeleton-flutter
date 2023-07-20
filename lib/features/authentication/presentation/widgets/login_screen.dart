import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/dimens.dart';
import '../../../../common_widgets/buttons.dart';
import '../../../../common_widgets/text_widgets.dart';
import '../../../../common_widgets/edit_text_field.dart';
import '../../../../constants/common_strings.dart';
import '../../../../utils/common.dart';
import '../../../../utils/global_keys.dart';

class LoginForm extends StatelessWidget {
  final String? loginHeader;
  final String? firstTextFieldHint;
  final String? secondTextFieldHint;
  final String? buttonText;
  final ValueChanged<String>? onChangedFirstField;
  final ValueChanged<String>? onChangedSecondField;

  LoginForm(
      {Key? key,
      this.loginHeader,
      this.buttonText,
      this.secondTextFieldHint,
      this.firstTextFieldHint,
      this.onChangedFirstField,
      this.onChangedSecondField})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKeys.loginFormKey,
      child: SymPadding(
        padding: Dimens.d20.responsive(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const VP(),
            TitleTextBlackWidget(
              loginHeader ?? AppStrings.kLoginHeader,
            ),
            VP(size: Dimens.d20.responsive()),
            FormTextFormField(
              hintText: firstTextFieldHint ?? AppStrings.kEnterUserName,
              onChanged: (value) {},
            ),
            const VP(),
            PasswordTextFormField(
              hintText: secondTextFieldHint ?? AppStrings.kEnterPassword,
              onChanged: (value) {},
            ),
            VP(size: Dimens.d20.responsive()),
            DemoRectangleButton(
              btnText: buttonText ?? AppStrings.kLoginHeader,
              iconData: Icons.arrow_forward_sharp,
              onTap: () {
                if (GlobalKeys.loginFormKey.currentState != null &&
                    GlobalKeys.loginFormKey.currentState!.validate()) {
                  Common.hideKeyboard();
                  GlobalKeys.loginFormKey.currentState!.save();
                  debugPrint('FORM :: ${GlobalKeys.loginFormKey.currentState}');
                } else if (GlobalKeys.loginFormKey.currentState != null) {
                  GlobalKeys.loginFormKey.currentState!.validate();
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
            AppStrings.kLoginIssue,
          ),
          const VP(),
          BodyTextWidget(
            AppStrings.kDoNotHaveAccount,
            onTap: () {},
          ),
          VP(size: Dimens.d20.responsive()),
        ],
      ),
    );
  }
}
