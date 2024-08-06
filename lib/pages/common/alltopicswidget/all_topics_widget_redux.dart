// This file is "main.dart"
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/data/hardcoded/library_subjects.dart';
import 'package:inspflutterfrontend/data/hardcoded/secret_key.dart';
import 'package:inspflutterfrontend/apiservices/models/library/all_topics_for_subject_request_model.dart';
import 'package:inspflutterfrontend/apiservices/remote_data_source.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'all_topics_widget_redux.freezed.dart';

@freezed
class AllTopicsWidgetAppState with _$AllTopicsWidgetAppState {
  const factory AllTopicsWidgetAppState(
          {@Default([]) List<INSPCardModel> allSubjectTopics,
          @Default([]) List<INSPCardModel> filterSubjectTopics}) =
      _AllTopicsWidgetAppState;
}

class UpdateAllSubjectTopicItem extends AllTopicsWidgetAction {
  List<INSPCardModel> allSubjectTopics;
  UpdateAllSubjectTopicItem({required this.allSubjectTopics});
}

class FilteredSubjectTopicItem extends AllTopicsWidgetAction {
  List<INSPCardModel> filterSubjectTopics;
  FilteredSubjectTopicItem({required this.filterSubjectTopics});
}

sealed class AllTopicsWidgetAction {}

AllTopicsWidgetAppState _allTopicWidgetStateReducer(
    AllTopicsWidgetAppState state, AllTopicsWidgetAction action) {
  switch (action) {
    case UpdateAllSubjectTopicItem():
      return state.copyWith(allSubjectTopics: action.allSubjectTopics);
    case FilteredSubjectTopicItem():
      return state.copyWith(filterSubjectTopics: action.filterSubjectTopics);
  }
}

AllTopicsWidgetAppState allTopicWidgetStateReducer(
    AllTopicsWidgetAppState state, dynamic action) {
  var upState = _allTopicWidgetStateReducer(state, action);
  return upState;
}

ThunkAction<AllTopicsWidgetAppState> showTopicsForSubject(
    BuildContext context) {
  return (Store<AllTopicsWidgetAppState> store) async {
    final remoteDataSource = RemoteDataSource();
    final subjectId =
        "1"; // baad mai dynamic karenge jab math or chemistry ke topic aa jaaye
    final allTopics = await remoteDataSource.getAllTopicsForSubject(
        AllTopicsForSubjectRequestModel(
            secret_key: secretKey, subject_id: subjectId));
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

      store.dispatch(
          UpdateAllSubjectTopicItem(allSubjectTopics: allTopicsForSubject));
      store.dispatch(
          FilteredSubjectTopicItem(filterSubjectTopics: allTopicsForSubject));
    } else {
      store.dispatch(UpdateAllSubjectTopicItem(allSubjectTopics: []));
      store.dispatch(FilteredSubjectTopicItem(filterSubjectTopics: []));
    }
  };
}

ThunkAction<AllTopicsWidgetAppState> initialFetchSubjectTopic(
    BuildContext context) {
  return (Store<AllTopicsWidgetAppState> store) async {
    store.dispatch(showTopicsForSubject(context));
  };
}

ThunkAction<AllTopicsWidgetAppState> filterWithQueryText(
    BuildContext context, String query) {
  return (Store<AllTopicsWidgetAppState> store) async {
    final filteredTopics = store.state.allSubjectTopics.where((it) {
      return it.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    store.dispatch(
        FilteredSubjectTopicItem(filterSubjectTopics: filteredTopics));
  };
}
