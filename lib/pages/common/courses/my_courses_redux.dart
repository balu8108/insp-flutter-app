// This file is "main.dart"
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/utils/class_constants.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/widget/card/model/lecture_card_model.dart';
import 'package:insp/data/hardcoded/secret_key.dart';
import 'package:insp/apiservices/models/mycourses/physics_course_topics_request_model.dart';
import 'package:insp/pages/common/courses/my_courses_screen.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../../../data/hardcoded/mycourses_subjects.dart';
import '../../../apiservices/models/mycourses/all_subjects_request_model.dart';
import '../../../apiservices/remote_data_source.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'my_courses_redux.freezed.dart';

@freezed
class MyCoursesAppState with _$MyCoursesAppState {
  const factory MyCoursesAppState(
          {@Default([]) List<INSPCardModel> myCoursesInspCardModels,
          required INSPCardModel selectedItem,
          @Default([]) List<INSPCardModel> allTopicsForSelectedCourse,
          @Default('') String query,
          @Default([]) List<LectureCardModel> allLectures,
          @Default([]) List<INSPCardModel> filteredTopicsForSelectedCourse}) =
      _MyCoursesAppState;
}

sealed class MyCoursesAction {}

class UpdateAllTopicsForSelectedCourse extends MyCoursesAction {
  List<INSPCardModel> inspCardModels;

  UpdateAllTopicsForSelectedCourse({required this.inspCardModels});
}

class UpdateAllLectureForSelectedCourse extends MyCoursesAction {
  List<LectureCardModel> allLectures;

  UpdateAllLectureForSelectedCourse({required this.allLectures});
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
    case UpdateAllLectureForSelectedCourse():
      return state.copyWith(allLectures: action.allLectures);
  }
}

MyCoursesAppState myCoursesStateReducer(
    MyCoursesAppState state, dynamic action) {
  var upState = _myCoursesStateReducer(state, action);
  if (kDebugMode) {}
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
    } else if (selectedCardName.contains('mastery')) {
      classType = ClassType.REGULAR_CLASS.value;
      classLevel = ClassLevel.JEE_Advanced_Mastery_Top_500.name;
    } else if (selectedCardName.contains('discussion')) {
      classType = ClassType.REGULAR_CLASS.value;
      classLevel = ClassLevel.General_Discussion.name;
    }

    String userToken = getUserToken(context);

    if (classLevel != null && classType != null) {
      final response = await remoteDataSource.getAllLecturesForCourse(
          classType, classLevel, userToken);

      if (response.response.statusCode == 200) {
        final List<LectureCardModel> lecturesForCourse = (response.data.data
            .map((it) => LectureCardModel(
                it.roomId,
                it.roomId,
                'Lecture ${it.liveClassRoomDetail.lectureNo}',
                '',
                it.liveClassRoomDetail.description,
                it.liveClassRoomDetail.topicName,
                DateFormat('dd/MM/yyyy')
                    .format(DateTime.parse(it.scheduledDate)),
                ClassLevel.getValueFromName(it.classLevel)))
            .toList());

        MyCoursesScreen.dispatch(context,
            UpdateAllLectureForSelectedCourse(allLectures: lecturesForCourse));
      } else {
        updateEmptyTopicsForSelectedCourse(context);
      }
    } else if (selectedCardName.contains('inpho')) {
      final allSoloClass = await remoteDataSource.getAllSoloClasses(userToken);
      if (allSoloClass.response.statusCode == 200) {
        final List<LectureCardModel> lecturesForSoloClass =
            (allSoloClass.data.data.map((it) => LectureCardModel(
                it.id.toString(),
                '',
                'Lecture ${it.lectureNo}',
                '',
                it.description,
                it.topic,
                '',
                ''))).toList();

        MyCoursesScreen.dispatch(
            context,
            UpdateAllLectureForSelectedCourse(
                allLectures: lecturesForSoloClass));
      }
    } else if (selectedCardName.contains('physics')) {
      final allTopics = await remoteDataSource.getAllTopicsForMyCourse(
          const PhysicsCourseTopicsRequestModel(secret_key: secretKey));
      if (allTopics.response.statusCode == 201 &&
          allTopics.data.status == true) {
        final allTopicsForSubject = allTopics
            .data.physicsCourseTopicsResponseModelResult
            .mapIndexed((index, it) => INSPCardModel(
                it.id,
                (it.name).capitalizeFirstLetter(),
                'Nitin Sachan',
                myCoursePhysicsDescriptions[index]))
            .toList();

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
    } else {
      updateEmptyTopicsForSelectedCourse(context);
    }
  };
}

void updateEmptyTopicsForSelectedCourse(BuildContext context) {
  MyCoursesScreen.dispatch(
      context, UpdateAllLectureForSelectedCourse(allLectures: []));
  MyCoursesScreen.dispatch(
      context, UpdateAllTopicsForSelectedCourse(inspCardModels: []));
  MyCoursesScreen.dispatch(
      context, UpdateFilteredTopicsForSelectedCourse(inspCardModels: []));
}

ThunkAction<MyCoursesAppState> getMyCourses(BuildContext context) {
  return (Store<MyCoursesAppState> store) async {
    final remoteDataSource = RemoteDataSource();
    final allSubjects = await remoteDataSource
        .getAllSubjects(const AllSubjectsRequestModel(secret_key: secretKey));
    if (allSubjects.data.status == true) {
      var allSubjectsResults = allSubjects.data.allSubjectsResponseModelResults;
      allSubjectsResults = [...myAdditionalCourses, ...allSubjectsResults];

      final inspCardModels = allSubjectsResults.reversed
          .map((allSubjectResult) => INSPCardModel(
              allSubjectResult.id,
              (allSubjectResult.name).capitalizeFirstLetter(),
              subjectStatus[8 - int.parse(allSubjectResult.id ?? '1')],
              myCoursesDescriptions[8 - int.parse(allSubjectResult.id ?? '1')]))
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
