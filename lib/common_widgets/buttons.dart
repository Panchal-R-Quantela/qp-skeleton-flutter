import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qp_skeleton_flutter/features/app/app_bloc.dart';
import 'package:qp_skeleton_flutter/features/app/app_state.dart';
import 'package:qp_skeleton_flutter/utils/common.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/dimens.dart';
import 'package:qp_skeleton_flutter/utils/styles/app_text_styles.dart';
import '../utils/styles/app_colors.dart';

class DemoRectangleButton extends StatelessWidget {
  final String btnText;
  final GestureTapCallback onTap;
  final IconData? iconData;

  const DemoRectangleButton(
      {Key? key, required this.btnText, required this.onTap, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppCubitState>(builder: (context, snapshot) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(Dimens.d15.responsive()),
          //width: 300,
          // height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Common.isDarkMode()
                ? AppColors.current.secondaryColor
                : AppColors.current.primaryColor,
          ),
          child: iconData != null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Text(btnText, style: AppTextStyles.btnStyle()),
                      Icon(
                        Icons.arrow_forward_sharp,
                        size: Dimens.d22.responsive(),
                        color: Common.isDarkMode()
                            ? AppColors.current.primaryColor
                            : AppColors.current.secondaryColor,
                      ),
                    ])
              : Center(child: Text(btnText, style: AppTextStyles.btnStyle())),
        ),
      );
    });
  }
}
