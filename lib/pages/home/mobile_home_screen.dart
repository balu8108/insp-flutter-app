import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/apiservices/remote_data_source.dart';
import 'package:inspflutterfrontend/data/hardcoded/secret_key.dart';
import 'package:inspflutterfrontend/pages/home/student_home_screen.dart';
import 'package:inspflutterfrontend/pages/home/teacher_home_screen.dart';
import 'package:inspflutterfrontend/widget/mobileAppbar/mobileAppbar.dart';
import 'package:inspflutterfrontend/widget/popups/tokenexpire.dart';

class MobileHomeScreen extends StatefulWidget {
  const MobileHomeScreen({super.key, required this.userData});

  final LoginResponseModelResult userData;

  @override
  _MobileHomeScreenState createState() => _MobileHomeScreenState();
}

class _MobileHomeScreenState extends State<MobileHomeScreen> {
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.userData.userType == 0
        ? StudentHomeScreen()
        : TeacherHomeScreen();
  }
}
