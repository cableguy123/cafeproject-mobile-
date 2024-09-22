import 'package:cafeproject/api/post.dart';
import 'package:cafeproject/model/db_model/user.dart';
import 'package:cafeproject/screen/homescreen.dart';
import 'package:cafeproject/screen/login/loginscreen.dart';
import 'package:cafeproject/screen/verify/verifylogic.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class createUserScreen extends StatefulWidget {
  @override
  _createUserState createState() => _createUserState();
}
class _createUserState extends State<createUserScreen> with verifyemailPassword {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isValidEmail = false;
  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.initState();
  }
  Future<void> _createUser() async {
    final url = Uri.parse("http://10.0.2.2:3000/createUser");
    final request = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'name': _nameController.text,
        'email': _emailController.text,
        'password': _passwordController.text,
        "createdAt": getDateFormat(),
      }),
    );
    if (request.statusCode == 200) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          )
      );
    } else {
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to create user')),
        );
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('会員登録')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFieldWidget(textEditingController: _nameController, labelText: '名前', paddingValue: 30.0,focusNode: emailFocus,validator: (value) {
              int res = validateEmail(value);
              if (res == 1) {
                return "Please fill email address";
              } else if(res == 2) {
                return "Please enter valid email address";
              } else {
                return null;
              }
            },
            ),
            TextFieldWidget(textEditingController: _emailController, labelText: 'メール', paddingValue: 30.0,focusNode: passwordFocus,validator: (value) {
              int res = validatePassword(value);
              if(res == 1) {
                return "Please enter Password";
              } else if(res == 2) {
                return "Please enter minimum 9 characters";
              } else {
                return null;
              }
            },
            ),
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
  final FormFieldValidator validator;
  final FocusNode focusNode;
  const TextFieldWidget({super.key,required this.textEditingController,required this.validator,required this.focusNode,required this.labelText,required this.paddingValue,});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      focusNode: focusNode,
      autofocus: false,
      decoration: InputDecoration(labelText: labelText,contentPadding: EdgeInsets.only(bottom: paddingValue),floatingLabelBehavior: FloatingLabelBehavior.never),
    );
  }
}

