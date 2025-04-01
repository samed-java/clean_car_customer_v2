import 'package:clean_car_customer_v2/constants/res/resources_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize.sp,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight,
    //letterSpacing:
  );
}

// regular style
TextStyle getRegularStyle(
    {double fontSize = FontSize.s12,
    required Color color,
    String fontFamily = FontConstant.fontFamilyPoppins}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.regular, color);
}

// light text style
TextStyle getLightStyle(
    {double fontSize = FontSize.s12,
    String fontFamily = FontConstant.fontFamilyPoppins,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.light, color);
}

// bold text style
TextStyle getBoldStyle(
    {double fontSize = FontSize.s12,
    String fontFamily = FontConstant.fontFamilyPoppins,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.bold, color);
}

// semi bold text style
TextStyle getSemiBoldStyle(
    {double fontSize = FontSize.s12,
    String fontFamily = FontConstant.fontFamilyPoppins,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.semiBold, color);
}

// medium text style
TextStyle getMediumStyle(
    {double fontSize = FontSize.s12,
    String fontFamily = FontConstant.fontFamilyPoppins,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.medium, color);
}

TextStyle getButtonStyle(
    {double fontSize = FontSize.s14,
    String fontFamily = FontConstant.fontFamilyPoppins,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, FontWeightManager.semiBold, color);
}

TextStyle getUnderlineStyle(
    {double fontSize = FontSize.s12,
    String fontFamily = FontConstant.fontFamilyPoppins,
    FontWeight fontWeight = FontWeightManager.regular,
    required Color color}) {
  return _getTextStyle(fontSize, fontFamily, fontWeight, color)
      .copyWith(decoration: TextDecoration.underline);
}
