import 'dart:convert';

class Answer {
  final String name;
  final String question;
  final String answer;
  final String close;
  final String far;
  final String result;
  Answer({
    required this.name,
    required this.question,
    required this.answer,
    required this.close,
    required this.far,
    required this.result,
  });

  factory Answer.fromJson(Map<String, dynamic> json) {
    return Answer(
      name: json['name'],
      question: json['question'],
      answer: json['answer'],
      close: json['close'],
      far: json['far'],
      result: json['result'],
    );
  }
}
