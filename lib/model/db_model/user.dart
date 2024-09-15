import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  late int? id;
  String name;
  String email;
  String password;
  late DateTime? createAt;
  User({
    this.id,
    required this.name,
    required this.email,
    required this.password
  });
  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String,dynamic> toJson() => _$UserToJson(this);
}