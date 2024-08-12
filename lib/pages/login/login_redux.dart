// This file is "main.dart"
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/pages/home/home_screen.dart';
import 'package:inspflutterfrontend/data/hardcoded/secret_key.dart';
import 'package:inspflutterfrontend/pages/login/login_screen.dart';
import 'package:inspflutterfrontend/utils/localstorage.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:retrofit/dio.dart';

import '../../apiservices/models/login/login_request_model.dart';
import '../../apiservices/models/login/login_response_model.dart';
import '../../apiservices/remote_data_source.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'login_redux.freezed.dart';

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
      final HttpResponse<LoginResponseModel> result =
          await loginRemoteDataSource.deviceLogin(loginRequestModel);

      if (result.response.statusCode == 201) {
        if (result.data.status == true) {
          await storeData('insp_user_profile',
              jsonEncode(result.data.loginResponseModelResult.toJson()));

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                      userData: result.data.loginResponseModelResult)));
        } else {
          LoginScreen.dispatch(context, UpdateIsLoading(isLoading: false));
          Fluttertoast.showToast(
              msg: "Invalid credentials",
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: const Color(0xFF3C8DBC),
              timeInSecForIosWeb: 1,
              fontSize: 20.0);
        }
      } else {
        LoginScreen.dispatch(context, UpdateIsLoading(isLoading: false));
        Fluttertoast.showToast(
            msg: "error logging in",
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: const Color(0xFF3C8DBC),
            timeInSecForIosWeb: 1,
            fontSize: 20.0);
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please add credentials",
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: const Color(0xFF3C8DBC),
          timeInSecForIosWeb: 1,
          fontSize: 20.0);
    }
  };
}
