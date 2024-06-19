// This file is "main.dart"
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/common/class_constants.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/common/model/lecture_card_model.dart';
import 'package:inspflutterfrontend/data/hardcoded/secret_key.dart';
import 'package:inspflutterfrontend/data/remote/models/mycourses/physics_course_topics_request_model.dart';
import 'package:inspflutterfrontend/mycourses/my_courses_screen.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../data/hardcoded/mycourses_subjects.dart';
import '../data/remote/models/mycourses/all_subjects_request_model.dart';
import '../data/remote/remote_data_source.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'my_courses_redux.freezed.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
//part 'home_redux.g.dart';

@freezed
class MyCoursesAppState with _$MyCoursesAppState {
  const factory MyCoursesAppState(
          {@Default([]) List<INSPCardModel> myCoursesInspCardModels,
          required INSPCardModel selectedItem,
          @Default([]) List<INSPCardModel> allTopicsForSelectedCourse,
          @Default('') String query,
          @Default([]) List<INSPCardModel> filteredTopicsForSelectedCourse}) =
      _MyCoursesAppState;
}

sealed class MyCoursesAction {}

class UpdateAllTopicsForSelectedCourse extends MyCoursesAction {
  List<INSPCardModel> inspCardModels;

  UpdateAllTopicsForSelectedCourse({required this.inspCardModels});
}

class UpdateFilteredTopicsForSelectedCourse extends MyCoursesAction {
  List<INSPCardModel> inspCardModels;

  UpdateFilteredTopicsForSelectedCourse({required this.inspCardModels});
}

class UpdateMyCoursesSubjects extends MyCoursesAction {
  List<INSPCardModel> inspCardModels;

  UpdateMyCoursesSubjects({required this.inspCardModels});
}

class UpdateSelectedItem extends MyCoursesAction {
  INSPCardModel selectedItem;

  UpdateSelectedItem({required this.selectedItem});
}

class UpdateQueryText extends MyCoursesAction {
  String query;

  UpdateQueryText({required this.query});
}

MyCoursesAppState _myCoursesStateReducer(
    MyCoursesAppState state, MyCoursesAction action) {
  switch (action) {
    case UpdateAllTopicsForSelectedCourse():
      return state.copyWith(allTopicsForSelectedCourse: action.inspCardModels);
    case UpdateMyCoursesSubjects():
      return state.copyWith(myCoursesInspCardModels: action.inspCardModels);
    case UpdateSelectedItem():
      return state.copyWith(selectedItem: action.selectedItem);
    case UpdateQueryText():
      return state.copyWith(query: action.query);
    case UpdateFilteredTopicsForSelectedCourse():
      return state.copyWith(
          filteredTopicsForSelectedCourse: action.inspCardModels);
  }
}

MyCoursesAppState myCoursesStateReducer(MyCoursesAppState state, dynamic action) {
  var upState = _myCoursesStateReducer(state, action);
  if (kDebugMode) {
    print(upState.allTopicsForSelectedCourse);
  }
  return upState;
}

ThunkAction<MyCoursesAppState> showTopicsForCourse(
    BuildContext context, INSPCardModel inspCardModel) {
  return (Store<MyCoursesAppState> store) async {
    MyCoursesScreen.dispatch(
        context, UpdateSelectedItem(selectedItem: inspCardModel));
    final remoteDataSource = RemoteDataSource();

    final selectedCardName = inspCardModel.name.toLowerCase();
    String? classType;
    String? classLevel;
    if (selectedCardName.contains('crash course')) {
      classType = ClassType.CRASH_CLASS.value;
      classLevel = ClassLevel.ALL.name;
    } else if (selectedCardName.contains('foundation')) {
      classType = ClassType.REGULAR_CLASS.value;
      classLevel = ClassLevel.Foundation_Olympiad.name;
    } else if (selectedCardName.contains('11th')) {
      classType = ClassType.REGULAR_CLASS.value;
      classLevel = ClassLevel.Class_11.name;
    } else if (selectedCardName.contains('12th')) {
      classType = ClassType.REGULAR_CLASS.value;
      classLevel = ClassLevel.Class_12.name;
    }

    if (classLevel != null && classType != null) {
      final response = await remoteDataSource.getAllLecturesForCourse(
          classType, classLevel, 'Token $secretKeyToken');

      if (response.response.statusCode == 200) {
        final List<LectureCardModel> lecturesForCourse = (response.data.data
            .map((it) => LectureCardModel(
                it.roomId ?? '',
                'Lecture ${it.liveClassRoomDetail.lectureNo ?? ''}',
                '',
                it.liveClassRoomDetail.description ?? '',
                it.liveClassRoomDetail.topicName ?? '',
                DateFormat('dd/MM/yyyy')
                    .format(DateTime.parse(it.scheduledDate)),
                ClassLevel.getValueFromName(it.classLevel ?? '')))
            .toList());

        MyCoursesScreen.dispatch(
            context,
            UpdateAllTopicsForSelectedCourse(
                inspCardModels: lecturesForCourse));

        MyCoursesScreen.dispatch(
            context,
            UpdateFilteredTopicsForSelectedCourse(
                inspCardModels: lecturesForCourse));
      } else {
        updateEmptyTopicsForSelectedCourse(context);
      }
    } else if (selectedCardName.contains('physics')) {
      final allTopics = await remoteDataSource.getAllTopicsForMyCourse(
          const PhysicsCourseTopicsRequestModel(secret_key: secretKey));
      print(allTopics.response.statusCode);
      print(allTopics.data);
      if (allTopics.response.statusCode == 201 &&
          allTopics.data.status == true) {
        final allTopicsForSubject = allTopics
                .data.physicsCourseTopicsResponseModelResult
                .mapIndexed((index, it) => INSPCardModel(
                    it.id ?? '',
                    (it.name ?? '').capitalizeFirstLetter(),
                    'Nitin Sachan',
                    myCoursePhysicsDescriptions[index] ?? ''))
                .toList() ??
            [];

        print(allTopicsForSubject);
        MyCoursesScreen.dispatch(
            context,
            UpdateAllTopicsForSelectedCourse(
                inspCardModels: allTopicsForSubject));

        MyCoursesScreen.dispatch(
            context,
            UpdateFilteredTopicsForSelectedCourse(
                inspCardModels: allTopicsForSubject));
      } else {
        updateEmptyTopicsForSelectedCourse(context);
      }
      //print(allTopics.data.allTopicsForSubjectResponseModelResult);
    } else {
      updateEmptyTopicsForSelectedCourse(context);
    }
  };
}

void updateEmptyTopicsForSelectedCourse(BuildContext context) {
  MyCoursesScreen.dispatch(
      context, UpdateAllTopicsForSelectedCourse(inspCardModels: []));
  MyCoursesScreen.dispatch(
      context, UpdateFilteredTopicsForSelectedCourse(inspCardModels: []));
}

ThunkAction<MyCoursesAppState> getMyCourses(BuildContext context) {
  return (Store<MyCoursesAppState> store) async {
    final remoteDataSource = RemoteDataSource();
    final allSubjects = await remoteDataSource.getAllSubjects(
        const AllSubjectsRequestModel(
            secret_key: secretKey));
    if (allSubjects.data.status == true) {
      var allSubjectsResults = allSubjects.data.allSubjectsResponseModelResults;
      allSubjectsResults = [
        ...allSubjectsResults, ...myAdditionalCourses];

      final inspCardModels = allSubjectsResults.reversed
          .map((allSubjectResult) => INSPCardModel(
          allSubjectResult.id ?? '',
          (allSubjectResult.name ?? '').capitalizeFirstLetter(),
              subjectStatus[8 - int.parse(allSubjectResult.id ?? '1')],
              myCoursesDescriptions[
                  8 - int.parse(allSubjectResult.id ?? '1')]))
          .toList();
      MyCoursesScreen.dispatch(
          context, UpdateMyCoursesSubjects(inspCardModels: inspCardModels));
        }
  };
}

ThunkAction<MyCoursesAppState> initialFetchTopics(BuildContext context) {
  return (Store<MyCoursesAppState> store) async {
    MyCoursesScreen.dispatch(
        context, showTopicsForCourse(context, store.state.selectedItem));
  };
}

ThunkAction<MyCoursesAppState> filterWithQueryText(
    BuildContext context, String query) {
  return (Store<MyCoursesAppState> store) async {
    MyCoursesScreen.dispatch(context, UpdateQueryText(query: query));
    final filteredTopics = store.state.allTopicsForSelectedCourse.where((it) {
      if (it is LectureCardModel) {
        return it.topicName.toLowerCase().contains(query.toLowerCase());
      } else {
        return it.name.toLowerCase().contains(query.toLowerCase());
      }
    }).toList();
    MyCoursesScreen.dispatch(context,
        UpdateFilteredTopicsForSelectedCourse(inspCardModels: filteredTopics));
  };
}
