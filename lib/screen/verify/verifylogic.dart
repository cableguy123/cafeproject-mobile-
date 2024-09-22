import 'package:flutter/cupertino.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

mixin verifyemailPassword {
  final FocusNode emailFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();
  final FocusNode nameFocus = FocusNode();
  String getDateFormat() {
    initializeDateFormatting('ja');
    return DateFormat.yMMMd('ja').format(DateTime.now()).toString();
  }
  int validateEmail(String emailAddress) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp =  new RegExp(pattern);
    if (emailAddress.isEmpty || emailAddress.length == 0) {
      return 1; // 0 = true , 1 = false
    } else if(!regExp.hasMatch(emailAddress)) {
      return 2;
    } else if(emailAddress.length > 256){
      return 3;
    } else {
      return 0;
    }
  }
  int validatePassword(String pwd) {
    if (pwd.isEmpty || pwd.length == 0) {
      return 1;
    } else if(pwd != null && pwd.isNotEmpty && pwd.length <= 12) {
      return 2;
    } else {
      return 0;
    }
  }
}