import 'dart:convert';

import 'package:disc_test/app/data/models/answer_model.dart';

class QuestionData {
  final String question;
  final List<Answer> answerList;

  QuestionData({required this.question, required this.answerList});

  factory QuestionData.fromJson(Map<String, dynamic> json) {
    return QuestionData(
      question: json['question'],
      answerList:
          List<Answer>.from(json['answer']?.map((x) => Answer.fromJson(x))),
    );
  }
}
