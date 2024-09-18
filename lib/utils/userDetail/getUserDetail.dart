import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/localstorage.dart';

Future<LoginResponseModelResult> getUserData() async {
  String? data = await getData('insp_user_profile');
  if (data != null && data.isNotEmpty) {
    final LoginResponseModelResult userData =
        LoginResponseModelResult.fromJson(jsonDecode(data));
    return userData;
  } else {
    return const LoginResponseModelResult('', '', '', '', '', '', '', '', 0, 0);
  }
}

LoginResponseModelResult getUserDataFromStore(BuildContext context) {
  final LoginResponseModelResult userData =
      StoreProvider.of<AppState>(context).state.userDataAppState.userData;
  if (userData.id.isNotEmpty) {
    return userData;
  } else {
    return const LoginResponseModelResult('', '', '', '', '', '', '', '', 0, 0);
  }
}

String getUserToken(BuildContext context) {
  final LoginResponseModelResult userData =
      StoreProvider.of<AppState>(context).state.userDataAppState.userData;
  if (userData.id.isNotEmpty) {
    return 'Token ${userData.token}';
  } else {
    return "";
  }
}

bool isTeacherLogin(BuildContext context) {
  final LoginResponseModelResult userData =
      StoreProvider.of<AppState>(context).state.userDataAppState.userData;
  if (userData.id.isNotEmpty) {
    if (userData.userType == 1) {
      return true;
    }
    return false;
  } else {
    return false;
  }
}
