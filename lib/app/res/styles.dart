import 'package:disc_test/app/res/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final isWebMobile = kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android);
final isWebDesktop = kIsWeb &&
    (defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android);

class AppStyle {
  static final appTextStyle = TextStyle(color: Colors.white);
  static final indicatorTextStyle = isWebDesktop
      ? appTextStyle.copyWith(fontSize: 30.0)
      : appTextStyle.copyWith(fontSize: 20.0);

  static final titleNormalTextStyle = appTextStyle.copyWith(fontSize: 28.0);

  static final titleBoldTextStyle = isWebDesktop
      ? titleNormalTextStyle.copyWith(fontWeight: FontWeight.w700)
      : titleNormalTextStyle.copyWith(
          fontWeight: FontWeight.w700, fontSize: 20);

  static final contentNormalTextStyle =
      appTextStyle.copyWith(fontSize: 20.0, fontWeight: FontWeight.normal);

  static final italicTextStyle = appTextStyle.copyWith(
      fontWeight: FontWeight.normal, fontStyle: FontStyle.italic);

  static final primaryColorTextStyle = TextStyle(color: AppColor.kprimaryColor);

  static final primaryColorBoldTextStyle =
      primaryColorTextStyle.copyWith(fontWeight: FontWeight.bold);

  static final buttonTextStyle = appTextStyle.copyWith(fontSize: 24);
}
