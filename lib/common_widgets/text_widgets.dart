import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/features/app/app_bloc.dart';
import 'package:qp_skeleton_flutter/features/app/app_state.dart';
import '../utils/styles/app_text_styles.dart';

class QpTitleTextBlackWidget extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;

  const QpTitleTextBlackWidget(this.title, {Key? key, this.textAlign})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppCubitState>(builder: (context, snapshot) {
      return Text(title,
          style: AppTextStyles.titleStyle(), textAlign: textAlign);
    });
  }
}

class QpBodyTextWidget extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final GestureTapCallback? onTap;
  final TextStyle? textStyle;

  const QpBodyTextWidget(this.title,
      {Key? key, this.textAlign, this.onTap, this.textStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppCubitState>(builder: (context, snapshot) {
      return GestureDetector(
          onTap: onTap,
          child: Text(title,
              style: textStyle ?? AppTextStyles.bodyStyle(),
              textAlign: textAlign));
    });
  }
}

//Vertical Padding
class VP extends StatelessWidget {
  final double size;

  const VP({Key? key, this.size = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size);
  }
}

//Horizontal Padding
class HP extends StatelessWidget {
  final double size;

  const HP({Key? key, this.size = 10}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size);
  }
}

class SymPadding extends StatelessWidget {
  final Widget child;
  final double padding;

  const SymPadding({Key? key, this.padding = 8, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: child,
    );
  }
}
