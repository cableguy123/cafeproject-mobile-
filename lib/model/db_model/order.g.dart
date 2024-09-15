// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderId: (json['orderId'] as num?)?.toInt(),
      userId: (json['userId'] as num).toInt(),
      paymentMethod: json['paymentMethod'] as String,
      amount: (json['amount'] as num).toInt(),
      paymentStatus: json['paymentStatus'] as String,
      createAt: json['createAt'] == null
          ? null
          : DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'orderId': instance.orderId,
      'userId': instance.userId,
      'paymentMethod': instance.paymentMethod,
      'amount': instance.amount,
      'paymentStatus': instance.paymentStatus,
      'createAt': instance.createAt?.toIso8601String(),
    };
