// This file is "main.dart"
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/utils/capitalize.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/card/model/latest_assignment_card_model.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'myupload_widget_redux.freezed.dart';

@freezed
class MyUploadWidgetAppState with _$MyUploadWidgetAppState {
  const factory MyUploadWidgetAppState({
    @Default([]) List<LatestAssignmentCardModel> myUploadData,
  }) = _MyUploadWidgetAppState;
}

sealed class MyUploadWidgetAction {}

class UpdatemyUploadData extends MyUploadWidgetAction {
  List<LatestAssignmentCardModel> myUploadData;

  UpdatemyUploadData({required this.myUploadData});
}

MyUploadWidgetAppState _myUploadWidgetReducer(
    MyUploadWidgetAppState state, MyUploadWidgetAction action) {
  switch (action) {
    case UpdatemyUploadData():
      return state.copyWith(myUploadData: action.myUploadData);
  }
}

MyUploadWidgetAppState myUploadWidgetReducer(
    MyUploadWidgetAppState state, dynamic action) {
  var upState = _myUploadWidgetReducer(state, action);
  return upState;
}

ThunkAction<MyUploadWidgetAppState> getLatestAssigmentapi(
    BuildContext context) {
  return (Store<MyUploadWidgetAppState> store) async {
    final remoteDataSource = RemoteDataSource();
    String userToken = getUserToken(context);
    final latestAssignment =
        await remoteDataSource.getLatestAssignment(userToken);
    if (latestAssignment.data.data.isNotEmpty) {
      var allAssignmentResults = latestAssignment.data.data;
      final List<LatestAssignmentCardModel> latestSoloCardModels =
          allAssignmentResults
              .map((latestAssignmentResult) => LatestAssignmentCardModel(
                  latestAssignmentResult.id.toString(),
                  latestAssignmentResult.topicName == ""
                      ? "General"
                      : capitalizeFirstLetter(latestAssignmentResult.topicName),
                  latestAssignmentResult.topicId,
                  latestAssignmentResult.instructorName,
                  latestAssignmentResult.description))
              .toList();

      store.dispatch(UpdatemyUploadData(myUploadData: latestSoloCardModels));
    }
  };
}
