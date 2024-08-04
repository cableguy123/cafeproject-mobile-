// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:cafeproject/screen/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void testDynamic() {
  dynamic value = 'Hello, World!';
  print('Initial dynamic value: $value');

  value = 42;
  print('Updated dynamic value: $value');

  value = true;
  print('Updated dynamic value: $value');
}

void testSymbol() {
  Symbol symbol1 = #exampleSymbol;
  Symbol symbol2 = Symbol('exampleSymbol');

  print('Symbol1: $symbol1');
  print('Symbol2: $symbol2');
}

void testRunes() {
  Runes input = Runes('Hello, \u2665');
  String output = String.fromCharCodes(input);

  print('Runes: $input');
  print('String from Runes: $output');
}

void testFunction() {
  int multiplyByTwo(int x) => x * 2;
  int add(int x, int y) => x + y;

  Function function1 = multiplyByTwo;
  Function function2 = add;

  print('Function1 result: ${function1(5)}');
  print('Function2 result: ${function2(5, 3)}');
}

void testFuture() {
  Future<int> delayedResult() async {
    await Future.delayed(Duration(seconds: 2));
    return 42;
  }

  delayedResult().then((value) {
    print('Future result: $value');
  });

  print('Waiting for future...');
}

void testStream() {
  Stream<int> countStream(int max) async* {
    for (int i = 0; i < max; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  Stream<int> stream = countStream(5);

  stream.listen((value) {
    print('Stream value: $value');
  });

  print('Waiting for stream...');
}
void main() {
  testDynamic();
  testSymbol();
  testRunes();
  testFunction();
  testFuture();
  testStream();
}