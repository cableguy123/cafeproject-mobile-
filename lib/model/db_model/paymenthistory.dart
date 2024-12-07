import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'paymenthistory.g.dart';

@JsonSerializable()
class PayHisTory {
  int payId;
  String payName;
  String payPrice;
  DateTime payDateAt;
  String paymentStatus;
  PayHisTory({
    required this.payId,
    required this.payName,
    required this.payPrice,
    required this.payDateAt,
    required this.paymentStatus
  });
  factory PayHisTory.fromJson(Map<String,dynamic> json) => _$PayHisToryFromJson(json);
  Map<String,dynamic> toJson() => _$PayHisToryToJson(this);
}
