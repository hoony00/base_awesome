import 'package:flutter/material.dart';
import '../colors/app_color.dart';
import 'custom_text_style.dart';

class Sebang {
  static const fontFamily = "Sebang";

  static TextStyle textStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return CustomTextStyle(
      fontFamily: fontFamily,
      color: color ?? AppColor.hintText,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
