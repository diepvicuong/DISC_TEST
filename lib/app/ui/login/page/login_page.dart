import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:disc_test/app/ui/login/widget/pin_code_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundContainer(
          child: Column(
        children: [
          AppbarBackBtn(
            action: [
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.only(right: AppSize.homeItemPadding),
                  child: GestureDetector(
                      onTap: () {
                        //handle tap
                        Get.offNamed(Routes.START_PAGE);
                      },
                      child: Text('Bo qua')),
                ),
              )
            ],
          ),
          Text(
            'Nhap ma xac nhan',
            style: AppStyle.titleBoldTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSize.sizedBoxHeightM),
          PinCodeWidget(
            context: context,
            length: 4,
            onFinish: () {
              print('go to start page');
              Get.offNamed(Routes.START_PAGE);
            },
          ),
        ],
      )),
    );
  }
}
