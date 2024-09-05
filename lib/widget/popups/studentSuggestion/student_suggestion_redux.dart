// This file is "main.dart"
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/apiservices/models/feedback/create_student_feedback_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/login/login_response_model.dart';
import 'package:inspflutterfrontend/apiservices/remote_data_source.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:toastification/toastification.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'student_suggestion_redux.freezed.dart';

@freezed
class StudentSuggestionAppState with _$StudentSuggestionAppState {
  const factory StudentSuggestionAppState(
      {@Default('') String? feedback,
      @Default('') String? feedbackError}) = _StudentSuggestionAppState;
}

sealed class StudentSuggestionAction {}

class UpdateFeedback extends StudentSuggestionAction {
  String? feedback;
  UpdateFeedback({required this.feedback});
}

StudentSuggestionAppState _studentSuggestionStateReducer(
    StudentSuggestionAppState state, StudentSuggestionAction action) {
  switch (action) {
    case UpdateFeedback():
      return state.copyWith(feedback: action.feedback, feedbackError: '');
  }
}

StudentSuggestionAppState studentSuggestionStateReducer(
    StudentSuggestionAppState state, dynamic action) {
  var upState = _studentSuggestionStateReducer(state, action);
  return upState;
}

ThunkAction<StudentSuggestionAppState> studentSuggestionapi(
    BuildContext context) {
  return (Store<StudentSuggestionAppState> store) async {
    try {
      if (store.state.feedback != '') {
        LoginResponseModelResult userData = await getUserData();
        CreateStudentFeedbackRequestModel suggestionRequest =
            CreateStudentFeedbackRequestModel(
                feedback: store.state.feedback ?? '',
                studentEmail: userData.email,
                studentName: userData.name);
        final remoteDataSource = RemoteDataSource();
        final deleteTopicData = await remoteDataSource.createStudentFeedback(
            suggestionRequest, 'Token ${userData.token}');

        if (deleteTopicData.response.statusCode == 200) {
          Navigator.of(context).pop();
          toastification.show(
            context: context, // optional if you use ToastificationWrapper
            type: ToastificationType.success,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            title: const Text('Suggestion submitted Succesfully'),
            alignment: Alignment.topRight,
          );
        } else {
          Navigator.of(context).pop();
          toastification.show(
            context: context, // optional if you use ToastificationWrapper
            type: ToastificationType.warning,
            style: ToastificationStyle.fillColored,
            autoCloseDuration: const Duration(seconds: 3),
            title: const Text('Some issue, please try again'),
            alignment: Alignment.topRight,
          );
        }
      } else {
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          type: ToastificationType.warning,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          title: const Text('Please insert suggestion'),
          alignment: Alignment.topRight,
        );
      }
    } catch (error) {
      print(error);
      Navigator.of(context).pop();
      toastification.show(
        context: context, // optional if you use ToastificationWrapper
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 3),
        title: const Text('Some issue, please try again'),
        alignment: Alignment.topRight,
      );
    }
  };
}
