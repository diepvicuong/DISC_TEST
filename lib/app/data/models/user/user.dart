// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

class User {
    User({
      this.name,
      this.age,
      required this.phoneNumber,
    });

    final String? name;
    final int? age;
    final String phoneNumber;

    User copyWith({
        String? id,
        String? name,
        int? age,
        String? phoneNumber,
    }) => 
        User(
            name: name ?? this.name,
            age: age ?? this.age,
            phoneNumber: phoneNumber ?? this.phoneNumber,
        );

    factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"] == null ? null : json["name"],
        age: json["age"] == null ? null : json["age"],
        phoneNumber: json["phoneNumber"] == null ? null : json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "age": age == null ? null : age,
        "phoneNumber": phoneNumber == null ? null : phoneNumber,
    };
}
