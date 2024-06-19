// This file is "main.dart"
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/data/hardcoded/library_subjects.dart';
import 'package:inspflutterfrontend/data/hardcoded/secret_key.dart';
import 'package:inspflutterfrontend/data/remote/models/library/all_topics_for_subject_request_model.dart';
import 'package:inspflutterfrontend/library/library_screen.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../data/remote/remote_data_source.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'library_redux.freezed.dart';

// optional: Since our Person class is serializable, we must add this line.
// But if Person was not serializable, we could skip it.
//part 'home_redux.g.dart';

@freezed
class LibraryAppState with _$LibraryAppState {
  const factory LibraryAppState(
          {@Default([]) List<INSPCardModel> libraryInspCardModels,
          required INSPCardModel selectedItem,
          @Default([]) List<INSPCardModel> allTopicsForSelectedSubject,
          @Default('') String query,
          @Default([]) List<INSPCardModel> filteredTopicsForSelectedSubject}) =
      _LibraryAppState;
}

sealed class LibraryAction {}

class UpdateAllTopicsForSelectedSubject extends LibraryAction {
  List<INSPCardModel> inspCardModels;

  UpdateAllTopicsForSelectedSubject({required this.inspCardModels});
}

class UpdateFilteredTopicsForSelectedSubject extends LibraryAction {
  List<INSPCardModel> inspCardModels;

  UpdateFilteredTopicsForSelectedSubject({required this.inspCardModels});
}

class UpdateLibrarySubjects extends LibraryAction {
  List<INSPCardModel> inspCardModels;

  UpdateLibrarySubjects({required this.inspCardModels});
}

class UpdateSelectedItem extends LibraryAction {
  INSPCardModel selectedItem;

  UpdateSelectedItem({required this.selectedItem});
}

class UpdateQueryText extends LibraryAction {
  String query;

  UpdateQueryText({required this.query});
}

LibraryAppState _libraryStateReducer(
    LibraryAppState state, LibraryAction action) {
  switch (action) {
    case UpdateAllTopicsForSelectedSubject():
      return state.copyWith(allTopicsForSelectedSubject: action.inspCardModels);
    case UpdateLibrarySubjects():
      return state.copyWith(libraryInspCardModels: action.inspCardModels);
    case UpdateSelectedItem():
      return state.copyWith(selectedItem: action.selectedItem);
    case UpdateQueryText():
      return state.copyWith(query: action.query);
    case UpdateFilteredTopicsForSelectedSubject():
      return state.copyWith(
          filteredTopicsForSelectedSubject: action.inspCardModels);
  }
}

LibraryAppState libraryStateReducer(LibraryAppState state, dynamic action) {
  var upState = _libraryStateReducer(state, action);
  if (kDebugMode) {
    print(upState.allTopicsForSelectedSubject);
  }
  return upState;
}

ThunkAction<LibraryAppState> showTopicsForSubject(
    BuildContext context, INSPCardModel inspCardModel) {
  return (Store<LibraryAppState> store) async {
    LibraryScreen.dispatch(
        context, UpdateSelectedItem(selectedItem: inspCardModel));
    final remoteDataSource = RemoteDataSource();
    final subjectId =
        inspCardModel.id == '1' || inspCardModel.id == '4' ? '1' : '2';
    final allTopics = await remoteDataSource.getAllTopicsForSubject(
        AllTopicsForSubjectRequestModel(
            secret_key: secretKey, subject_id: subjectId));
    print(allTopics.response.statusCode);
    if (allTopics.response.statusCode == 201 && allTopics.data.status == true) {
      final allTopicsForSubject = allTopics
              .data.allTopicsForSubjectResponseModelResult
              .map((it) => INSPCardModel(
          it.id ?? '',
                  (it.name ?? '').capitalizeFirstLetter(),
                  'Nitin Sachan',
                  topicDescriptionConstants[int.parse(it.id ?? '1')] ?? ''))
              .toList() ??
          [];

      print(allTopicsForSubject);
      LibraryScreen.dispatch(
          context,
          UpdateAllTopicsForSelectedSubject(
              inspCardModels: allTopicsForSubject));

      LibraryScreen.dispatch(
          context,
          UpdateFilteredTopicsForSelectedSubject(
              inspCardModels: allTopicsForSubject));
    } else {
      LibraryScreen.dispatch(
          context, UpdateAllTopicsForSelectedSubject(inspCardModels: []));
      LibraryScreen.dispatch(
          context, UpdateFilteredTopicsForSelectedSubject(inspCardModels: []));
    }
    //print(allTopics.data.allTopicsForSubjectResponseModelResult);
  };
}

ThunkAction<LibraryAppState> initialFetchTopics(BuildContext context) {
  return (Store<LibraryAppState> store) async {
    LibraryScreen.dispatch(
        context, showTopicsForSubject(context, store.state.selectedItem));
  };
}

ThunkAction<LibraryAppState> filterWithQueryText(
    BuildContext context, String query) {
  return (Store<LibraryAppState> store) async {
    LibraryScreen.dispatch(context, UpdateQueryText(query: query));
    final filteredTopics = store.state.allTopicsForSelectedSubject
        .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    LibraryScreen.dispatch(context,
        UpdateFilteredTopicsForSelectedSubject(inspCardModels: filteredTopics));
  };
}
