import 'package:flutter/material.dart';
import '../utils/validations.dart';

class QpSkeletonTextFormField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final String showDefaultText;

  QpSkeletonTextFormField(
      {Key? key,
      required this.hintText,
      this.onChanged,
      this.showDefaultText = ""})
      : super(key: key);

  @override
  State<QpSkeletonTextFormField> createState() =>
      _QpSkeletonTextFormFieldState();
}

class _QpSkeletonTextFormFieldState extends State<QpSkeletonTextFormField>
    with InputValidationMixin {
  late TextEditingController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: widget.showDefaultText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: controller,
        decoration: inputDecoration(widget.hintText),
        style: bottomTextStyle(context),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Enter ${widget.hintText}';
          } else {
            return null;
          }
        },
        onChanged: (val) {
          widget.onChanged!(val);
        });
  }
}

class QpEmailTextFormField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final String showDefaultText;

  QpEmailTextFormField(
      {Key? key,
      required this.hintText,
      this.onChanged,
      this.showDefaultText = ""})
      : super(key: key);

  @override
  State<QpEmailTextFormField> createState() => _QpEmailTextFormFieldState();
}

class _QpEmailTextFormFieldState extends State<QpEmailTextFormField>
    with InputValidationMixin {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.showDefaultText);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: inputDecoration(widget.hintText),
      style: bottomTextStyle(context),
      validator: (email) {
        if (email == null || email.isEmpty) {
          return 'Enter ${widget.hintText}';
        } else if (!isEmailValid(email)) {
          return 'Enter a valid email address';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
      },
    );
  }
}

class QpPasswordTextFormField extends StatefulWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final String showDefaultText;

  QpPasswordTextFormField(
      {Key? key,
      this.hintText = 'Password',
      this.onChanged,
      this.showDefaultText = ""})
      : super(key: key);

  @override
  State<QpPasswordTextFormField> createState() =>
      _QpPasswordTextFormFieldState();
}

class _QpPasswordTextFormFieldState extends State<QpPasswordTextFormField>
    with InputValidationMixin {
  late TextEditingController controller;
  late bool _passwordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TextEditingController(text: widget.showDefaultText);
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: !_passwordVisible,
      style: bottomTextStyle(context),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 5.0),
        label: Text(widget.hintText),
        suffixIcon: IconButton(
          icon: Icon(
            _passwordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
        suffixIconConstraints: const BoxConstraints(maxHeight: 30),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter ${widget.hintText}';
        } else if (!isPasswordValid(value)) {
          return 'Password length should be greater than 6';
        } else {
          return null;
        }
      },
      onChanged: (val) {
        if (widget.onChanged != null) {
          widget.onChanged!(val);
        }
      },
    );
  }
}

InputDecoration inputDecoration(String hintText) {
  return InputDecoration(
    label: Text(hintText),
    contentPadding: const EdgeInsets.only(top: 5.0),
  );
}

TextStyle bottomTextStyle(BuildContext context) {
  return TextStyle(color: Theme.of(context).textTheme.titleSmall?.color);
}
