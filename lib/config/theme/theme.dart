import 'package:flutter/material.dart';
import 'package:myfeelings/config/theme/font/custom_text_style.dart';

import 'colors/app_color.dart';

ThemeData buildThemeData(BuildContext context) {
  return ThemeData(
    scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
    hintColor: AppColor.hintText,
    fontFamily: "Pretendard",


    //텍스트의 색상을 정의
    textTheme: Theme.of(context).textTheme.apply(
          fontFamily: "Pretendard",
        ),

    appBarTheme:  AppBarTheme(
      shadowColor: Colors.black.withOpacity(0.2),
      backgroundColor: AppColor.appBarBackgroundColor,
      surfaceTintColor: AppColor.appBarBackgroundColor,
      titleTextStyle: CustomTextStyle(
        fontSize: 20,
        fontFamily: 'Sebang',
      ),
    ),

    //앱의 주요 색상을 정의
    primaryColor: AppColor.primary,
    //앱의 밝기 테마
    brightness: Brightness.light,
  );
}
