import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';

part 'all_lectures_for_upcoming_response_model.g.dart';

@JsonSerializable()
class AllLecturesForUpcomingResponseModel {
  const AllLecturesForUpcomingResponseModel({required this.data});

  final AllWeeklyLecturesData data;

  factory AllLecturesForUpcomingResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$AllLecturesForUpcomingResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AllLecturesForUpcomingResponseModelToJson(this);
}

@JsonSerializable()
class AllWeeklyLecturesData {
  const AllWeeklyLecturesData({
    required this.ongoing,
    required this.today,
    required this.week,
    required this.completed,
  });

  @JsonKey(name: 'Ongoing')
  final List<AllLecturesForCourseResponseModelData> ongoing;
  @JsonKey(name: 'Today')
  final List<AllLecturesForCourseResponseModelData> today;
  @JsonKey(name: 'Week')
  final List<AllLecturesForCourseResponseModelData> week;
  @JsonKey(name: 'Completed')
  final List<AllLecturesForCourseResponseModelData> completed;

  factory AllWeeklyLecturesData.fromJson(Map<String, Object?> json) =>
      _$AllWeeklyLecturesDataFromJson(json);

  Map<String, dynamic> toJson() => _$AllWeeklyLecturesDataToJson(this);
}
