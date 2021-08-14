import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:flutter/material.dart';

class AppSnackbar {
  static final successSnackbar = SnackBar(
      duration: Duration(seconds: 6),
      content: ListTile(
        title: Text(
          'Thành công',
          style: AppStyle.appTextStyle,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColor.enableMostColor);

  static final failedSnackbar = SnackBar(
      duration: Duration(seconds: 2),
      content: ListTile(
        title: Text(
          'Thất bại',
          style: AppStyle.appTextStyle,
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColor.disableButtonColor);
}
