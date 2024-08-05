// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:ffi';

import 'package:cafeproject/screen/settingscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void message(DateTime currentTime) {
  final now = currentTime.hour;
  final minutes = currentTime.minute;
  print("시간 :  ${now}");
  print("분 :  ${minutes} ");
  if (now >= 6 && now < 12) {
    print("おはようございます");
  } else if ((now == 12 && minutes >= 1) || (now > 12 && now < 18)) {
    print("こんにちは");
  } else {
    print("こんばんは");
  }
}

void main() {
  // 원하는 시간 설정 (예: 12시 1분)
  DateTime testTime = DateTime(2024, 8, 5, 17, 1);
  message(testTime);

  // // 다른 시간 설정 (예: 18시 30분)
  // DateTime anotherTestTime = DateTime(2024, 8, 5, 18, 30);
  // message(anotherTestTime);
}
