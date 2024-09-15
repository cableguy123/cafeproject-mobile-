import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  late int? orderId;
  int userId;
  String paymentMethod;
  int amount;
  String paymentStatus;
  late DateTime? createAt;
  Order({
    this.orderId,
    required this.userId,
    required this.paymentMethod,
    required this.amount,
    required this.paymentStatus,
    this.createAt
  });
  factory Order.fromJson(Map<String,dynamic> json) => _$OrderFromJson(json);
  Map<String,dynamic> toJson() => _$OrderToJson(this);
 }