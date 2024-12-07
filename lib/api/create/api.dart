import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;

mixin class API {
  static const String apiUrl = 'http://10.0.2.2:3000/create';
  Future<void> createUser({required String email,required String password}) async {
    final url = Uri.parse("http://10.0.2.2:3000/createUser");
    final request = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password
      }),
    );
    if(request.statusCode == 200) {
      // 未加入
      // メール認証終わってから
    } else {
      // すでに加入登録済みである会員なら

    }
  }
}