// This file is "main.dart"
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/assignments/widgets/assignmentScreen.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'assignment_screen_redux.freezed.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
//part 'home_redux.g.dart';

@freezed
class AssignmentScreenAppState with _$AssignmentScreenAppState {
  const factory AssignmentScreenAppState(
      {required INSPCardModel selectedItem,
      @Default('') String query}) = _AssignmentScreenAppState;
}

class UpdateQueryText extends AssignmentScreenAction {
  String query;

  UpdateQueryText({required this.query});
}

class UpdateSelectedItem extends AssignmentScreenAction {
  INSPCardModel selectedItem;
  UpdateSelectedItem({required this.selectedItem});
}

sealed class AssignmentScreenAction {}

AssignmentScreenAppState _assignmentCoursesStateReducer(
    AssignmentScreenAppState state, AssignmentScreenAction action) {
  switch (action) {
    case UpdateQueryText():
      return state.copyWith(query: action.query);
    case UpdateSelectedItem():
      return state.copyWith(selectedItem: action.selectedItem);
  }
}

AssignmentScreenAppState assignmentCoursesStateReducer(
    AssignmentScreenAppState state, dynamic action) {
  var upState = _assignmentCoursesStateReducer(state, action);
  if (kDebugMode) {
    // print(upState.allTopicsForSelectedCourse);
  }
  return upState;
}

ThunkAction<AssignmentScreenAppState> initialFetchAssignmentCourse(
    BuildContext context) {
  return (Store<AssignmentScreenAppState> store) async {
    AssignmentScreen.dispatch(
        context, showLectureDetail(context, store.state.selectedItem));
  };
}

ThunkAction<AssignmentScreenAppState> showLectureDetail(
    BuildContext context, INSPCardModel lecture) {
  return (Store<AssignmentScreenAppState> store) async {
    // final remoteDataSource = RemoteDataSource();
    // const token = 'Token 7e7caea58181517cdef5992796eafecb';
    // final lectureDetail =
    //     await remoteDataSource.getLecturesDetailByRoomId(lecture.roomId, token);
    // if (lectureDetail.response.statusCode == 200) {
    //   final lecturesDetailResponse = lectureDetail.data.data;
    //   LectureDetailScreen.dispatch(
    //       context, UpdateLectureData(lectureDataRes: lecturesDetailResponse));
    // } else {}
  };
}

ThunkAction<AssignmentScreenAppState> showSelectedItem(
    BuildContext context, INSPCardModel lecture) {
  return (Store<AssignmentScreenAppState> store) async {
    AssignmentScreen.dispatch(
        context, UpdateSelectedItem(selectedItem: lecture));
  };
}
