import 'dart:convert';

import 'package:disc_test/app/data/models/data_model.dart';

class MessageModel {
  final String result;
  final List<QuestionData> data;

  MessageModel({required this.result, required this.data});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      result: json['result'],
      data: List<QuestionData>.from(
          json['data']?.map((x) => QuestionData.fromJson(x))),
    );
  }
}
