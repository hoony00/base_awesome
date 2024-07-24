import 'package:flutter/material.dart';
import 'custom_text_style.dart';

class Pretendard {
  static const fontFamily = "Pretendard";

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
