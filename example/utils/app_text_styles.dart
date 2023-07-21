import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/dimens/dimens.dart';
import 'package:qp_skeleton_flutter/utils/qp_app_strings.dart';

/// AppTextStyle format as follows:
/// s[fontSize][fontWeight][Color]
/// Example: s18w400Primary

class AppTextStyles {
  AppTextStyles._();

  static const _defaultLetterSpacing = 0.03;

  static const _baseTextStyle = TextStyle(
    letterSpacing: _defaultLetterSpacing,
    // height: 1.0,
  );

/*
  static TextStyle s14w400Primary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
          fontSize:
              Dimens.d14.responsive(tablet: tablet, ultraTablet: ultraTablet),
          fontWeight: FontWeight.w400,
          color: AppColors.current.primaryTextColor,
          fontFamily: QpAppStrings.kRaleWayFont));

  static TextStyle s14w400Secondary({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
          fontSize:
              Dimens.d14.responsive(tablet: tablet, ultraTablet: ultraTablet),
          fontWeight: FontWeight.bold,
          color: AppColors.current.secondaryTextColor,
          fontFamily: QpAppStrings.kRaleWayFont));*/

  static TextStyle titleStyle(
          {required BuildContext context,
          double? tablet,
          double? ultraTablet,
          Color? color}) =>
      _baseTextStyle.merge(TextStyle(
          fontSize:
              Dimens.d30.responsive(tablet: tablet, ultraTablet: ultraTablet),
          fontWeight: FontWeight.bold,
          color: color ?? Theme.of(context).textTheme.titleLarge?.color,
          fontFamily: QpAppStrings.kRaleWayFont));

  static TextStyle bodyStyle(
          {required BuildContext context,
          double? tablet,
          double? ultraTablet,
          Color? color}) =>
      _baseTextStyle.merge(TextStyle(
          fontSize:
              Dimens.d14.responsive(tablet: tablet, ultraTablet: ultraTablet),
          fontWeight: FontWeight.w200,
          color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
          fontFamily: QpAppStrings.kRaleWayFont,
          fontStyle: FontStyle.italic));

  static TextStyle btnStyle(
          {required BuildContext context,
          double? tablet,
          double? ultraTablet,
          Color? color}) =>
      _baseTextStyle.merge(TextStyle(
          fontSize:
              Dimens.d15.responsive(tablet: tablet, ultraTablet: ultraTablet),
          fontWeight: FontWeight.w900,
          color: color ?? Theme.of(context).textTheme.titleMedium!.color,
          fontFamily: QpAppStrings.kRaleWayFont));
}
