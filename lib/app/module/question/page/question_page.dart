import 'package:disc_test/app/common/custom_body_background.dart';
import 'package:disc_test/app/common/loading_widget.dart';
import 'package:disc_test/app/module/question/controller/question_controller.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/config.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/module/question/page/answer_pageview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.find<QuestionController>().initData();
  }

  @override
  Widget build(BuildContext context) {
    final _questionController = Get.find<QuestionController>();
    return Scaffold(
      body: CustomBackgroundContainer(
        child: GetX<QuestionController>(
          builder: (c) => c.listQuestion.length > 0
              ? Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      leading: kIsWeb
                          ? SizedBox.shrink()
                          : IconButton(
                              icon: Icon(Icons.chevron_left),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                      title: CustomPageIndicator(),
                      actions: [
                        IconButton(
                          icon: const Icon(Icons.help_outline_outlined),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller: _questionController.pageController,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: _questionController.listQuestion.length,
                        itemBuilder: (context, index) {
                          return AnswerViewPage(
                            questionData:
                                _questionController.listQuestion[index],
                            page: _questionController.listQuestion.length > 1
                                ? index /
                                    (_questionController.listQuestion.length -
                                        1)
                                : 1,
                          );
                        },
                        onPageChanged: (value) {
                          print('OnPageChanged: $value');
                          _questionController.currentPageView = value;
                        },
                      ),
                    ),
                  ],
                )
              : LoadingWidget(),
        ),
      ),
    );
  }
}

class CustomPageIndicator extends GetView<QuestionController> {
  const CustomPageIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<QuestionController>(
      builder: (controller) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Câu hỏi ${controller.currentPageView + 1}/${controller.listQuestion.length}",
                  style: AppStyle.indicatorTextStyle),
              Text(controller.countDownQuestionInStr,
                  style: controller.countDownQuestionSec <= 10
                      ? AppStyle.indicatorTextStyle.copyWith(color: Colors.red)
                      : AppStyle.indicatorTextStyle),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              for (int i = 0; i < controller.listQuestion.length; i++)
                if (i == controller.currentPageView) ...[circleBar(true)] else
                  circleBar(false),
            ],
          ),
        ],
      ),
    );
  }

  Widget circleBar(bool isActive) {
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: AppConfig.pageChangeMilisecond),
        height: isActive ? 10 : 6,
        decoration: BoxDecoration(
            color: isActive ? AppColor.kprimaryColor : AppColor.kSecondaryColor,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}
