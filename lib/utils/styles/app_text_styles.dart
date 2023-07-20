import 'package:flutter/material.dart';
import 'package:qp_skeleton_flutter/utils/dimens/app_dimen.dart';
import 'package:qp_skeleton_flutter/utils/qp_app_strings.dart';
import '../common.dart';
import '../dimens/dimens.dart';
import 'app_colors.dart';

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
          fontFamily: QpAppStrings.kRaleWayFont));

  static TextStyle titleStyle({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
          fontSize:
              Dimens.d16.responsive(tablet: tablet, ultraTablet: ultraTablet),
          fontWeight: FontWeight.bold,
          color: AppColors.current.secondaryTextColor,
          fontFamily: QpAppStrings.kRaleWayFont));

  static TextStyle bodyStyle({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
          fontSize:
              Dimens.d14.responsive(tablet: tablet, ultraTablet: ultraTablet),
          fontWeight: FontWeight.w200,
          color: Common.isDarkMode()
              ? Colors.white60
              : AppColors.current.secondaryColor,
          fontFamily: QpAppStrings.kRaleWayFont));

  static TextStyle btnStyle({
    double? tablet,
    double? ultraTablet,
  }) =>
      _baseTextStyle.merge(TextStyle(
          fontSize:
              Dimens.d15.responsive(tablet: tablet, ultraTablet: ultraTablet),
          fontWeight: FontWeight.w900,
          color: Common.isDarkMode()
              ? AppColors.current.primaryColor
              : AppColors.current.secondaryColor,
          fontFamily: QpAppStrings.kRaleWayFont));
}
