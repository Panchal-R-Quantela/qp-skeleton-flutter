import 'package:flutter/material.dart';
import '../utils/validations.dart';

class QpSkeletonTextFormField extends StatelessWidget
    with InputValidationMixin {
  final String hintText;
  final ValueChanged<String>? onChanged;

  QpSkeletonTextFormField({Key? key, required this.hintText, this.onChanged})
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

class QpEmailTextFormField extends StatelessWidget with InputValidationMixin {
  final String hintText;
  final ValueChanged<String>? onChanged;

  QpEmailTextFormField({Key? key, required this.hintText, this.onChanged})
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

class QpPasswordTextFormField extends StatelessWidget
    with InputValidationMixin {
  final String hintText;
  final ValueChanged<String>? onChanged;

  QpPasswordTextFormField(
      {Key? key, this.hintText = 'Password', this.onChanged})
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
        if(onChanged!=null) {
          onChanged!(val);
        }
      },
    );
  }
}

InputDecoration inputDecoration(String hintText) {
  return InputDecoration(label: Text(hintText));
}
