import 'package:flutter/material.dart';
import '../colors/app_color.dart';
import 'custom_text_style.dart';

class Chab {
  static const fontFamily = "Chab";

  static TextStyle textStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return CustomTextStyle(
      fontFamily: fontFamily,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}
