// This file is "main.dart"
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/card/model/lecture_assignment_card_model.dart';
import 'package:inspflutterfrontend/widget/card/model/lecture_card_model.dart';
import 'package:inspflutterfrontend/apiservices/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';
import 'package:inspflutterfrontend/apiservices/remote_data_source.dart';
import 'package:inspflutterfrontend/pages/common/lecture/lecturedetailpage/lecture_detail_screen.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'lecture_detail_redux.freezed.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
//part 'home_redux.g.dart';

@freezed
class LectureDetailAppState with _$LectureDetailAppState {
  const factory LectureDetailAppState(
      {required LectureCardModel selectedItem,
      @Default(0) question,
      @Default(AllLecturesData(
          questionLogCount: 0,
          liveClassRoom: LecturesDetailResponseModelData()))
      AllLecturesData lectureData,
      @Default([]) List<LectureAssignmentCardModel> assignments,
      @Default([]) List<LectureCardModel> allLectureDetailsCardModel,
      @Default('') String query}) = _LectureDetailAppState;
}

LectureDetailAppState lectureDetailReducer(
    LectureDetailAppState state, dynamic action) {
  var upState = _lectureDetailReducer(state, action);
  if (kDebugMode) {}
  return upState;
}

sealed class LectureDetailAction {}

class UpdateQueryText extends LectureDetailAction {
  String query;

  UpdateQueryText({required this.query});
}

class UpdateLectureData extends LectureDetailAction {
  AllLecturesData lectureDataRes;

  UpdateLectureData({required this.lectureDataRes});
}

class UpdateAssignmentData extends LectureDetailAction {
  List<LectureAssignmentCardModel> assignments;

  UpdateAssignmentData({required this.assignments});
}

LectureDetailAppState _lectureDetailReducer(
    LectureDetailAppState state, LectureDetailAction action) {
  switch (action) {
    case UpdateQueryText():
      return state.copyWith(query: action.query);
    case UpdateLectureData():
      return state.copyWith(lectureData: action.lectureDataRes);
    case UpdateAssignmentData():
      return state.copyWith(assignments: action.assignments);
  }
}

ThunkAction<LectureDetailAppState> getAllAssignment(
    BuildContext context, String topicId) {
  return (Store<LectureDetailAppState> store) async {
    final remoteDataSource = RemoteDataSource();
    String userToken = await getUserToken();
    final allAssignment =
        await remoteDataSource.getAssigmentByTopicId(topicId, userToken);
    if (allAssignment.response.statusCode == 200) {
      final List<LectureAssignmentCardModel> lecturesDetailResponse =
          (allAssignment
              .data.data
              .map((it) => LectureAssignmentCardModel(
                  it.id.toString(), it.description, it.assignmentFiles))
              .toList());

      LectureDetailScreen.dispatch(
          context, UpdateAssignmentData(assignments: lecturesDetailResponse));
    } else {}
  };
}

ThunkAction<LectureDetailAppState> showLectureDetail(
    BuildContext context, LectureCardModel lecture) {
  return (Store<LectureDetailAppState> store) async {
    final remoteDataSource = RemoteDataSource();
    String userToken = await getUserToken();
    final lectureDetail = await remoteDataSource.getLecturesDetailByRoomId(
        lecture.roomId, userToken);
    if (lectureDetail.response.statusCode == 200) {
      final lecturesDetailResponse = lectureDetail.data.data;

      LectureDetailScreen.dispatch(
          context,
          getAllAssignment(
              context,
              lecturesDetailResponse
                  .liveClassRoom.liveClassRoomDetail.topicId));

      LectureDetailScreen.dispatch(
          context, UpdateLectureData(lectureDataRes: lecturesDetailResponse));
    } else {}
  };
}

ThunkAction<LectureDetailAppState> initialFetchLectureDetail(
    BuildContext context) {
  return (Store<LectureDetailAppState> store) async {
    LectureDetailScreen.dispatch(
        context, showLectureDetail(context, store.state.selectedItem));
  };
}
