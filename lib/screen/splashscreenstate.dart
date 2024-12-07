import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool isAnimationFinished = false;
  late AnimationController _controller = AnimationController(
    vsync: this,
  );
  @override
  void initState() {
    super.initState(); // 初期状態
    _controller = AnimationController(vsync: this); // 初期状態アニメ効果追加
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // イメージロード
        child: Lottie.asset(
            'assets/anime.json',
          onLoaded: (composition) {
            Future.delayed(composition.duration, () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (mounted == true) {
                  context.go('/home');
                }
              });
            });
          }
        ),
      ),
    );
  }
}
