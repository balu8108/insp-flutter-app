// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_lectures_for_upcoming_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllLecturesForUpcomingResponseModel
    _$AllLecturesForUpcomingResponseModelFromJson(Map<String, dynamic> json) =>
        AllLecturesForUpcomingResponseModel(
          data: AllLecturesData.fromJson(json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$AllLecturesForUpcomingResponseModelToJson(
        AllLecturesForUpcomingResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AllLecturesData _$AllLecturesDataFromJson(Map<String, dynamic> json) =>
    AllLecturesData(
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

Map<String, dynamic> _$AllLecturesDataToJson(AllLecturesData instance) =>
    <String, dynamic>{
      'Ongoing': instance.ongoing,
      'Today': instance.today,
      'Week': instance.week,
      'Completed': instance.completed,
    };
