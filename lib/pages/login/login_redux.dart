// This file is "main.dart"
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/data/hardcoded/secret_key.dart';
import 'package:inspflutterfrontend/pages/home/home_screen.dart';
import 'package:inspflutterfrontend/pages/login/login_screen.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:retrofit/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../apiservices/models/login/login_request_model.dart';
import '../../apiservices/models/login/login_response_model.dart';
import '../../apiservices/remote_data_source.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'login_redux.freezed.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
//part 'home_redux.g.dart';

@freezed
class LoginAppState with _$LoginAppState {
  const factory LoginAppState(
      [@Default('') String emailId,
      @Default('') String password,
      @Default(false) bool isPasswordVisible,
      @Default(false) bool isLoading]) = _LoginAppState;
}

sealed class LoginAction {}

class UpdateEmailId extends LoginAction {
  String emailId;

  UpdateEmailId({required this.emailId});
}

class UpdatePassword extends LoginAction {
  String password;

  UpdatePassword({required this.password});
}

class UpdatePasswordVisibleStatus extends LoginAction {
  bool isPasswordVisible;

  UpdatePasswordVisibleStatus({required this.isPasswordVisible});
}

class UpdateIsLoading extends LoginAction {
  bool isLoading;

  UpdateIsLoading({required this.isLoading});
}

LoginAppState _loginStateReducer(LoginAppState state, LoginAction action) {
  switch (action) {
    case UpdateEmailId():
      {
        return state.copyWith(emailId: action.emailId);
      }
    case UpdatePassword():
      {
        return state.copyWith(password: action.password);
      }
    case UpdatePasswordVisibleStatus():
      return state.copyWith(isPasswordVisible: action.isPasswordVisible);
    case UpdateIsLoading():
      return state.copyWith(isLoading: action.isLoading);
  }
}

LoginAppState loginStateReducer(LoginAppState state, dynamic action) {
  var upState = _loginStateReducer(state, action);
  if (kDebugMode) {}
  return upState;
}

ThunkAction<LoginAppState> handleLogin(BuildContext context) {
  return (Store<LoginAppState> store) async {
    if (store.state.password.isNotEmpty && store.state.emailId.isNotEmpty) {
      LoginScreen.dispatch(context, UpdateIsLoading(isLoading: true));
      final loginRemoteDataSource = RemoteDataSource();
      final loginRequestModel = LoginRequestModel(
          secret_key: secretKey,
          email: store.state.emailId,
          password: store.state.password,
          device_os: 'windows',
          device_width: '136',
          device_height: '768',
          device_manufacturer: 'HP',
          device_id: 'D123d',
          device_uuid: 'UUID123');
      // final HttpResponse<LoginResponseModel> result =loginRemoteDataSource.deviceLogin(loginRequestModel);

      final sharedPrefs = await SharedPreferences.getInstance();
      await sharedPrefs.setString(
          'insp_user_profile',
          jsonEncode({
            "status": true,
            "response_message": "Login Successful...",
            "result": {
              // "id": "3",
              // "name": "Teacher",
              // "mobile": "9976543210",
              // "email": "teacher@gmail.com",
              // "token": "4fe844d94aac5559298d987f38083946",
              // "status": "1",
              // "paid_status": 0,
              // "user_type": 0

              "id": "22051",
              "name": "  test 100",
              "mobile": "9999990099",
              "email": "test100@gmail.com",
              "opting_classes": "",
              "present_class": "",
              "token": "54a19b3a2bc27da0e12a56e04aee3bc8",
              "status": "1",
              "paid_status": 1,
              "user_type": 0
            }
          }));

      if (kDebugMode) {}

      INSPCardModel inspCardModel = const INSPCardModel("", "", "", "");

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen.getScreen(inspCardModel)));

      // if (result.response.statusCode == 201) {
      //   if (result.data.status == true) {
      //     final sharedPrefs = await SharedPreferences.getInstance();
      //     await sharedPrefs.setString('insp_user_profile',
      //         jsonEncode(result.data.loginResponseModelResult.toJson()));

      //     if (kDebugMode) {
      //     }

      //     INSPCardModel inspCardModel = const INSPCardModel("", "", "", "");

      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //             builder: (context) => HomeScreen.getScreen(inspCardModel)));
      //   } else {
      //     LoginScreen.dispatch(context, UpdateIsLoading(isLoading: false));
      //     Fluttertoast.showToast(
      //         msg: "Invalid credentials",
      //         toastLength: Toast.LENGTH_SHORT,
      //         gravity: ToastGravity.CENTER,
      //         timeInSecForIosWeb: 1,
      //         fontSize: 16.0);
      //   }
      // } else {
      //   LoginScreen.dispatch(context, UpdateIsLoading(isLoading: false));
      //   Fluttertoast.showToast(
      //       msg: "error logging in",
      //       toastLength: Toast.LENGTH_SHORT,
      //       gravity: ToastGravity.CENTER,
      //       timeInSecForIosWeb: 1,
      //       fontSize: 16.0);
      // }
    } else {
      Fluttertoast.showToast(
          msg: "Please add credentials",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }
  };
}

ThunkAction<LoginAppState> navigateToHomeIfLoggedIn(BuildContext context) {
  return (Store<LoginAppState> store) async {
    final sharedPrefs = await SharedPreferences.getInstance();

    INSPCardModel inspCardModel = const INSPCardModel("", "", "", "");

    if ((sharedPrefs.getString('insp_user_profile') ?? '').isNotEmpty) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen.getScreen(inspCardModel)));
    }
  };
}
