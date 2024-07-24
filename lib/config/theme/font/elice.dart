import 'package:flutter/material.dart';
import 'custom_text_style.dart';

class Elice {
  static const fontFamily = "Elice_Digital_Baeum";

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
