// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  MyUser({
    required this.id,
    required this.phoneNumber,
    this.name,
    this.age,
    this.createdAt,
    this.password,
  });

  final String id;
  final String phoneNumber;
  String? password;
  String? name;
  int? age;
  Timestamp? createdAt;

  MyUser copyWith({
    String? id,
    String? name,
    int? age,
    String? phoneNumber,
  }) =>
      MyUser(
          id: id ?? this.id,
          name: name ?? this.name,
          age: age ?? this.age,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          createdAt: createdAt ?? this.createdAt,
          password: password);

  factory MyUser.fromJson(Map<String, dynamic> json) => MyUser(
      id: json["userId"],
      name: json["name"],
      age: json["age"],
      phoneNumber: json["phoneNumber"],
      createdAt: json["createdAt"],
      password: json['password']);

  Map<String, dynamic> toJson() => {
        "userId": id,
        "name": name,
        "age": age,
        "phoneNumber": phoneNumber,
        "createdAt": createdAt,
        "password": password
      };

  factory MyUser.fromDoc(DocumentSnapshot doc) => MyUser(
      id: doc.id,
      name: doc["name"],
      age: doc["age"],
      phoneNumber: doc["phoneNumber"],
      createdAt: doc["createdAt"],
      password: doc["password"]);
}
