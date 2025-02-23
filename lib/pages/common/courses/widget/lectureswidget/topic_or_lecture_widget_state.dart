import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';

import '../../../../../widget/card/model/lecture_card_model.dart';

part 'topic_or_lecture_widget_state.freezed.dart';

@freezed
class LecturesWidgetAppState with _$LecturesWidgetAppState {
  const factory LecturesWidgetAppState(
          {@Default([]) List<INSPCardModel> allTopicsForSelectedCourse,
          @Default([]) List<LectureCardModel> allLectureForSelectedCourse,
          @Default('') String query,
          @Default([])
          List<LectureCardModel> filteredLectureForSelectedCourse}) =
      _LecturesWidgetAppState;
}
