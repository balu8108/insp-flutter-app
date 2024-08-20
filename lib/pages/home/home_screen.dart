import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/apiservices/remote_data_source.dart';
import 'package:inspflutterfrontend/data/hardcoded/secret_key.dart';
import 'package:inspflutterfrontend/pages/home/student_home_screen.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/home/teacher_home_screen.dart';
import 'package:inspflutterfrontend/widget/popups/tokenexpire.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.userData});

  final LoginResponseModelResult userData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    checkStoreToken(widget.userData);
  }

  void checkStoreToken(LoginResponseModelResult userData) async {
    final remoteDataSource = RemoteDataSource();
    final LoginRequestModel loginData =
        LoginRequestModel(secret_key: secretKey, token: userData.token);
    final isUserTokenValid = await remoteDataSource.doesTokenValid(loginData);
    if (!isUserTokenValid.data.status) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return TokenExpired();
          });
    } else {
      print("DONE");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: widget.userData.userType == 0
            ? StudentHomeScreen()
            : TeacherHomeScreen(),
      ),
    );
  }
}
