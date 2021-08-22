import 'package:cloud_firestore/cloud_firestore.dart';

import 'gift.dart';

class Configuration {
  Configuration({
    required this.questionLength,
    required this.questionTimer,
    this.gift,
  });

  final int questionLength;
  final int questionTimer;
  List<Gift>? gift;

  Configuration copyWith({
    int? questionLength,
    int? questionTimer,
    List<Gift>? gift,
  }) =>
      Configuration(
        questionLength: questionLength ?? this.questionLength,
        questionTimer: questionTimer ?? this.questionTimer,
        gift: gift ?? this.gift,
      );

  factory Configuration.fromDoc(DocumentSnapshot doc) => Configuration(
        questionLength:
            doc["questionLength"] == null ? null : doc["questionLength"],
        questionTimer:
            doc["questionTimer"] == null ? null : doc["questionTimer"],
        gift: doc["gift"] == null
            ? null
            : List<Gift>.from(doc["gift"].map((x) => Gift.fromJson(x))),
      );

  @override
  String toString() {
    return '''

  questionLength: $questionLength
  questionTimer: $questionTimer
  gift: ${gift.toString()}''';
  }
}
