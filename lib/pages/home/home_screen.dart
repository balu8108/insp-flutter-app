import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/pages/home/student_home_screen.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/home/teacher_home_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.userData});

  final LoginResponseModelResult userData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: userData.userType == 0
                ? StudentHomeScreen()
                : TeacherHomeScreen()));
  }
}
