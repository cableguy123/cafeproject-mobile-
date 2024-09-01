import 'package:cafeproject/api/post.dart';
import 'package:cafeproject/screen/homescreen.dart';
import 'package:cafeproject/screen/login/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class createUserScreen extends StatefulWidget {
  @override
  _createUserState createState() => _createUserState();
}

class _createUserState extends State<createUserScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future<void> _createUser() async {
    // final url = Uri.parse("http://10.0.2.2:3000/signup");
    final url = Uri.parse("${API.URL}/signup");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Sign up successful')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to sign up')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('会員登録')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFieldWidget(textEditingController: _nameController, labelText: '名前', paddingValue: 30.0),
            TextFieldWidget(textEditingController: _emailController, labelText: 'メール', paddingValue: 30.0),
            PassWordFieldWidget(textEditingController: _passwordController, labelText: 'パスワード', paddingValue: 30.0),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _createUser,
              child: const Text('登録'),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String labelText;
  final double paddingValue;
  const TextFieldWidget({super.key,required this.textEditingController,required this.labelText,required this.paddingValue});
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(labelText: labelText,contentPadding: EdgeInsets.only(bottom: paddingValue),floatingLabelBehavior: FloatingLabelBehavior.never),
    );
  }
}

