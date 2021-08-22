import 'package:dio/dio.dart';
import 'package:disc_test/app/common/custom_appbar.dart';
import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/common/utils.dart';
import 'package:disc_test/app/data/models/question/question.dart';
import 'package:disc_test/app/module/finish/widgets/custom_spin_wheel.dart';
import 'package:disc_test/app/module/login/controller/login_controller.dart';
import 'package:disc_test/app/module/question/controller/question_controller.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/constant.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class ResultPage extends StatelessWidget {
  final questionController = Get.find<QuestionController>();
  // final questionController = Get.put(QuestionController(
  //     questionRepository:
  //         QuestionRepository(apiClient: MyApiClient(httpClient: Dio()))));

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
                        style: AppStyle.titleBoldTextStyleWeb,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSize.sizedBoxHeightL),
                      SizedBox(
                        height: 250,
                        width: 250,
                        child: RiveAnimation.asset(
                          'assets/animations/bear.riv',
                          animations: [
                            questionController.score /
                                        questionController.scoreList.length >
                                    AppConstant.hightScoreThreshold
                                ? 'Correct'
                                : 'Incorrect'
                          ],
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: AppSize.sizedBoxHeightL),
                      Text(
                        Utils.getStringByScore(
                            score: questionController.score /
                                questionController.scoreList.length),
                        style: AppStyle.titleBoldTextStyleWeb,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSize.sizedBoxHeightL),
                      Text(
                        'Điểm số: ${questionController.score}/${questionController.scoreList.length} điểm',
                        style: AppStyle.contentNormalTextStyle.copyWith(
                            color: AppColor.getColorByScore(
                                score: questionController.score /
                                    questionController.scoreList.length),
                            fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      Visibility(
                        // visible: questionController.score >
                        //     AppConstant.hightScoreThreshold,
                        visible: false,
                        child: InkWell(
                          onTap: () {
                            Get.dialog(CustomSpinWheel());
                          },
                          child: SizedBox(
                            height: 120,
                            width: 120,
                            child: RiveAnimation.asset(
                              'assets/animations/giftBox.riv',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
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
                                Expanded(
                                  child: Text(
                                    'Câu ${(index + 1).toString().padLeft(2, '0')}: ',
                                    style: AppStyle.titleNormalTextStyle,
                                    textAlign: TextAlign.end,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: questionController.scoreList[index] ==
                                          true
                                      ? Text(
                                          'Đúng',
                                          style: AppStyle.titleNormalTextStyle
                                              .copyWith(color: Colors.green),
                                        )
                                      : Text(
                                          'Sai',
                                          style: AppStyle.titleNormalTextStyle
                                              .copyWith(color: Colors.red),
                                        ),
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
                                minimumSize: Size(
                                    AppSize.buttonMinWidth,
                                    kIsWeb
                                        ? AppSize.buttonMinHeight
                                        : AppSize.buttonMinHeight),
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
