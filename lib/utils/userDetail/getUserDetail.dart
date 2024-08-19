import 'dart:convert';

import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/utils/localstorage.dart';

Future<LoginResponseModelResult> getUserData() async {
  String? data = await getData('insp_user_profile');
  if (data != null && data.isNotEmpty) {
    final LoginResponseModelResult userData =
        LoginResponseModelResult.fromJson(jsonDecode(data));
    return userData;
  } else {
    return LoginResponseModelResult('', '', '', '', '', '', '', '', 0, 0);
  }
}

Future<String> getUserToken() async {
  String? data = await getData('insp_user_profile');
  if (data != null && data.isNotEmpty) {
    final LoginResponseModelResult userData =
        LoginResponseModelResult.fromJson(jsonDecode(data));
    return 'Token ${userData.token}';
  } else {
    return "";
  }
}

Future<bool> isTeacherLogin() async {
  String? data = await getData('insp_user_profile');
  if (data != null && data.isNotEmpty) {
    final LoginResponseModelResult userData =
        LoginResponseModelResult.fromJson(jsonDecode(data));
    if (userData.userType == 1) {
      return true;
    }
    return false;
  } else {
    return false;
  }
}
