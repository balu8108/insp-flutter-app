import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/pages/home/home_screen.dart';
import 'package:inspflutterfrontend/pages/login/login_screen.dart';
import 'package:inspflutterfrontend/pages/onboarding/onboarding_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LoginResponseModelResult userData =
      const LoginResponseModelResult('', '', '', '', '', '', '', '', 0, 0);

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    LoginResponseModelResult userDatas = await getUserData();
    setState(() {
      userData = userDatas; // Store the fetched data
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          if (kIsWeb || MediaQuery.of(context).size.width >= 600) {
            return userData.token == ""
                ? LoginScreen.getScreen()
                : HomeScreen(userData: userData);
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
