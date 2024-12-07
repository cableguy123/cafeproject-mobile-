import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  int id;
  String name;
  String email;
  String password;
  DateTime createAt;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createAt
  });
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String,dynamic> toJson() => _$UserToJson(this);
}