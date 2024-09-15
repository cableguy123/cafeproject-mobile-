// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditInfo _$CreditInfoFromJson(Map<String, dynamic> json) => CreditInfo(
      cardId: (json['cardId'] as num?)?.toInt(),
      payName: json['payName'] as String,
      payPrice: json['payPrice'] as String,
      payDateAt: json['payDateAt'] == null
          ? null
          : DateTime.parse(json['payDateAt'] as String),
      paymentStatus: json['paymentStatus'] as String,
    );

Map<String, dynamic> _$CreditInfoToJson(CreditInfo instance) =>
    <String, dynamic>{
      'cardId': instance.cardId,
      'payName': instance.payName,
      'payPrice': instance.payPrice,
      'payDateAt': instance.payDateAt?.toIso8601String(),
      'paymentStatus': instance.paymentStatus,
    };
