import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  int id;
  String productName;
  String productCode;
  int productPrice;
  Cart({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.productPrice
  });
  factory Cart.fromJson(Map<String,dynamic> json) => _$CartFromJson(json);
  Map<String,dynamic> toJson() => _$CartToJson(this);

}