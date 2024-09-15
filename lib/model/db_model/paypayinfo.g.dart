// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paypayinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PayPayInfo _$PayPayInfoFromJson(Map<String, dynamic> json) => PayPayInfo(
      payId: (json['payId'] as num?)?.toInt(),
      payName: json['payName'] as String,
      payPrice: json['payPrice'] as String,
      payNumber: json['payNumber'] as String,
      payDateAt: json['payDateAt'] == null
          ? null
          : DateTime.parse(json['payDateAt'] as String),
      paymentStatus: json['paymentStatus'] as String,
    );

Map<String, dynamic> _$PayPayInfoToJson(PayPayInfo instance) =>
    <String, dynamic>{
      'payId': instance.payId,
      'payName': instance.payName,
      'payPrice': instance.payPrice,
      'payNumber': instance.payNumber,
      'payDateAt': instance.payDateAt?.toIso8601String(),
      'paymentStatus': instance.paymentStatus,
    };
