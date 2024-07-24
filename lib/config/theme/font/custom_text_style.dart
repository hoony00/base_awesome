import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../colors/app_color.dart';

class CustomTextStyle extends TextStyle {
  CustomTextStyle({
    String fontFamily = 'Pretendard',
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    int? height,
    Paint? foreground,
  }) : super(
    fontFamily: fontFamily,
    color: color ?? AppColor.black,
    fontSize: fontSize?.sp ?? 15.sp,
    fontWeight: fontWeight ?? FontWeight.w400,
    height: height == null ? null : height / (fontSize ?? 14.sp),
    foreground: foreground,
  );
}
