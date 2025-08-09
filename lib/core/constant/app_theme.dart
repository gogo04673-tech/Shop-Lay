import 'package:flutter/material.dart';
import 'package:shoplay/core/constant/colors.dart';

ThemeData themeEnglish = ThemeData(
  fontFamily: "Inter_28pt-Bold",
  appBarTheme: AppBarTheme(
    color: AppColor.backgroundColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    ),
  ),
  scaffoldBackgroundColor: AppColor.backgroundColor,
  textTheme: TextTheme(
    headlineLarge: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.textColor,
    ),
    bodySmall: const TextStyle(
      fontSize: 13,
      height: 1.6,
      color: AppColor.grey,
      fontWeight: FontWeight.w500,
    ),
  ),
);

// * Arabic Theme
ThemeData themeArabic = ThemeData(
  fontFamily: "Cairo-Bold",
  appBarTheme: AppBarTheme(
    color: AppColor.backgroundColor,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: AppColor.backgroundColor,
  textTheme: TextTheme(
    // headline Large
    headlineLarge: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColor.textColor,
    ),

    // * body Small
    bodySmall: const TextStyle(
      fontSize: 13,
      height: 1.6,
      color: AppColor.grey,
      fontWeight: FontWeight.w500,
    ),
  ),
);
