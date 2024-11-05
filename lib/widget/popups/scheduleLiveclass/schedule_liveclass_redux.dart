// This file is "main.dart"
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/library/all_topic_for_chapter_request_model.dart';
import 'package:insp/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:insp/apiservices/models/mycourses/get_lecture_no_request_model.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/data/hardcoded/secret_key.dart';
import 'package:insp/data/hardcoded/topic_list.dart';
import 'package:insp/utils/toaster.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:toastification/toastification.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'schedule_liveclass_redux.freezed.dart';

@freezed
class ScheduleLiveclassAppState with _$ScheduleLiveclassAppState {
  const factory ScheduleLiveclassAppState(
      {required int classroomId,
      required bool isEditScreen,
      required String? selectedSubject,
      @Default('') String? selectedSubjectError,
      required String? selectedDate,
      @Default('') String? selectedDateError,
      required String? selectedStartTime,
      @Default('') String? selectedStartTimeError,
      required String? selectedEndTime,
      @Default('') String? selectedEndTimeError,
      required String? selectedChapter,
      @Default('') String? selectedChapterError,
      required String? selectedTopic,
      @Default('') String? selectedTopicError,
      required String? selectedClassLevel,
      @Default('') String? selectedClassLevelError,
      required String? selectedCourseType,
      @Default('') String? selectedCourseTypeError,
      required String? lectureNo,
      required String? agenda,
      @Default('') String? agendaError,
      required String? description,
      @Default('') String? descriptionError,
      @Default([]) List<ChapterTopicModel> allTopics,
      @Default([]) List<String> pickedFilesName,
      required List<LiveClassRoomFile> previousFiles,
      @Default([]) List<int> deletedFileId,
      @Default([]) List<PlatformFile> pickedFiles,
      required bool? isStudentMuted,
      @Default(false) bool isClassLoading}) = _ScheduleLiveclassAppState;
}

sealed class ScheduleLiveclassAction {}

// selectedSubject action
class UpdateLiveClassSelectedSubject extends ScheduleLiveclassAction {
  String? selectedSubject;
  UpdateLiveClassSelectedSubject({required this.selectedSubject});
}

class UpdateLiveClassSelectedSubjectError extends ScheduleLiveclassAction {
  String? selectedSubjectError;
  UpdateLiveClassSelectedSubjectError({required this.selectedSubjectError});
}

class UpdateAllTopics extends ScheduleLiveclassAction {
  List<ChapterTopicModel> allTopics;
  UpdateAllTopics({required this.allTopics});
}

// topic action
class UpdateSelectedTopic extends ScheduleLiveclassAction {
  String? selectedTopic;
  UpdateSelectedTopic({required this.selectedTopic});
}

class UpdateSelectedTopicError extends ScheduleLiveclassAction {
  String selectedTopicsError;
  UpdateSelectedTopicError({required this.selectedTopicsError});
}

// selectedDate action
class UpdateLiveClassSelectedDate extends ScheduleLiveclassAction {
  String? selectedDate;
  UpdateLiveClassSelectedDate({required this.selectedDate});
}

class UpdateLiveClassSelectedDateError extends ScheduleLiveclassAction {
  String? selectedDateError;
  UpdateLiveClassSelectedDateError({required this.selectedDateError});
}

// selectedstarttime action
class UpdateLiveClassSelectedStartTime extends ScheduleLiveclassAction {
  String? selectedStartTime;
  UpdateLiveClassSelectedStartTime({required this.selectedStartTime});
}

class UpdateLiveClassSelectedStartTimeError extends ScheduleLiveclassAction {
  String? selectedStartTimeError;
  UpdateLiveClassSelectedStartTimeError({required this.selectedStartTimeError});
}

// selectedendtime action
class UpdateLiveClassSelectedEndTime extends ScheduleLiveclassAction {
  String? selectedEndTime;
  UpdateLiveClassSelectedEndTime({required this.selectedEndTime});
}

class UpdateLiveClassSelectedEndTimeError extends ScheduleLiveclassAction {
  String? selectedEndTimeError;
  UpdateLiveClassSelectedEndTimeError({required this.selectedEndTimeError});
}

// chapter action
class UpdateLiveClassSelectedChapter extends ScheduleLiveclassAction {
  String? selectedChapter;
  UpdateLiveClassSelectedChapter({required this.selectedChapter});
}

class UpdateLiveClassSelectedChapterError extends ScheduleLiveclassAction {
  String? selectedChapterError;
  UpdateLiveClassSelectedChapterError({required this.selectedChapterError});
}

// classlevel action
class UpdateLiveClassSelectedClassLevel extends ScheduleLiveclassAction {
  String? selectedClassLevel;
  UpdateLiveClassSelectedClassLevel({required this.selectedClassLevel});
}

class UpdateLiveClassSelectedClassLevelError extends ScheduleLiveclassAction {
  String? selectedClassLevelError;
  UpdateLiveClassSelectedClassLevelError(
      {required this.selectedClassLevelError});
}

// classtype action
class UpdateLiveClassSelectedCourseType extends ScheduleLiveclassAction {
  String? selectedCourseType;
  UpdateLiveClassSelectedCourseType({required this.selectedCourseType});
}

class UpdateLiveClassSelectedCourseTypeError extends ScheduleLiveclassAction {
  String? selectedCourseTypeError;
  UpdateLiveClassSelectedCourseTypeError(
      {required this.selectedCourseTypeError});
}

// lecture no action
class UpdateLiveClassLectureNo extends ScheduleLiveclassAction {
  String? lectureNo;
  UpdateLiveClassLectureNo({required this.lectureNo});
}

// agenda action
class UpdateLiveClassAgenda extends ScheduleLiveclassAction {
  String? agenda;
  UpdateLiveClassAgenda({required this.agenda});
}

class UpdateLiveClassAgendaError extends ScheduleLiveclassAction {
  String? agendaError;
  UpdateLiveClassAgendaError({required this.agendaError});
}

// description action
class UpdateLiveClassDescription extends ScheduleLiveclassAction {
  String? description;
  UpdateLiveClassDescription({required this.description});
}

class UpdateLiveClassDescriptionError extends ScheduleLiveclassAction {
  String descriptionError;
  UpdateLiveClassDescriptionError({required this.descriptionError});
}

class UpdateLiveClassPickedFiles extends ScheduleLiveclassAction {
  List<PlatformFile> pickedFiles;
  UpdateLiveClassPickedFiles({required this.pickedFiles});
}

class UpdateLiveClassPickedFilesName extends ScheduleLiveclassAction {
  List<String> pickedFilesName;
  UpdateLiveClassPickedFilesName({required this.pickedFilesName});
}

class UpdateLiveClassIsStudentMuted extends ScheduleLiveclassAction {
  bool? isStudentMuted;
  UpdateLiveClassIsStudentMuted({required this.isStudentMuted});
}

class UpdateIsClassLoading extends ScheduleLiveclassAction {
  bool isClassLoading;
  UpdateIsClassLoading({required this.isClassLoading});
}

class RemoveLiveClassFile extends ScheduleLiveclassAction {
  String filename;
  RemoveLiveClassFile({required this.filename});
}

class RemovePreviousLiveClassFile extends ScheduleLiveclassAction {
  int id;
  RemovePreviousLiveClassFile({required this.id});
}

ScheduleLiveclassAppState _scheduleLiveclassStateReducer(
    ScheduleLiveclassAppState state, ScheduleLiveclassAction action) {
  switch (action) {
    case UpdateLiveClassSelectedSubject():
      return state.copyWith(
          selectedSubject: action.selectedSubject, selectedSubjectError: '');
    case UpdateLiveClassSelectedSubjectError():
      return state.copyWith(
          selectedSubjectError: action.selectedSubjectError,
          isClassLoading: false);
    case UpdateAllTopics():
      return state.copyWith(allTopics: action.allTopics);
    case UpdateSelectedTopic():
      return state.copyWith(
          selectedTopic: action.selectedTopic, selectedTopicError: '');
    case UpdateSelectedTopicError():
      return state.copyWith(
          selectedTopicError: action.selectedTopicsError,
          isClassLoading: false);
    case UpdateLiveClassSelectedDate():
      return state.copyWith(
          selectedDate: action.selectedDate, selectedDateError: '');
    case UpdateLiveClassSelectedDateError():
      return state.copyWith(
          selectedDateError: action.selectedDateError, isClassLoading: false);
    case UpdateLiveClassSelectedStartTime():
      return state.copyWith(
          selectedStartTime: action.selectedStartTime,
          selectedStartTimeError: '');
    case UpdateLiveClassSelectedStartTimeError():
      return state.copyWith(
          selectedStartTimeError: action.selectedStartTimeError,
          isClassLoading: false);
    case UpdateLiveClassSelectedEndTime():
      return state.copyWith(
          selectedEndTime: action.selectedEndTime, selectedEndTimeError: '');
    case UpdateLiveClassSelectedEndTimeError():
      return state.copyWith(
          selectedEndTimeError: action.selectedEndTimeError,
          isClassLoading: false);
    case UpdateLiveClassSelectedChapter():
      return state.copyWith(
          selectedChapter: action.selectedChapter, selectedChapterError: '');
    case UpdateLiveClassSelectedChapterError():
      return state.copyWith(
          selectedChapterError: action.selectedChapterError,
          isClassLoading: false);
    case UpdateLiveClassSelectedClassLevel():
      return state.copyWith(
          selectedClassLevel: action.selectedClassLevel,
          selectedClassLevelError: '');
    case UpdateLiveClassSelectedClassLevelError():
      return state.copyWith(
          selectedClassLevelError: action.selectedClassLevelError,
          isClassLoading: false);
    case UpdateLiveClassSelectedCourseType():
      return state.copyWith(
          selectedCourseType: action.selectedCourseType,
          selectedCourseTypeError: '');
    case UpdateLiveClassSelectedCourseTypeError():
      return state.copyWith(
          selectedCourseTypeError: action.selectedCourseTypeError,
          isClassLoading: false);
    case UpdateLiveClassLectureNo():
      return state.copyWith(lectureNo: action.lectureNo);
    case UpdateLiveClassAgenda():
      return state.copyWith(agenda: action.agenda, agendaError: '');
    case UpdateLiveClassAgendaError():
      return state.copyWith(
          agendaError: action.agendaError, isClassLoading: false);
    case UpdateLiveClassDescription():
      return state.copyWith(
          description: action.description, descriptionError: '');
    case UpdateLiveClassDescriptionError():
      return state.copyWith(
          descriptionError: action.descriptionError, isClassLoading: false);
    case UpdateLiveClassPickedFiles():
      return state.copyWith(pickedFiles: action.pickedFiles);
    case UpdateLiveClassPickedFilesName():
      return state.copyWith(pickedFilesName: action.pickedFilesName);
    case UpdateLiveClassIsStudentMuted():
      return state.copyWith(isStudentMuted: action.isStudentMuted);
    case UpdateIsClassLoading():
      return state.copyWith(isClassLoading: action.isClassLoading);
    case RemovePreviousLiveClassFile():
      return state.copyWith(
          deletedFileId: [...state.deletedFileId, action.id],
          previousFiles: state.previousFiles
              .where((file) => file.id != action.id)
              .toList());
    case RemoveLiveClassFile():
      return state.copyWith(
        pickedFilesName: state.pickedFilesName
            .where((name) => name != action.filename)
            .toList(),
        pickedFiles: state.pickedFiles
            .where((file) => file.name != action.filename)
            .toList(),
      );
  }
}

ScheduleLiveclassAppState scheduleLiveclassStateReducer(
    ScheduleLiveclassAppState state, dynamic action) {
  var upState = _scheduleLiveclassStateReducer(state, action);
  return upState;
}

ThunkAction<ScheduleLiveclassAppState> pickFilesforliveclass(
    BuildContext context) {
  return (Store<ScheduleLiveclassAppState> store) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf'],
      );

      if (result != null) {
        List<PlatformFile> pickedFiles = result.files;
        List<String> pickedFilesName =
            pickedFiles.map((item) => item.name).toList();
        store.dispatch(UpdateLiveClassPickedFiles(pickedFiles: pickedFiles));
        store.dispatch(
            UpdateLiveClassPickedFilesName(pickedFilesName: pickedFilesName));
      } else {
        print('User canceled the picker');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  };
}

ThunkAction<ScheduleLiveclassAppState> getLectureNumber(BuildContext context) {
  return (Store<ScheduleLiveclassAppState> store) async {
    try {
      if (store.state.selectedSubject != '') {
        if (store.state.selectedSubject == "GENERAL" &&
            store.state.selectedClassLevel != '') {
          store.dispatch(getLectureNumberAPI(context));
        } else {
          if (store.state.selectedClassLevel != '' &&
              store.state.selectedCourseType != '') {
            store.dispatch(getLectureNumberAPI(context));
          }
        }
      }
    } catch (error) {
      print("ERROR");
    }
  };
}

ThunkAction<ScheduleLiveclassAppState> getLectureNumberAPI(
    BuildContext context) {
  return (Store<ScheduleLiveclassAppState> store) async {
    try {
      final GetLectureNoRequestModel lectureRequestData =
          GetLectureNoRequestModel(
              classLevel: store.state.selectedClassLevel ?? '',
              classType: store.state.selectedCourseType ?? '',
              isSoloClass: false,
              subjectName: store.state.selectedSubject ?? '');

      String userToken = getUserToken(context);
      final remoteDataSource = RemoteDataSource();
      final allTopics = await remoteDataSource.getLectureNumber(
          lectureRequestData, userToken);

      if (allTopics.response.statusCode == 200) {
        store.dispatch(UpdateLiveClassLectureNo(
            lectureNo: (allTopics.data.data + 1).toString()));
      } else {
        store.dispatch(UpdateLiveClassLectureNo(lectureNo: "0"));
      }
    } catch (error) {
      store.dispatch(UpdateLiveClassLectureNo(lectureNo: "0"));
    }
  };
}

ThunkAction<ScheduleLiveclassAppState> showTopicsforLiveClassByChapter(
    BuildContext context, String? newValue) {
  return (Store<ScheduleLiveclassAppState> store) async {
    try {
      store.dispatch(UpdateSelectedTopic(selectedTopic: ''));
      store.dispatch(UpdateLiveClassSelectedChapter(selectedChapter: newValue));
      var chapterId =
          chapter.firstWhere((item) => item.label == newValue).value;

      final remoteDataSource = RemoteDataSource();
      final allTopics = await remoteDataSource.getAllTopicsByChapter(
          AllTopicsForChapterRequestModel(
              secret_key: secretKey, chapter_id: chapterId));

      if (allTopics.response.statusCode == 201 &&
          allTopics.data.status == true) {
        final List<ChapterTopicModel> allTopicsForSubject = allTopics
            .data.physicsCourseTopicsResponseModelResult
            .map((it) => ChapterTopicModel(value: it.id, label: it.name))
            .toList();

        store.dispatch(UpdateAllTopics(allTopics: allTopicsForSubject));
      } else {
        store.dispatch(UpdateAllTopics(allTopics: []));
      }
    } catch (error) {
      store.dispatch(UpdateAllTopics(allTopics: []));
    }
  };
}

ThunkAction<ScheduleLiveclassAppState> handleCreateLiveClass(
    BuildContext context, Function() getAllUpcomingClass) {
  return (Store<ScheduleLiveclassAppState> store) async {
    List<MultipartFile> files = [];

    store.dispatch(UpdateIsClassLoading(isClassLoading: true));

    if (store.state.selectedSubject == null ||
        store.state.selectedSubject!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedSubjectError(
          selectedSubjectError: 'Please select a subject'));
      return;
    }

    if (store.state.selectedSubject == "GENERAL") {
      if (store.state.selectedCourseType == null ||
          store.state.selectedCourseType!.isEmpty) {
        store.dispatch(UpdateLiveClassSelectedCourseTypeError(
            selectedCourseTypeError: 'Please select a classtype'));
        return;
      }
      if (store.state.selectedChapter == null ||
          store.state.selectedChapter!.isEmpty) {
        store.dispatch(UpdateLiveClassSelectedChapterError(
            selectedChapterError: 'Please select a chapter'));
        return;
      }
      if (store.state.selectedTopic == null ||
          store.state.selectedTopic!.isEmpty) {
        store.dispatch(UpdateSelectedTopicError(
            selectedTopicsError: 'Please select a topic'));
        return;
      }
    }

    if (store.state.selectedDate == null || store.state.selectedDate!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedDateError(
          selectedDateError: 'Please select a date'));
      return;
    }
    if (store.state.selectedStartTime == null ||
        store.state.selectedStartTime!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedStartTimeError(
          selectedStartTimeError: 'Please select a start time'));
      return;
    }
    if (store.state.selectedEndTime == null ||
        store.state.selectedEndTime!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedEndTimeError(
          selectedEndTimeError: 'Please select a end time'));
      return;
    }
    if (store.state.selectedClassLevel == null ||
        store.state.selectedClassLevel!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedClassLevelError(
          selectedClassLevelError: 'Please select a classlevel'));
      return;
    }
    if (store.state.agenda == null || store.state.agenda!.isEmpty) {
      store.dispatch(
          UpdateLiveClassAgendaError(agendaError: 'Please enter an agenda'));
      return;
    }
    if (store.state.description == null || store.state.description!.isEmpty) {
      store.dispatch(UpdateLiveClassDescriptionError(
          descriptionError: 'Please enter an description'));
      return;
    }

    for (PlatformFile file in store.state.pickedFiles) {
      if (kIsWeb) {
        files.add(MultipartFile.fromBytes(file.bytes!, filename: file.name));
      } else {
        files
            .add(await MultipartFile.fromFile(file.path!, filename: file.name));
      }
    }

    FormData formData = FormData.fromMap({
      'classType': store.state.selectedCourseType,
      'topic': jsonEncode({
        'value': topicList
            .firstWhere((item) => item.label == store.state.selectedTopic)
            .value,
        'label': store.state.selectedTopic,
      }),
      'chapter': jsonEncode({
        'value': chapter
            .firstWhere((item) => item.label == store.state.selectedChapter)
            .value,
        'label': store.state.selectedChapter,
      }),
      'subject': jsonEncode({
        'value': subjectList
            .firstWhere((item) => item.label == store.state.selectedSubject)
            .value,
        'label': store.state.selectedSubject,
      }),
      'classLevel': store.state.selectedClassLevel ?? '',
      'scheduledDate': store.state.selectedDate,
      'scheduledStartTime': store.state.selectedStartTime,
      'scheduledEndTime': store.state.selectedEndTime,
      'agenda': store.state.agenda,
      'lectureNo': store.state.lectureNo,
      'description': store.state.description,
      'muteAllStudents': false,
      'blockStudentsCamera': false,
      'files': files,
    });

    final dio = Dio();
    try {
      String userToken = getUserToken(context);
      Response response = await dio.post(
        '$api/schedule-live-class/create',
        data: formData,
        options: Options(
          headers: {
            'Authorization': userToken, // Include the token in the header
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        getAllUpcomingClass();
        showToast(context, 'Class Scheduled successfully',
            ToastificationType.success);
      } else {
        showToast(context, 'Please try again', ToastificationType.warning);
      }

      Navigator.of(context).pop();
      store.dispatch(UpdateIsClassLoading(isClassLoading: false));
    } on DioException catch (e) {
      // Handle Dio-specific errors
      String errorMessage;
      if (e.response != null) {
        final errorData = e.response?.data;
        errorMessage = errorData['error'] ?? 'An unexpected error occurred';
      } else {
        errorMessage = 'Network error or server not reachable';
      }
      store.dispatch(UpdateIsClassLoading(isClassLoading: false));
      showToast(context, errorMessage, ToastificationType.error);
    } catch (e) {
      store.dispatch(UpdateIsClassLoading(isClassLoading: false));
      showToast(context, 'Please try again', ToastificationType.error);
    }
  };
}

ThunkAction<ScheduleLiveclassAppState> handleUpdateLiveClass(
    BuildContext context, Function() getAllUpcomingClass) {
  return (Store<ScheduleLiveclassAppState> store) async {
    List<MultipartFile> files = [];

    store.dispatch(UpdateIsClassLoading(isClassLoading: true));

    if (store.state.selectedSubject == null ||
        store.state.selectedSubject!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedSubjectError(
          selectedSubjectError: 'Please select a subject'));
      return;
    }
    if (store.state.selectedClassLevel == null ||
        store.state.selectedClassLevel!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedClassLevelError(
          selectedClassLevelError: 'Please select a classlevel'));
      return;
    }
    if (store.state.selectedCourseType == null ||
        store.state.selectedCourseType!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedCourseTypeError(
          selectedCourseTypeError: 'Please select a classtype'));
      return;
    }
    if (store.state.selectedDate == null || store.state.selectedDate!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedDateError(
          selectedDateError: 'Please select a date'));
      return;
    }
    if (store.state.selectedStartTime == null ||
        store.state.selectedStartTime!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedStartTimeError(
          selectedStartTimeError: 'Please select a start time'));
      return;
    }
    if (store.state.selectedEndTime == null ||
        store.state.selectedEndTime!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedEndTimeError(
          selectedEndTimeError: 'Please select a end time'));
      return;
    }
    if (store.state.selectedChapter == null ||
        store.state.selectedChapter!.isEmpty) {
      store.dispatch(UpdateLiveClassSelectedChapterError(
          selectedChapterError: 'Please select a chapter'));
      return;
    }
    if (store.state.selectedTopic == null ||
        store.state.selectedTopic!.isEmpty) {
      store.dispatch(UpdateSelectedTopicError(
          selectedTopicsError: 'Please select a topic'));
      return;
    }
    if (store.state.agenda == null || store.state.agenda!.isEmpty) {
      store.dispatch(
          UpdateLiveClassAgendaError(agendaError: 'Please enter an agenda'));
      return;
    }
    if (store.state.description == null || store.state.description!.isEmpty) {
      store.dispatch(UpdateLiveClassDescriptionError(
          descriptionError: 'Please enter an description'));
      return;
    }

    for (PlatformFile file in store.state.pickedFiles) {
      if (kIsWeb) {
        files.add(MultipartFile.fromBytes(file.bytes!, filename: file.name));
      } else {
        files
            .add(await MultipartFile.fromFile(file.path!, filename: file.name));
      }
    }
    Map<String, dynamic> jsonSubjectObject = {
      'value': subjectList
          .firstWhere((item) => item.label == store.state.selectedSubject)
          .value,
      'label': store.state.selectedSubject,
    };

    Map<String, dynamic> jsonTopicObject = {
      'value': topicList
          .firstWhere((item) => item.label == store.state.selectedTopic)
          .value,
      'label': store.state.selectedTopic,
    };

    Map<String, dynamic> jsonChapterObject = {
      'value': chapter
          .firstWhere((item) => item.label == store.state.selectedChapter)
          .value,
      'label': store.state.selectedChapter,
    };

    // formData.append("classId", scheduleData?.id);

    FormData formData = FormData.fromMap({
      'classId': store.state.classroomId,
      'classType': store.state.selectedCourseType,
      'topic': jsonEncode(jsonTopicObject),
      'chapter': jsonEncode(jsonChapterObject),
      'subject': jsonEncode(jsonSubjectObject),
      'classLevel': store.state.selectedClassLevel ?? '',
      'scheduledDate': store.state.selectedDate,
      'scheduledStartTime': store.state.selectedStartTime,
      'scheduledEndTime': store.state.selectedEndTime,
      'agenda': store.state.agenda,
      'lectureNo': store.state.lectureNo,
      'description': store.state.description,
      'muteAllStudents': false,
      'blockStudentsCamera': false,
      'files': files,
      if (store.state.deletedFileId.isNotEmpty)
        'deletedFileIds': jsonEncode(store.state.deletedFileId),
    });

    final dio = Dio();
    try {
      String userToken = getUserToken(context);
      Response response = await dio.post(
        '$api/schedule-live-class/update-schedule-data',
        data: formData,
        options: Options(
          headers: {
            'Authorization': userToken, // Include the token in the header
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        getAllUpcomingClass();
        store.dispatch(UpdateIsClassLoading(isClassLoading: false));
        Navigator.of(context).pop();
        showToast(
            context, 'Class updated successfully', ToastificationType.success);
      } else {
        store.dispatch(UpdateIsClassLoading(isClassLoading: false));
        Navigator.of(context).pop();
        showToast(context, 'Please try again', ToastificationType.warning);
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      String errorMessage;
      if (e.response != null) {
        final errorData = e.response?.data;
        errorMessage = errorData['error'] ?? 'An unexpected error occurred';
      } else {
        errorMessage = 'Network error or server not reachable';
      }
      store.dispatch(UpdateIsClassLoading(isClassLoading: false));
      showToast(context, errorMessage, ToastificationType.error);
    } catch (e) {
      store.dispatch(UpdateIsClassLoading(isClassLoading: false));
      showToast(
          context, 'Some issue, please try again', ToastificationType.error);
    }
  };
}
