import 'dart:collection';

import 'package:disc_test/app/controllers/question/question_controller.dart';
import 'package:disc_test/app/data/models/data_model.dart';
import 'package:disc_test/app/res/colors.dart';
import 'package:disc_test/app/res/sample_data.dart';
import 'package:disc_test/app/res/sizes.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnswerViewPage extends StatelessWidget {
  final QuestionData questionData;
  final double? page;

  const AnswerViewPage({Key? key, required this.questionData, this.page})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('build AnswerViewPage $page');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 2, child: Center(child: Text(questionData.question))),
        Expanded(
          flex: 5,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppStyle.commonBorderRadius),
                    topRight: Radius.circular(AppStyle.commonBorderRadius))),
            child: ListAnswerWidget(
              questionData: questionData,
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
    required this.questionData,
    this.page,
  }) : super(key: key);

  final QuestionData questionData;
  final double? page;
  @override
  _ListAnswerWidgetState createState() => _ListAnswerWidgetState();
}

class _ListAnswerWidgetState extends State<ListAnswerWidget>
    with AutomaticKeepAliveClientMixin {
  int? _isMost;
  int? _isLeast;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Positioned(
        top: 0,
        right: 0,
        left: 0,
        bottom: MediaQuery.of(context).size.height * AppSize.ratioBottomButton,
        child: ListView.builder(
          itemCount: widget.questionData.answerList.length,
          itemBuilder: (context, index) => Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.paddingSizeM),
                child: AnswerWidget(
                  answer: widget.questionData.answerList[index].answer,
                  isMost: _isMost == index,
                  isLeast: _isLeast == index,
                  mostOnTap: () {
                    if (_isMost == null && _isLeast != index) {
                      setState(() {
                        _isMost = index;
                      });
                    } else if (_isMost == index) {
                      setState(() {
                        _isMost = null;
                      });
                    }
                  },
                  leastOnTap: () {
                    if (_isLeast == null && _isMost != index) {
                      setState(() {
                        _isLeast = index;
                      });
                    } else if (_isLeast == index) {
                      setState(() {
                        _isLeast = null;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSize.paddingSizeM),
              height: MediaQuery.of(context).size.height *
                  AppSize.ratioBottomButton,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: widget.page != PageViewStatus.begining.index,
                    child: Flexible(
                      child: ElevatedButton(
                        child: Text(
                          'Previous',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white, shape: StadiumBorder()),
                        onPressed: () {
                          Get.find<QuestionController>().previousPage();
                        },
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.page != PageViewStatus.begining.index,
                    child: SizedBox(
                      width: 20,
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      child: widget.page == PageViewStatus.ending.index
                          ? Text('Finish')
                          : Text('Next'),
                      style: ElevatedButton.styleFrom(
                          primary: isEnabledButton()
                              ? AppColor.kprimaryColor
                              : AppColor.disableButtonColor,
                          shape: StadiumBorder(),
                          minimumSize: Size(80, 40)),
                      onPressed: () {
                        if (isEnabledButton()) {
                          if (widget.page == PageViewStatus.ending.index) {
                            print('Finish');
                            Get.defaultDialog(
                                title: 'Notification',
                                content:
                                    Text('Do you want to finish the Test?'),
                                onConfirm: () {},
                                onCancel: () {},
                                barrierDismissible: false);
                          } else {
                            Get.find<QuestionController>().nextPage();
                          }
                        }
                      },
                    ),
                  ),
                ],
              )))
    ]);
  }

  bool isEnabledButton() => (_isMost != null && _isLeast != null);

  @override
  bool get wantKeepAlive => true;
}

class AnswerWidget extends StatelessWidget {
  final String answer;
  final Color? backgroundColor;
  final Color? answerColor;
  final Color? borderColor;
  final double? borderRadius;

  AnswerWidget(
      {Key? key,
      required this.answer,
      this.backgroundColor,
      this.answerColor,
      this.borderColor,
      this.borderRadius,
      this.isMost = false,
      this.isLeast = false,
      this.mostOnTap,
      this.leastOnTap})
      : super(key: key);

  final bool isMost;
  final bool isLeast;
  final VoidCallback? mostOnTap;
  final VoidCallback? leastOnTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSize.paddingSizeM),
      decoration: BoxDecoration(
          color: isMost
              ? AppColor.enableMostColor
              : isLeast
                  ? AppColor.enableLeastColor
                  : this.backgroundColor ?? Colors.white,
          border: Border.all(color: this.borderColor ?? AppColor.kprimaryColor),
          borderRadius: BorderRadius.circular(
              this.borderRadius ?? AppStyle.commonBorderRadius)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: isLeast ? 0.0 : 1.0,
            child: ClipOval(
              child: Container(
                color: isMost ? Colors.white : AppColor.mostBtnColor,
                padding: EdgeInsets.all(AppSize.paddingSizeS),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent, // inkwell color
                  child: Icon(
                    Icons.done,
                    color: isMost ? AppColor.mostBtnColor : Colors.white,
                  ),
                  onTap: mostOnTap,
                ),
              ),
            ),
          ),
          Flexible(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppSize.paddingSizeM),
              child: Text(
                this.answer,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: (isMost || isLeast)
                      ? Colors.white
                      : this.answerColor ?? Colors.black,
                ),
              ),
            ),
          ),
          Opacity(
            opacity: isMost ? 0.0 : 1.0,
            child: ClipOval(
              child: Container(
                color: isLeast ? Colors.white : AppColor.leastBtnColor,
                padding: EdgeInsets.all(AppSize.paddingSizeS),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent, // inkwell color
                  child: Icon(
                    Icons.clear,
                    color: isLeast ? AppColor.leastBtnColor : Colors.white,
                  ),
                  onTap: leastOnTap,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
