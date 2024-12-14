import 'package:abu_lafy/presentation/resources/color_manager.dart';
import 'package:abu_lafy/presentation/resources/font_manager.dart';
import 'package:abu_lafy/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

TextStyle _getTextStyle(
    double fontSize, String fontFamily, FontWeight fontWeight, Color color) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}
// light text style

TextStyle getLightStyle(
    {double fontSize = 12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.light, color);
}

// regular style

TextStyle getRegularStyle(
    { double fontSize  = 12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.regular, color);
}

// medium text style

TextStyle getMediumStyle(
    {double fontSize = 12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.medium, color);
}

// semi bold text style

TextStyle getSemiBoldStyle(
    {double fontSize = 12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.semiBold, color);
}

// bold text style

TextStyle getBoldStyle(
    {double fontSize = 12, required Color color}) {
  return _getTextStyle(
      fontSize, FontConstants.fontFamily, FontWeightManager.bold, color);
}


// elevated button text style
TextStyle getElevationButtonTextStyle() {
  return _getTextStyle(FontSize.s20, FontConstants.fontFamily, FontWeightManager.bold, ColorManager.white);
}

TextStyle getTextStyleBold({required double fontSize}) {
  return _getTextStyle(fontSize, FontConstants.fontFamily, FontWeightManager.bold, ColorManager.white);
}

TextStyle getErrorTextStyle() {
  return _getTextStyle(13.sp, FontConstants.fontFamily, FontWeightManager.light, Colors.red);
}

TextStyle getTextFormFieldStyle() {
  return _getTextStyle(FontSize.s14, FontConstants.fontFamily, FontWeightManager.regular, ColorManager.black);
}

TextStyle getTextFormFieldHintsStyle() {
  return _getTextStyle(FontSize.s14, FontConstants.fontFamily, FontWeightManager.regular, ColorManager.doveGray);
}