// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qrcode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QrCode _$QrCodeFromJson(Map<String, dynamic> json) => QrCode(
      qrcodeId: (json['qrcodeId'] as num?)?.toInt(),
      code: json['code'] as String,
      expirationCode: json['expirationCode'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$QrCodeToJson(QrCode instance) => <String, dynamic>{
      'qrcodeId': instance.qrcodeId,
      'code': instance.code,
      'expirationCode': instance.expirationCode,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
