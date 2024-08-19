// This file is "main.dart"
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/get_lecture_no_request_model.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/physics_course_topics_request_model.dart';
import 'package:inspflutterfrontend/apiservices/remote_data_source.dart';
import 'package:inspflutterfrontend/data/hardcoded/secret_key.dart';
import 'package:inspflutterfrontend/data/hardcoded/topic_list.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:toastification/toastification.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'schedule_soloclass_redux.freezed.dart';

@freezed
class ScheduleSoloclassAppState with _$ScheduleSoloclassAppState {
  const factory ScheduleSoloclassAppState(
      {required int soloClassRoomId,
      required bool isEditScreen,
      required String? selectedSubject,
      @Default('') String? selectedSubjectError,
      required String? selectedTopic,
      @Default('') String? selectedTopicError,
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
      @Default(false) bool isClassLoading}) = _ScheduleSoloclassAppState;
}

sealed class ScheduleSoloclassAction {}

// selectedSubject action
class UpdateSoloClassSelectedSubject extends ScheduleSoloclassAction {
  String? selectedSubject;
  UpdateSoloClassSelectedSubject({required this.selectedSubject});
}

class UpdateSoloClassSelectedSubjectError extends ScheduleSoloclassAction {
  String? selectedSubjectError;
  UpdateSoloClassSelectedSubjectError({required this.selectedSubjectError});
}

class UpdateAllTopics extends ScheduleSoloclassAction {
  List<ChapterTopicModel> allTopics;
  UpdateAllTopics({required this.allTopics});
}

// topic action
class UpdateSelectedTopic extends ScheduleSoloclassAction {
  String? selectedTopic;
  UpdateSelectedTopic({required this.selectedTopic});
}

class UpdateSelectedTopicError extends ScheduleSoloclassAction {
  String selectedTopicsError;
  UpdateSelectedTopicError({required this.selectedTopicsError});
}

// lecture no action
class UpdateSoloClassLectureNo extends ScheduleSoloclassAction {
  String? lectureNo;
  UpdateSoloClassLectureNo({required this.lectureNo});
}

// agenda action
class UpdateSoloClassAgenda extends ScheduleSoloclassAction {
  String? agenda;
  UpdateSoloClassAgenda({required this.agenda});
}

class UpdateSoloClassAgendaError extends ScheduleSoloclassAction {
  String? agendaError;
  UpdateSoloClassAgendaError({required this.agendaError});
}

// description action
class UpdateSoloClassDescription extends ScheduleSoloclassAction {
  String? description;
  UpdateSoloClassDescription({required this.description});
}

class UpdateSoloClassDescriptionError extends ScheduleSoloclassAction {
  String descriptionError;
  UpdateSoloClassDescriptionError({required this.descriptionError});
}

class UpdateSoloClassPickedFiles extends ScheduleSoloclassAction {
  List<PlatformFile> pickedFiles;
  UpdateSoloClassPickedFiles({required this.pickedFiles});
}

class UpdateSoloClassPickedFilesName extends ScheduleSoloclassAction {
  List<String> pickedFilesName;
  UpdateSoloClassPickedFilesName({required this.pickedFilesName});
}

class UpdateIsClassLoading extends ScheduleSoloclassAction {
  bool isClassLoading;
  UpdateIsClassLoading({required this.isClassLoading});
}

class RemoveSoloClassFile extends ScheduleSoloclassAction {
  String filename;
  RemoveSoloClassFile({required this.filename});
}

class RemovePreviousSoloClassFile extends ScheduleSoloclassAction {
  int id;
  RemovePreviousSoloClassFile({required this.id});
}

ScheduleSoloclassAppState _scheduleSoloclassStateReducer(
    ScheduleSoloclassAppState state, ScheduleSoloclassAction action) {
  switch (action) {
    case UpdateSoloClassSelectedSubject():
      return state.copyWith(
          selectedSubject: action.selectedSubject, selectedSubjectError: '');
    case UpdateSoloClassSelectedSubjectError():
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
    case UpdateSoloClassLectureNo():
      return state.copyWith(lectureNo: action.lectureNo);
    case UpdateSoloClassAgenda():
      return state.copyWith(agenda: action.agenda, agendaError: '');
    case UpdateSoloClassAgendaError():
      return state.copyWith(
          agendaError: action.agendaError, isClassLoading: false);
    case UpdateSoloClassDescription():
      return state.copyWith(
          description: action.description, descriptionError: '');
    case UpdateSoloClassDescriptionError():
      return state.copyWith(
          descriptionError: action.descriptionError, isClassLoading: false);
    case UpdateSoloClassPickedFiles():
      return state.copyWith(pickedFiles: action.pickedFiles);
    case UpdateSoloClassPickedFilesName():
      return state.copyWith(pickedFilesName: action.pickedFilesName);
    case UpdateIsClassLoading():
      return state.copyWith(isClassLoading: action.isClassLoading);
    case RemovePreviousSoloClassFile():
      return state.copyWith(
          deletedFileId: [...state.deletedFileId, action.id],
          previousFiles: state.previousFiles
              .where((file) => file.id != action.id)
              .toList());
    case RemoveSoloClassFile():
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

ScheduleSoloclassAppState scheduleSoloclassStateReducer(
    ScheduleSoloclassAppState state, dynamic action) {
  var upState = _scheduleSoloclassStateReducer(state, action);
  return upState;
}

ThunkAction<ScheduleSoloclassAppState> pickFilesforSoloclass(
    BuildContext context) {
  return (Store<ScheduleSoloclassAppState> store) async {
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
        store.dispatch(UpdateSoloClassPickedFiles(pickedFiles: pickedFiles));
        store.dispatch(
            UpdateSoloClassPickedFilesName(pickedFilesName: pickedFilesName));
      } else {
        print('User canceled the picker');
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  };
}

ThunkAction<ScheduleSoloclassAppState> getLectureNumberAPI(
    BuildContext context) {
  return (Store<ScheduleSoloclassAppState> store) async {
    try {
      const GetLectureNoRequestModel lectureRequestData =
          GetLectureNoRequestModel(
              classLevel: '',
              classType: '',
              isSoloClass: true,
              subjectName: '');
      String userToken = await getUserToken();
      final remoteDataSource = RemoteDataSource();
      final allTopics = await remoteDataSource.getLectureNumber(
          lectureRequestData, userToken);

      if (allTopics.response.statusCode == 200) {
        store.dispatch(UpdateSoloClassLectureNo(
            lectureNo: (allTopics.data.data + 1).toString()));
      } else {
        store.dispatch(UpdateSoloClassLectureNo(lectureNo: "0"));
      }
    } catch (error) {
      store.dispatch(UpdateSoloClassLectureNo(lectureNo: "0"));
    }
  };
}

ThunkAction<ScheduleSoloclassAppState> showAllTopics(BuildContext context) {
  return (Store<ScheduleSoloclassAppState> store) async {
    try {
      final remoteDataSource = RemoteDataSource();

      final allTopics = await remoteDataSource.getAllTopics(
          const PhysicsCourseTopicsRequestModel(
              secret_key: "U5Ga0Z1aaNlYHp0MjdEdXJ1aKVVVB1TP"));
      if (allTopics.response.statusCode == 201) {
        final allTopicsForSubject = allTopics
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

ThunkAction<ScheduleSoloclassAppState> handleCreateSoloClass(
    BuildContext context) {
  return (Store<ScheduleSoloclassAppState> store) async {
    List<MultipartFile> files = [];

    store.dispatch(UpdateIsClassLoading(isClassLoading: true));

    if (store.state.selectedSubject == null ||
        store.state.selectedSubject!.isEmpty) {
      store.dispatch(UpdateSoloClassSelectedSubjectError(
          selectedSubjectError: 'Please select a subject'));
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
          UpdateSoloClassAgendaError(agendaError: 'Please enter an agenda'));
      return;
    }
    if (store.state.description == null || store.state.description!.isEmpty) {
      store.dispatch(UpdateSoloClassDescriptionError(
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
      'topic': store.state.selectedTopic,
      'topicId': topicList
          .firstWhere((item) => item.label == store.state.selectedTopic)
          .value,
      'subjectId': subjectList
          .firstWhere((item) => item.label == store.state.selectedSubject)
          .value,
      'agenda': store.state.agenda,
      'lectureNo': store.state.lectureNo,
      'description': store.state.description,
      'files': files,
    });

    final dio = Dio();
    try {
      String userToken = await getUserToken();
      Response response = await dio.post(
        '${api}/solo-lecture/create-room',
        data: formData,
        options: Options(
          headers: {
            'Authorization': userToken, // Include the token in the header
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 201) {
        store.dispatch(UpdateIsClassLoading(isClassLoading: false));
        Navigator.of(context).pop();
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          type: ToastificationType.error,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          title: const Text('SoloClass Scheduled successfully'),
          alignment: Alignment.topRight,
        );
      } else {
        store.dispatch(UpdateIsClassLoading(isClassLoading: false));
        Navigator.of(context).pop();
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          type: ToastificationType.warning,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          title: const Text('Failed to create soloclass'),
          alignment: Alignment.topRight,
        );
      }
    } catch (e) {
      store.dispatch(UpdateIsClassLoading(isClassLoading: false));
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

ThunkAction<ScheduleSoloclassAppState> handleUpdateSoloClass(
    BuildContext context) {
  return (Store<ScheduleSoloclassAppState> store) async {
    List<MultipartFile> files = [];

    store.dispatch(UpdateIsClassLoading(isClassLoading: true));

    if (store.state.selectedSubject == null ||
        store.state.selectedSubject!.isEmpty) {
      store.dispatch(UpdateSoloClassSelectedSubjectError(
          selectedSubjectError: 'Please select a subject'));
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
          UpdateSoloClassAgendaError(agendaError: 'Please enter an agenda'));
      return;
    }
    if (store.state.description == null || store.state.description!.isEmpty) {
      store.dispatch(UpdateSoloClassDescriptionError(
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

    FormData formData = FormData.fromMap({
      'topic': jsonEncode(jsonTopicObject),
      'subject': jsonEncode(jsonSubjectObject),
      'agenda': store.state.agenda,
      'lectureNo': store.state.lectureNo,
      'description': store.state.description,
      'files': files,
      if (store.state.deletedFileId.isNotEmpty)
        'deletedFileIds': jsonEncode(store.state.deletedFileId),
    });

    final dio = Dio();
    try {
      String userToken = await getUserToken();
      Response response = await dio.post(
        '${api}/schedule-live-class/update-schedule-data',
        data: formData,
        options: Options(
          headers: {
            'Authorization': userToken, // Include the token in the header
            'Content-Type': 'multipart/form-data',
          },
        ),
      );

      if (response.statusCode == 200) {
        store.dispatch(UpdateIsClassLoading(isClassLoading: false));
        Navigator.of(context).pop();
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          type: ToastificationType.error,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          title: const Text('SoloClass updated successfully'),
          alignment: Alignment.topRight,
        );
      } else {
        store.dispatch(UpdateIsClassLoading(isClassLoading: false));
        Navigator.of(context).pop();
        toastification.show(
          context: context, // optional if you use ToastificationWrapper
          type: ToastificationType.warning,
          style: ToastificationStyle.fillColored,
          autoCloseDuration: const Duration(seconds: 3),
          title: const Text('Failed to create class'),
          alignment: Alignment.topRight,
        );
      }
    } catch (e) {
      store.dispatch(UpdateIsClassLoading(isClassLoading: false));
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
