import 'package:dio/dio.dart';
import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/data/models/question/question.dart';
import 'package:disc_test/app/data/repository/question_repository.dart';
import 'package:disc_test/app/data/repository/user_repository.dart';
import 'package:disc_test/app/data/services/api.dart';
import 'package:disc_test/app/module/login/controller/login_controller.dart';
import 'package:disc_test/app/module/question/controller/question_controller.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:disc_test/app/module/login/page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatelessWidget {
  final questionController = Get.find<QuestionController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        style: AppStyle.contentNormalTextStyle
                            .copyWith(color: Colors.red, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 10),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: questionController.scoreList.length,
                        itemBuilder: (context, index) {
                          return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Câu ${index + 1}: ',
                                    style: AppStyle.titleNormalTextStyle),
                                SizedBox(
                                  width: 10,
                                ),
                                questionController.scoreList[index] == true
                                    ? Text(
                                        'Đúng',
                                        style: AppStyle.titleNormalTextStyle
                                            .copyWith(color: Colors.green),
                                      )
                                    : Text(
                                        'Sai',
                                        style: AppStyle.titleNormalTextStyle
                                            .copyWith(color: Colors.red),
                                      )
                              ]);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height *
                            AppSize.ratioBottomButton,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              icon: Icon(Icons.home),
                              label: Text('Trang chủ',
                                  style: AppStyle.buttonTextStyle),
                              style: ElevatedButton.styleFrom(
                                primary: AppColor.mostBtnColor,
                                shape: StadiumBorder(),
                                minimumSize: Size(AppSize.buttonMinWidth,
                                    AppSize.buttonMinHeight),
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
