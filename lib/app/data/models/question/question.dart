// To parse this JSON data, do
//
//     final question = questionFromJson(jsonString);

import 'dart:convert';

import 'package:disc_test/app/common/utils.dart';

class Question {
  Question({
    required this.id,
    this.question = '',
    this.answer = '',
    this.suggestions,
  });

  final String id;
  final String question;
  final String answer;
  final List<String>? suggestions;

  Question copyWith({
    required String id,
    String? question,
    String? answer,
    List<String>? suggestions,
  }) =>
      Question(
        question: question ?? this.question,
        answer: answer ?? this.answer,
        suggestions: suggestions ?? this.suggestions,
        id: id,
      );

  factory Question.fromRawJson(String str) =>
      Question.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        question: json["question"] == null ? '' : json["question"],
        answer: json["answer"] == null ? '' : json["answer"],
        suggestions: json["suggestions"] == null
            ? Utils.createFakeAnswerList(json["answer"])
            : List<String>.from(json["suggestions"].map((x) => x)),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
        "suggestions": suggestions == null
            ? []
            : List<dynamic>.from(suggestions!.map((x) => x)),
        "id": id,
      };
}
