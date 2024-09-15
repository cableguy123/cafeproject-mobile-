import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';

part 'qrcode.g.dart';

@JsonSerializable()
class QrCode {
  late int? qrcodeId;
  String code;
  String expirationCode;
  late DateTime? createdAt;
  QrCode({
    this.qrcodeId,
    required this.code,
    required this.expirationCode,
    this.createdAt
  });
  factory QrCode.fromJson(Map<String,dynamic> json) => _$QrCodeFromJson(json); // return QrCode
  Map<String,dynamic> toJson() => _$QrCodeToJson(this); // return json data in QrCode
}