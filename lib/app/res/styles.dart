import 'package:disc_test/app/res/colors.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static final appTextStyle = TextStyle(color: Colors.white);
  static final indicatorTextStyle = appTextStyle.copyWith(fontSize: 14.0);
  static final titleNormalTextStyle = appTextStyle.copyWith(fontSize: 28.0);

  static final titleBoldTextStyle =
      titleNormalTextStyle.copyWith(fontWeight: FontWeight.w700);

  static final contentNormalTextStyle =
      appTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.normal);

  static final italicTextStyle = appTextStyle.copyWith(
      fontWeight: FontWeight.normal, fontStyle: FontStyle.italic);

  static final primaryColorTextStyle = TextStyle(color: AppColor.kprimaryColor);

  static final primaryColorBoldTextStyle =
      primaryColorTextStyle.copyWith(fontWeight: FontWeight.bold);

  static final buttonTextStyle =
      appTextStyle.copyWith(fontSize: 24);
}
