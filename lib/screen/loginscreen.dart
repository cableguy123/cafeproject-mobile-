import 'package:cafeproject/api/login/api.dart';
import 'package:cafeproject/controller/valid/validate.dart';
import 'package:cafeproject/design/fontcolors/ProjectColors.dart';
import 'package:cafeproject/model/db_model/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with API {
  final formKey = GlobalKey<FormState>();
  ValidateForm validateForm = ValidateForm();
  final passWordKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  FocusNode emailTextFocusNode = FocusNode();
  FocusNode passwordTextFocusNode = FocusNode();
  bool isVisible = false;
  void toggleShowPassword() {
    setState(() {
      isVisible = !isVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.arrow_back, size: 30, color: Colors.black),
                ),
                const SizedBox(
                  height: 20
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "ログイン",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration: TextDecoration.none
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: TextFormField(
                      controller: emailController,
                      autofocus: true,
                      focusNode: emailTextFocusNode,
                      // これがないとメール入力が終わってパスワードに Focusが Iconにいく
                      onFieldSubmitted: (_) => FocusScope.of(context).nextFocus(),
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp("[0-9@a-zA-Z.]")),
                      ],
                      // 自動修正活性化しない
                      autocorrect: false,
                      // リンク先検証する時、ユーザーが選択する
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.close, color: Colors.grey,size: 18),
                          onPressed: () => emailController.clear(),
                        ),
                        // 選択してない時外の形を丸くする
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "メールを入力してください。",
                        hintStyle: const TextStyle(fontSize: 16,color: Colors.black45),
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        counterText: "",
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Projectcolors.kPrimaryEmailBorderColor,width: 1.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: validateForm.validateEmail,
                      onChanged: (value) {
                        setState(() {
                          if(validateForm.validateEmail(value) == null) {
                            Projectcolors.kPrimaryEmailBorderColor = Projectcolors.kPrimaryEmailOKColor;
                          } else {
                            Projectcolors.kPrimaryEmailBorderColor = Projectcolors.kPrimaryEmailNullColor;
                          }
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: passWordKey,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    child: TextFormField(
                      autocorrect: false, // パスワード自動修正しない
                      enableSuggestions: false, // 自動単語完成機能はアンドロイドだけ、iOSは別で行う
                      obscureText: !isVisible,
                      focusNode: passwordTextFocusNode,
                      autofocus: true,
                      controller: passwordController,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[a-zA-Z0-9!@#$%^&*()_+|~=`{}\[\]:";<>?,./]')
                        ),
                      ],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off_outlined),
                            color: Colors.black,
                            onPressed: () => toggleShowPassword()
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "パスワードを入力してください。",
                      hintStyle: const TextStyle(fontSize: 16,color: Colors.black45),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      counterText: "",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Projectcolors.kPrimaryPassWordBorderColor,width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      validator: validateForm.validatePwd,
                      onChanged: (value) {
                        setState(() {
                          if(validateForm.validatePwd(value) == null) {
                            Projectcolors.kPrimaryPassWordBorderColor = Projectcolors.kPrimaryPassWordOKColor;
                          } else {
                            Projectcolors.kPrimaryPassWordBorderColor = Projectcolors.kPrimaryPassWordNullColor;
                          }
                        });
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 10.0,0,0),
                  child: new GestureDetector(
                    onTap: () => {
                      Navigator.pushNamed(context,"/homeScreen"),
                    },
                    child: Text(
                      "パスワードを忘れた方へ",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Projectcolors.kPrimaryPassWordForgotColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 55.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: 100,
                        ),
                      child: ElevatedButton(
                          onPressed: () => login(email: emailController.value.text,password: passwordController.value.text),
                          child: const Text("ログイン")
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






















