import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/module/login/controller/login_controller.dart';
import 'package:disc_test/app/module/question/controller/question_controller.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:disc_test/app/module/login/page/singup_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackgroundContainer(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: MediaQuery.of(context).size.height *
                  AppSize.ratioBottomButton,
              child: Column(
                children: [
                  AppbarBackBtn(),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.sizeBoxWidthL),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Kết quả',
                              style: AppStyle.titleBoldTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSize.sizedBoxHeightL),
                            Image.asset('assets/images/result_1.png'),
                            const SizedBox(height: AppSize.sizedBoxHeightL),
                            Text(
                              'Xin chúc mừng ${Get.find<LoginController>().currentUser?.name}.\nBạn đạt được',
                              style: AppStyle.titleBoldTextStyle,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSize.sizedBoxHeightL),
                            Text(
                              '${Get.find<QuestionController>().score} điểm',
                              style: AppStyle.contentNormalTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: 0,
              left: 0,
              bottom: 10,
              child: SizedBox(
                height: MediaQuery.of(context).size.height *
                    AppSize.ratioBottomButton,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      icon: Icon(Icons.home),
                      label: Text(
                        'Trang chủ',
                        style: AppStyle.buttonTextStyle),
                      style: ElevatedButton.styleFrom(
                        primary: AppColor.mostBtnColor,
                        shape: StadiumBorder(),
                        minimumSize: Size(
                            AppSize.buttonMinWidth, AppSize.buttonMinHeight),
                      ),
                      onPressed: () {
                        Get.offAllNamed(Routes.INITIAL);
                      },
                    ),
                    // SizedBox(width: AppSize.sizeBoxWidthL),
                    // ElevatedButton(
                    //   child: Text('Gửi kết quả', style: AppStyle.buttonTextStyle),
                    //   style: ElevatedButton.styleFrom(
                    //       primary: AppColor.kprimaryColor,
                    //       shape: StadiumBorder(),
                    //       minimumSize: Size(
                    //           AppSize.buttonMinWidth, AppSize.buttonMinHeight)),
                    //   onPressed: () {
                    //     Get.toNamed(Routes.SIGNUP_PAGE);
                    //   },
                    // ),
                  
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
