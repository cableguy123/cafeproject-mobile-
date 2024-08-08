import 'package:cafeproject/screen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            return HomeScreen();
          },
          transitionDuration: const Duration(seconds: 1),
          reverseTransitionDuration: const Duration(seconds: 1),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final color = ColorTween(
              begin: Colors.transparent,
              end: Colors.white,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: const Interval(
                0.0,
                0.5,
                curve: Curves.easeInOut,
              ),
            ));
            final opacity = Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(CurvedAnimation(
              parent: animation,
              // 後半
              curve: const Interval(
                0.5,
                1.0,
                curve: Curves.easeInOut,
              ),
            ));
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Container(
                  color: color.value,
                  child: Opacity(
                    opacity: opacity.value,
                    child: child,
                  ),
                );
              },
              child: child,
            );
          },
        ),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Lottie.asset('assets/picture.json'),
          //
      ),
    );
  }
}