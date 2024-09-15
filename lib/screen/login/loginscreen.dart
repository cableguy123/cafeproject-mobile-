import 'package:cafeproject/api/post.dart';
import 'package:cafeproject/model/db_model/user.dart';
import 'package:cafeproject/screen/signup/createuser.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  Future<void> _login() async {
    final url = Uri.parse("${API.URL}/login");
    final response = await http.post(
      url,
      headers: {'Content-Type' : 'application/json'}, 
      body: jsonEncode({
        'email': emailController.text,
        'password': passwordController.text,
      }),
    );
    if(!mounted) {
      return;
    }
    if(response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login Successfully")));
      final Map<String,dynamic> responseData = jsonDecode(response.body);
      print('response data =  $responseData');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Login is Failed")));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFieldWidget(textEditingController: emailController, labelText: 'メール', paddingValue: 30.0),
            PassWordFieldWidget(textEditingController: passwordController, labelText: 'パスワード', paddingValue: 30.0),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('ログイン'),
            ),
          ],
        ),
      ),
    );
  }
}

class PassWordFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final double paddingValue;
  const PassWordFieldWidget({super.key,required this.textEditingController,required this.labelText,required this.paddingValue});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: true,
      decoration: InputDecoration(labelText: labelText,contentPadding: EdgeInsets.only(bottom: paddingValue),floatingLabelBehavior: FloatingLabelBehavior.never),
    );
  }
}
