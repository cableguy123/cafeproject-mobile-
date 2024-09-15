import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'creditinfo.g.dart';

@JsonSerializable()
class CreditInfo {
  late int? cardId;
  String payName;
  String payPrice;
  late DateTime? payDateAt;
  String paymentStatus;
  CreditInfo({
    this.cardId,
    required this.payName,
    required this.payPrice,
    this.payDateAt,
    required this.paymentStatus
  });
  factory CreditInfo.fromJson(Map<String,dynamic> json) => _$CreditInfoFromJson(json);
  Map<String,dynamic> toJson() => _$CreditInfoToJson(this);
}