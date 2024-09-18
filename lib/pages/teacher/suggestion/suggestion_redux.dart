// This file is "main.dart"
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/feedback/all_student_feedback_request_model.dart';
import 'package:insp/apiservices/models/feedback/all_student_feedback_response_model.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:retrofit/dio.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'suggestion_redux.freezed.dart';

@freezed
class SuggestionAppState with _$SuggestionAppState {
  const factory SuggestionAppState(
      {@Default(0) int total,
      @Default(1) int page,
      @Default(0) int totalPages,
      @Default([]) List<FeedbackModel> data}) = _SuggestionAppState;
}

sealed class SuggestionAction {}

class UpdateFeedbackData extends SuggestionAction {
  int number;
  UpdateFeedbackData({required this.number});
}

class UpdatePage extends SuggestionAction {
  int number;
  UpdatePage({required this.number});
}

class UpdateData extends SuggestionAction {
  List<FeedbackModel> data;
  UpdateData({required this.data});
}

SuggestionAppState _suggestionStateReducer(
    SuggestionAppState state, SuggestionAction action) {
  switch (action) {
    case UpdateFeedbackData():
      return state.copyWith(totalPages: action.number);
    case UpdatePage():
      return state.copyWith(page: action.number);
    case UpdateData():
      return state.copyWith(data: action.data);
  }
}

SuggestionAppState suggestionStateReducer(
    SuggestionAppState state, dynamic action) {
  var upState = _suggestionStateReducer(state, action);
  return upState;
}

ThunkAction<SuggestionAppState> getAllFeedback(BuildContext context, int page) {
  return (Store<SuggestionAppState> store) async {
    final remoteDataSource = RemoteDataSource();

    String userToken = getUserToken(context);
    final HttpResponse<AllStudentFeedbackResponseModel> allFeedback =
        await remoteDataSource.getAllStudentFeedback(
            AllStudentFeedbackRequestModel(limit: 10, page: page, search: ''),
            userToken);
    if (allFeedback.response.statusCode == 200) {
      final List<FeedbackModel> feedbacks = allFeedback.data.data;
      store.dispatch(UpdateFeedbackData(number: allFeedback.data.totalPages));
      store.dispatch(UpdatePage(number: allFeedback.data.page + 1));
      store.dispatch(UpdateData(data: feedbacks));
    }
  };
}

ThunkAction<SuggestionAppState> deleteAssignment(
    BuildContext context, int feedbackId) {
  return (Store<SuggestionAppState> store) async {
    try {
      String userToken = getUserToken(context);
      final remoteDataSource = RemoteDataSource();
      final deleteTopicData =
          await remoteDataSource.deleteStudentFeedback(feedbackId, userToken);

      if (deleteTopicData.response.statusCode == 200) {
        store.dispatch(getAllFeedback(context, store.state.page));
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          type: ToastificationType.success,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          title: const Text('Feedback Deleted Succesfully'),
          alignment: Alignment.topRight,
        );
      } else {
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          type: ToastificationType.warning,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          title: const Text('Some issue, please try again'),
          alignment: Alignment.topRight,
        );
      }
    } catch (error) {
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
