// This file is "main.dart"
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/login/device_login_request_model.dart';
import 'package:inspflutterfrontend/main.dart';
import 'package:inspflutterfrontend/pages/home/mobile_home_screen.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:toastification/toastification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/pages/home/home_screen.dart';
import 'package:inspflutterfrontend/data/hardcoded/secret_key.dart';
import 'package:inspflutterfrontend/utils/localstorage.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:retrofit/dio.dart';

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

LoginAppState loginStateReducer(LoginAppState state, dynamic action) {
  if (action is UpdateEmailId) {
    return state.copyWith(emailId: action.emailId);
  } else if (action is UpdatePassword) {
    return state.copyWith(password: action.password);
  } else if (action is UpdatePasswordVisibleStatus) {
    return state.copyWith(isPasswordVisible: action.isPasswordVisible);
  } else if (action is UpdateIsLoading) {
    return state.copyWith(isLoading: action.isLoading);
  }
  return state;
}

ThunkAction<AppState> handleLogin(BuildContext context) {
  return (Store<AppState> store) async {
    final loginState = store.state.loginState;

    if (loginState.password.isNotEmpty && loginState.emailId.isNotEmpty) {
      store.dispatch(UpdateIsLoading(isLoading: true));

      try {
        final loginRemoteDataSource = RemoteDataSource();
        final loginRequestModel = DeviceLoginRequestModel(
          secret_key: secretKey,
          email: loginState.emailId,
          password: loginState.password,
          device_os: 'windows',
          device_width: '136',
          device_height: '768',
          device_manufacturer: 'HP',
          device_id: 'D123d',
          device_uuid: 'UUID123',
        );

        final HttpResponse<LoginResponseModel> result =
            await loginRemoteDataSource.deviceLogin(loginRequestModel);

        if (result.response.statusCode == 201) {
          if (result.data.status == true) {
            await storeData(
              'insp_user_profile',
              jsonEncode(result.data.loginResponseModelResult.toJson()),
            );

            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) =>
            //         HomeScreen(userData: result.data.loginResponseModelResult),
            //   ),
            // );

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => MainScaffold(
                        content: MobileHomeScreen(
                            userData: result.data.loginResponseModelResult),
                      )),
            );

            store.dispatch(UpdateIsLoading(isLoading: false));
            toastification.show(
              context: context, // optional if you use ToastificationWrapper
              type: ToastificationType.success,
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 3),
              title: const Text("Logging you in !!"),
              alignment: Alignment.topRight,
            );
          } else if (result.data.status == false) {
            store.dispatch(UpdateIsLoading(isLoading: false));
            toastification.show(
              context: context, // optional if you use ToastificationWrapper
              type: ToastificationType.warning,
              style: ToastificationStyle.fillColored,
              autoCloseDuration: const Duration(seconds: 3),
              title: const Text("Sorry... Cannot Login More Than 2 Devices..."),
              alignment: Alignment.topRight,
            );
          }
        } else {
          store.dispatch(UpdateIsLoading(isLoading: false));
          toastification.show(
            context: context, // optional if you use ToastificationWrapper
            type: ToastificationType.warning,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            title: const Text('Invalid Credential'),
            alignment: Alignment.topRight,
          );
        }
      } catch (error) {
        store.dispatch(UpdateIsLoading(isLoading: false));
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          type: ToastificationType.error,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          title: const Text('Error logging in'),
          alignment: Alignment.topRight,
        );
      }
    } else {
      toastification.show(
        context: context, // optional if you use ToastificationWrapper
        type: ToastificationType.warning,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 3),
        title: const Text("Please add credentials"),
        alignment: Alignment.topRight,
      );
    }
  };
}
