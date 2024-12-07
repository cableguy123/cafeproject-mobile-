import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:developer';


mixin class API {
  static const String apiUrl = 'http://10.0.2.2:3000/login';
  String accessTokenKey = "";
  String secretKey = "";
  Future<void> login({required String email,required String password}) async {
    final url = Uri.parse(apiUrl);
    final response = await http.post(
      url,
      headers: {'Content-Type' : 'application/json'},
      // Encode -> JSON 데이터 변환
      body: jsonEncode({
        'email': email,
        'password' : password
      }),
    );
    if(response.statusCode == 200) {
      final Map<String,dynamic> responseData = json.decode(response.body);
      log("レスポンスデータは =  $responseData");
      if(responseData['accessToken'] != null) {
        // クッキーをローカルで保存する
        final secureStorage = new FlutterSecureStorage();
        await secureStorage.write(key: 'accessToken',value: accessTokenKey);
        final accessToken = await secureStorage.read(key: 'accessToken');


      }
    }
  }

}

