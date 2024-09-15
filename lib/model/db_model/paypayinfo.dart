import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'paypayinfo.g.dart';

@JsonSerializable()
class PayPayInfo {
  late int? payId;
  String payName;
  String payPrice;
  String payNumber;
  late DateTime? payDateAt;
  String paymentStatus;
  PayPayInfo({
    this.payId,
    required this.payName,
    required this.payPrice,
    required this.payNumber,
    this.payDateAt,
    required this.paymentStatus
  });
  factory PayPayInfo.fromJson(Map<String,dynamic> json) => _$PayPayInfoFromJson(json);
  Map<String,dynamic> toJson() => _$PayPayInfoToJson(this);
}