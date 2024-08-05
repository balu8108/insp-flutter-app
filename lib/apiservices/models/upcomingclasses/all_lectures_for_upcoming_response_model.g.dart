// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_lectures_for_upcoming_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllLecturesForUpcomingResponseModel
    _$AllLecturesForUpcomingResponseModelFromJson(Map<String, dynamic> json) =>
        AllLecturesForUpcomingResponseModel(
          data: AllWeeklyLecturesData.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$AllLecturesForUpcomingResponseModelToJson(
        AllLecturesForUpcomingResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AllWeeklyLecturesData _$AllWeeklyLecturesDataFromJson(
        Map<String, dynamic> json) =>
    AllWeeklyLecturesData(
      ongoing: (json['Ongoing'] as List<dynamic>)
          .map((e) => AllLecturesForCourseResponseModelData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      today: (json['Today'] as List<dynamic>)
          .map((e) => AllLecturesForCourseResponseModelData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      week: (json['Week'] as List<dynamic>)
          .map((e) => AllLecturesForCourseResponseModelData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      completed: (json['Completed'] as List<dynamic>)
          .map((e) => AllLecturesForCourseResponseModelData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AllWeeklyLecturesDataToJson(
        AllWeeklyLecturesData instance) =>
    <String, dynamic>{
      'Ongoing': instance.ongoing,
      'Today': instance.today,
      'Week': instance.week,
      'Completed': instance.completed,
    };
