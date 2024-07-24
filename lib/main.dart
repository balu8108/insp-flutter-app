import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/login/login_screen.dart';
import 'package:inspflutterfrontend/onboarding/onboarding_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          if (kIsWeb || MediaQuery.of(context).size.width >= 600) {
            return LoginScreen.getScreen();
          } else {
            return AnimatedSplashScreen(
              duration: 3000,
              splash: _buildSplashWidget(),
              splashTransition: SplashTransition.sizeTransition,
              nextScreen: const OnboardingScreen(),
              backgroundColor: Colors.white,
            );
          }
        },
      ),
    );
  }

  Widget _buildSplashWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: 1),
          duration: const Duration(milliseconds: 1500),
          builder: (_, double sizeFactor, __) {
            return Transform.scale(
              scale: sizeFactor,
              child: Image.asset('assets/images/insplogo.png'),
            );
          },
        ),
      ],
    );
  }
}
