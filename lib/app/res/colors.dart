import 'package:disc_test/app/res/constant.dart';
import 'package:flutter/material.dart';

class AppColor {
  static const Color kprimaryColor = Color(0xff705f99);
  static const Color kprimaryColorLight = Color(0xff9f8cca);

  static const Color kSecondaryColor = Colors.white;

  static const Color disableButtonColor = Colors.grey;
  static const Color enableMostColor = Color(0xff6dd3bf);
  static const Color enableLeastColor = Color(0xfffc3529);
  static const Color mostBtnColor = Color(0xff37a18f);
  static const Color leastBtnColor = Color(0xfffc3529);

  static const Color highScoreColor = Colors.green;
  static const Color mediumScoreColor = Colors.yellow;
  static const Color lowScoreColor = Colors.red;

  static const Color oragne = Colors.orange;

  static Color getColorByScore({required double score}) {
    if (score > AppConstant.hightScoreThreshold) {
      return highScoreColor;
    } else if (score > AppConstant.mediumScoreThreshold) {
      return mediumScoreColor;
    } else {
      return lowScoreColor;
    }
  }
}
