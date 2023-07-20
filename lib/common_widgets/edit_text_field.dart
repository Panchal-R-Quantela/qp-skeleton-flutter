import 'package:flutter/material.dart';
import '../utils/validations.dart';

class FormTextFormField extends StatelessWidget with InputValidationMixin {
  final String hintText;
  final ValueChanged<String>? onChanged;

  FormTextFormField({Key? key, required this.hintText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        decoration: inputDecoration(hintText),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter $hintText';
          } else {
            return null;
          }
        },
        onChanged: (val) {
          onChanged!(val);
        });
  }
}

class EmailTextFormField extends StatelessWidget with InputValidationMixin {
  final String hintText;
  final ValueChanged<String>? onChanged;

  EmailTextFormField({Key? key, required this.hintText, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: inputDecoration(hintText),
      validator: (email) {
        if (email == null || email.isEmpty) {
          return 'Enter $hintText';
        } else if (!isEmailValid(email)) {
          return 'Enter a valid email address';
        } else {
          return null;
        }
      },
      onChanged: (value) => onChanged,
    );
  }
}

class PasswordTextFormField extends StatelessWidget with InputValidationMixin {
  final String hintText;
  ValueChanged<String>? onChanged;

  PasswordTextFormField({Key? key, this.hintText = 'Password', this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: inputDecoration(hintText),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter $hintText';
        } else if (!isPasswordValid(value)) {
          return 'Password length should be greater than 6';
        } else {
          return null;
        }
      },
      onChanged: (val) {
        onChanged!(val);
      },
    );
  }
}

InputDecoration inputDecoration(String hintText) {
  return InputDecoration(hintText: 'Enter $hintText');
}
