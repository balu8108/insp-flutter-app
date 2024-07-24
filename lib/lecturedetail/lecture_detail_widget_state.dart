import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/data/remote/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';

part 'lecture_detail_widget_state.freezed.dart';

@freezed
class LectureDetailWidgetAppState with _$LectureDetailWidgetAppState {
  const factory LectureDetailWidgetAppState(
      {@Default(AllLecturesData(
          questionLogCount: 0,
          liveClassRoom: LecturesDetailResponseModelData()))
      AllLecturesData lectureData,
      @Default('') String query}) = _LectureDetailWidgetAppState;
}
