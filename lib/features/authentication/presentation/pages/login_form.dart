import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/dimens.dart';
import '../../../../common_widgets/buttons.dart';
import '../../../../common_widgets/text_widgets.dart';
import '../../../../common_widgets/edit_text_field.dart';
import '../../../../utils/global_keys.dart';

class LoginForm extends StatelessWidget {
  final String firstTextFieldHint;
  final String secondTextFieldHint;
  final ValueChanged<String>? onChangedFirstField;
  final ValueChanged<String>? onChangedSecondField;

  LoginForm({
    Key? key,
    required this.onChangedSecondField,
    required this.onChangedFirstField,
    required this.secondTextFieldHint,
    required this.firstTextFieldHint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        key: GlobalKeys.loginFormKey,
        child: Column(
          children: [
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
          ],
        ));
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
}
