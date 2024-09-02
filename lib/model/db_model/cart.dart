import 'dart:convert';
import 'package:http/http.dart' as http;

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
  factory Cart.fromJson(Map<String,dynamic> json) {
    return Cart(
      id: json['id'],
      productName:  json['productName'],
      productCode: json['productCode'],
      productPrice: json['productPrice']
    );
  }
}