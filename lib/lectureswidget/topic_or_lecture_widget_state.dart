import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/model/insp_card_model.dart';

part 'topic_or_lecture_widget_state.freezed.dart';

@freezed
class LecturesWidgetAppState with _$LecturesWidgetAppState {
  const factory LecturesWidgetAppState(
      {@Default([]) List<INSPCardModel> allTopicsForSelectedCourse,
        @Default('') String query,
        @Default([]) List<INSPCardModel> filteredTopicsForSelectedCourse}) =
  _LecturesWidgetAppState;
}