import 'package:disc_test/app/data/models/question/question.dart';
import 'package:disc_test/app/module/question/controller/question_controller.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:disc_test/app/routes/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerViewPage extends StatelessWidget {
  final Question questionData;
  final double? page;

  const AnswerViewPage({Key? key, required this.questionData, this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build AnswerViewPage $page');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 2,
            child: Center(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                questionData.question,
                style: AppStyle.titleBoldTextStyle,
                textAlign: TextAlign.center,
              ),
            ))),
        Expanded(
          flex: 5,
          child: DecoratedBox(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppSize.commonBorderRadius),
                    topRight: Radius.circular(AppSize.commonBorderRadius))),
            child: ListAnswerWidget(
              suggestionList: questionData.suggestions ?? [],
              answer: questionData.answer,
              page: this.page,
            ),
          ),
        )
      ],
    );
  }
}

class ListAnswerWidget extends StatefulWidget {
  const ListAnswerWidget({
    Key? key,
    required this.suggestionList,
    required this.answer,
    this.page,
  }) : super(key: key);

  final List<String> suggestionList;
  final double? page;
  final String answer;
  @override
  _ListAnswerWidgetState createState() => _ListAnswerWidgetState();
}

class _ListAnswerWidgetState extends State<ListAnswerWidget>
    with AutomaticKeepAliveClientMixin {
  int? _indexChoosing;
  final questionController = Get.find<QuestionController>();
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 0,
        right: 0,
        left: 0,
        bottom: MediaQuery.of(context).size.height * AppSize.ratioBottomButton,
        child: ListView.builder(
          itemCount: widget.suggestionList.length,
          itemBuilder: (context, index) => Column(
            children: [
              const SizedBox(
                height: AppSize.sizeBoxWidthL,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.paddingSizeM),
                child: AnswerWidget(
                  answer: widget.suggestionList[index],
                  indexStr: String.fromCharCode(index + 65),
                  isTapping: _indexChoosing == index,
                  onTap: () {
                    setState(() {
                      _indexChoosing = index;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSize.paddingSizeM),
              height: isWebDesktop ? 100 : 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: widget.page != PageViewStatus.begining.index,
                    child: const SizedBox(
                      width: 20,
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      child: widget.page == PageViewStatus.ending.index
                          ? Text('Hoàn thành', style: AppStyle.buttonTextStyle)
                          : Text('Tiếp theo', style: AppStyle.buttonTextStyle),
                      style: ElevatedButton.styleFrom(
                        primary: isEnabledButton()
                            ? AppColor.kprimaryColor
                            : AppColor.disableButtonColor,
                        shape: StadiumBorder(),
                        minimumSize: Size(
                            AppSize.buttonMinWidth, AppSize.buttonMinHeight),
                      ),
                      onPressed: () {
                        if (isEnabledButton()) {
                          if (widget.page == PageViewStatus.ending.index) {
                            print('Finish');

                            Get.defaultDialog(
                                title: 'Thông báo',
                                content: Text('Bạn muốn hoàn thành bài thi?'),
                                onConfirm: () {
                                  Get.back();
                                  if (widget.answer ==
                                      widget.suggestionList[
                                          _indexChoosing ?? 0]) {
                                    Get.find<QuestionController>()
                                        .increaseScrore();
                                  }

                                  questionController.finish();
                                },
                                onCancel: () {},
                                barrierDismissible: false);
                          } else {
                            Get.find<QuestionController>().nextPage();
                            if (widget.answer ==
                                widget.suggestionList[_indexChoosing ?? 0]) {
                              Get.find<QuestionController>().increaseScrore();
                            }
                          }
                        }
                      },
                    ),
                  ),
                ],
              )))
    ]);
  }

  bool isEnabledButton() => (_indexChoosing != null);

  @override
  bool get wantKeepAlive => true;
}

class AnswerWidget extends StatelessWidget {
  final String answer;
  final Color? backgroundColor;
  final Color? answerColor;
  final Color? borderColor;
  final double? borderRadius;
  final String indexStr;

  AnswerWidget({
    Key? key,
    required this.answer,
    this.backgroundColor,
    this.answerColor,
    this.borderColor,
    this.borderRadius,
    this.isTapping = false,
    this.onTap,
    required this.indexStr,
  }) : super(key: key);

  final bool isTapping;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSize.paddingSizeS),
        decoration: BoxDecoration(
            color: isTapping
                ? AppColor.enableMostColor
                : this.backgroundColor ?? Colors.white,
            border:
                Border.all(color: this.borderColor ?? AppColor.kprimaryColor),
            borderRadius: BorderRadius.circular(
                this.borderRadius ?? AppSize.commonBorderRadius)),
        child: Row(
          children: [
            Opacity(
              opacity: 1.0,
              child: ClipOval(
                child: Container(
                  width: 40,
                  height: 40,
                  color: isTapping ? Colors.white : AppColor.mostBtnColor,
                  padding: const EdgeInsets.all(AppSize.paddingSizeS),
                  child: Center(
                    child: Text(indexStr,
                        style: TextStyle(
                          color:
                              isTapping ? AppColor.mostBtnColor : Colors.white,
                        )),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.paddingSizeM),
                child: Text(
                  this.answer.trim(),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: (isTapping)
                          ? Colors.white
                          : this.answerColor ?? Colors.black,
                      fontSize: isWebDesktop ? 30 : 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
