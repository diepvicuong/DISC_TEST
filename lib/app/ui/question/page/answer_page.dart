import 'package:disc_test/app/data/models/data_model.dart';
import 'package:disc_test/app/res/sample_data.dart';
import 'package:disc_test/app/res/styles.dart';
import 'package:flutter/material.dart';

class AnswerPage extends StatelessWidget {
  final QuestionData questionData;

  const AnswerPage({Key? key, required this.questionData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
            flex: 1,
            child: Center(
              child: Text(questionData.question),
            )),
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppStyle.commonBorderRadius),
                    topRight: Radius.circular(AppStyle.commonBorderRadius))),
            child: ListAnswerWidget(questionData: questionData),
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
  }) : super(key: key);

  final QuestionData questionData;

  @override
  _ListAnswerWidgetState createState() => _ListAnswerWidgetState();
}

class _ListAnswerWidgetState extends State<ListAnswerWidget> {
  int? _isMost;
  int? _isLeast;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ListView.builder(
      itemCount: widget.questionData.answerList.length,
      itemBuilder: (context, index) => AnswerWidget2(
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
    ));
  }
}

class AnswerWidget extends StatefulWidget {
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
      this.borderRadius})
      : super(key: key);

  @override
  _AnswerWidgetState createState() => _AnswerWidgetState();
}

class _AnswerWidgetState extends State<AnswerWidget> {
  bool _isMost = false;
  bool _isLeast = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: _isMost
              ? Colors.green
              : _isLeast
                  ? Colors.red
                  : widget.backgroundColor ?? Colors.white,
          border: Border.all(color: this.widget.borderColor ?? Colors.black),
          borderRadius: BorderRadius.circular(
              this.widget.borderRadius ?? AppStyle.commonBorderRadius)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: _isLeast ? 0.0 : 1.0,
            child: ClipOval(
              child: Container(
                color: _isMost ? Colors.white : Colors.green,
                padding: EdgeInsets.all(5),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent, // inkwell color
                  child: Icon(
                    Icons.done,
                    color: _isMost ? Colors.green : Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      _isMost = !_isMost;
                    });
                  },
                ),
              ),
            ),
          ),
          Flexible(
            child: Text(
              this.widget.answer,
              style: TextStyle(
                color: (_isMost || _isLeast)
                    ? Colors.white
                    : widget.answerColor ?? Colors.black,
              ),
            ),
          ),
          Opacity(
            opacity: _isMost ? 0.0 : 1.0,
            child: ClipOval(
              child: Container(
                color: _isLeast ? Colors.white : Colors.red,
                padding: EdgeInsets.all(5),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent, // inkwell color
                  child: Icon(
                    Icons.clear,
                    color: _isLeast ? Colors.red : Colors.white,
                  ),
                  onTap: () {
                    setState(() {
                      _isLeast = !_isLeast;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnswerWidget2 extends StatelessWidget {
  final String answer;
  final Color? backgroundColor;
  final Color? answerColor;
  final Color? borderColor;
  final double? borderRadius;

  AnswerWidget2(
      {Key? key,
      required this.answer,
      this.backgroundColor,
      this.answerColor,
      this.borderColor,
      this.borderRadius,
      this.isMost = false,
      this.isLeast = false,
      this.enableMost = true,
      this.enableLeast = true,
      this.mostOnTap,
      this.leastOnTap})
      : super(key: key);

  final bool isMost;
  final bool isLeast;
  final bool enableMost;
  final bool enableLeast;
  final VoidCallback? mostOnTap;
  final VoidCallback? leastOnTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: isMost
              ? Colors.green
              : isLeast
                  ? Colors.red
                  : this.backgroundColor ?? Colors.white,
          border: Border.all(color: this.borderColor ?? Colors.black),
          borderRadius: BorderRadius.circular(
              this.borderRadius ?? AppStyle.commonBorderRadius)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: isLeast ? 0.0 : 1.0,
            child: ClipOval(
              child: Container(
                color: isMost ? Colors.white : Colors.green,
                padding: EdgeInsets.all(5),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent, // inkwell color
                  child: Icon(
                    Icons.done,
                    color: isMost ? Colors.green : Colors.white,
                  ),
                  onTap: mostOnTap,
                ),
              ),
            ),
          ),
          Flexible(
            child: Text(
              this.answer,
              style: TextStyle(
                color: (isMost || isLeast)
                    ? Colors.white
                    : this.answerColor ?? Colors.black,
              ),
            ),
          ),
          Opacity(
            opacity: isMost ? 0.0 : 1.0,
            child: ClipOval(
              child: Container(
                color: isLeast ? Colors.white : Colors.red,
                padding: EdgeInsets.all(5),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent, // inkwell color
                  child: Icon(
                    Icons.clear,
                    color: isLeast ? Colors.red : Colors.white,
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
