import 'package:cafeproject/api/create/api.dart';
import 'package:cafeproject/model/db_model/user.dart';
import 'package:cafeproject/screen/homescreen.dart';
import 'package:cafeproject/screen/loginscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CreateUserScreen extends StatefulWidget {
  const CreateUserScreen({super.key});
  @override
  State<CreateUserScreen> createState() => _CreateUserScreen();
}
class _CreateUserScreen extends State<CreateUserScreen> with API {
  //  キー
  final nameKey = GlobalKey<FormFieldState>();
  final emailKey = GlobalKey<FormState>();
  final passwordKey = GlobalKey<FormState>();
  //　コントローラ
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  //　ポーカス
  FocusNode nameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(9.0),
                  child: Text(
                      '新規会員登録',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                //　名前　

              ],
            ),
          ),
        ),
      ),
    );
  }
}



