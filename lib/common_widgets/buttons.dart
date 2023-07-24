import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/common_widgets/text_widgets.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/dimens.dart';

class QpRectangularCircleButton extends StatelessWidget {
  final String btnText;
  final GestureTapCallback onTap;
  final IconData? iconData;
  final TextStyle? style;
  final Color? btnColor;

  const QpRectangularCircleButton(
      {Key? key,
      required this.btnText,
      required this.onTap,
      this.iconData,
      this.style,
      this.btnColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Dimens.d10.responsive()),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: btnColor ?? Theme.of(context).primaryColor,
        ),
        child: iconData != null
            ? Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            iconData,
            size: Dimens.d22.responsive(),
            color: Theme.of(context).iconTheme.color,
          ),
          const HP(),
          Text(
            btnText,
            style: style,
            textAlign: TextAlign.center,
          ),
        ])
            : Center(child: Text(btnText, style: style)),
      ),
    );
  }
}
