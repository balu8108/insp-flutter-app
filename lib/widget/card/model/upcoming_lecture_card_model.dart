import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
part 'upcoming_lecture_card_model.g.dart';

@JsonSerializable()
class UpcomingLectureCardModel {
  const UpcomingLectureCardModel(
      this.ongoing, this.today, this.week, this.completed);

  @JsonKey(name: 'Ongoing')
  final List<AllLecturesForCourseResponseModelData> ongoing;
  @JsonKey(name: 'Today')
  final List<AllLecturesForCourseResponseModelData> today;
  @JsonKey(name: 'Week')
  final List<AllLecturesForCourseResponseModelData> week;
  @JsonKey(name: 'Completed')
  final List<AllLecturesForCourseResponseModelData> completed;

  factory UpcomingLectureCardModel.fromJson(Map<String, Object?> json) =>
      _$UpcomingLectureCardModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UpcomingLectureCardModelToJson(this);
}
