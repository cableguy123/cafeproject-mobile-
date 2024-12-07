import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cafeproject/controller/router/router.dart';
import 'package:cafeproject/screen/splashscreenstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



void main() {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}
class MainApp extends StatelessWidget{
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
