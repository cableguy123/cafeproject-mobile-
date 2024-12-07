// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
      id: (json['id'] as num).toInt(),
      productName: json['productName'] as String,
      productCode: json['productCode'] as String,
      productPrice: (json['productPrice'] as num).toInt(),
    );

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'productCode': instance.productCode,
      'productPrice': instance.productPrice,
    };
