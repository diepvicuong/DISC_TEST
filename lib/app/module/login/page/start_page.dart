import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/data/services/manger_service.dart';
import 'package:disc_test/app/module/login/controller/login_controller.dart';
import 'package:disc_test/app/module/question/controller/question_controller.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:disc_test/app/module/question/page/question_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartPage extends StatelessWidget {
  final loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kprimaryColorLight,
      body: CustomBackgroundContainer(
        child: Column(
          children: [
            AppbarBackBtn(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.sizeBoxWidthL),
                  child: Column(
                    children: [
                      Text(
                        'Bài kiểm tra'.toUpperCase(),
                        style: AppStyle.titleBoldTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSize.sizedBoxHeightL),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.alarm,
                            color: Colors.black,
                            size: 40,
                          ),
                          SizedBox(width: AppSize.sizeBoxWidthM),
                          Text(
                            Duration(
                                    seconds: ManagerService
                                        .instance.configuration.questionTimer)
                                .toString()
                                .split('.')[0],
                            style: AppStyle.titleNormalTextStyle
                                .copyWith(color: Colors.black),
                          )
                        ],
                      ),
                      const SizedBox(height: AppSize.sizedBoxHeightL),
                      Text(
                        'Xin chào ${loginController.currentUser?.name}. Bài kiểm tra này giúp bạn ôn tập những kiến thức đã học.'
                        '\n\nHãy tính toán và suy nghĩ thật kĩ để đưa ra câu trả lời chính xác nhất.',
                        style: AppStyle.contentNormalTextStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                        child: Text(
                          'Bắt đầu',
                          style: AppStyle.buttonTextStyle,
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: AppColor.mostBtnColor,
                          shape: StadiumBorder(),
                          minimumSize: Size(
                              AppSize.buttonMinWidth, AppSize.buttonMinHeight),
                        ),
                        onPressed: () {
                          Get.defaultDialog(
                            title: "Thông báo",
                            content: Text("Bạn đã sẵn sàng làm bài kiểm tra?"),
                            onConfirm: () {
                              Get.back();
                              Get.offNamed(Routes.QUESTION_PAGE);
                            },
                            onCancel: () {},
                            barrierDismissible: false,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
