import 'package:freezed_annotation/freezed_annotation.dart';

import '../common/model/lecture_card_model.dart';

part 'topic_or_lecture_widget_state.freezed.dart';

@freezed
class LecturesWidgetAppState with _$LecturesWidgetAppState {
  const factory LecturesWidgetAppState(
          {@Default([]) List<LectureCardModel> allLectureForSelectedCourse,
          @Default('') String query,
          @Default([])
          List<LectureCardModel> filteredLectureForSelectedCourse}) =
      _LecturesWidgetAppState;
}
