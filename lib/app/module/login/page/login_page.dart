import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/common/snackbar.dart';
import 'package:disc_test/app/common/utils.dart';
import 'package:disc_test/app/module/login/controller/login_controller.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:disc_test/app/module/login/widget/pin_code_widget.dart';
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
                  child: InkWell(
                      onTap: () {
                        //handle tap
                        Get.offNamed(Routes.SIGNUP_PAGE);
                      },
                      child: Text(
                        'Đăng ký mới',
                        style: AppStyle.buttonTextStyle,)),
                ),
              )
            ],
          ),
          Text(
            'Nhập số điện thoại',
            style: AppStyle.titleBoldTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSize.sizedBoxHeightM),
          PinCodeWidget(
            context: context,
            length: 10,
            onFinish: (text) async{
              print('phone number: $text');
              Utils.showLoadingDialog(context);
              final result = await Get.find<LoginController>().login(phoneNumber: text);
              Get.back();
              if(result){
                Get.offNamed(Routes.START_PAGE);
                return;
              }
              ScaffoldMessenger.of(context)
                    .showSnackBar(AppSnackbar.failedSnackbar);
            },
          ),
        ],
      )),
    );
  }
}
