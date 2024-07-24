// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_lecture_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpcomingLectureCardModel _$UpcomingLectureCardModelFromJson(
        Map<String, dynamic> json) =>
    UpcomingLectureCardModel(
      (json['Ongoing'] as List<dynamic>)
          .map((e) => AllLecturesForCourseResponseModelData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      (json['Today'] as List<dynamic>)
          .map((e) => AllLecturesForCourseResponseModelData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      (json['Week'] as List<dynamic>)
          .map((e) => AllLecturesForCourseResponseModelData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      (json['Completed'] as List<dynamic>)
          .map((e) => AllLecturesForCourseResponseModelData.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UpcomingLectureCardModelToJson(
        UpcomingLectureCardModel instance) =>
    <String, dynamic>{
      'Ongoing': instance.ongoing,
      'Today': instance.today,
      'Week': instance.week,
      'Completed': instance.completed,
    };
