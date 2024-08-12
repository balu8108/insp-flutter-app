// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_solo_classes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestSoloClassesResponseModel _$LatestSoloClassesResponseModelFromJson(
        Map<String, dynamic> json) =>
    LatestSoloClassesResponseModel(
      (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  AllSoloClassesModelData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LatestSoloClassesResponseModelToJson(
        LatestSoloClassesResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AllSoloClassesModelData _$AllSoloClassesModelDataFromJson(
        Map<String, dynamic> json) =>
    AllSoloClassesModelData(
      (json['id'] as num?)?.toInt() ?? 0,
      json['subjectId'] as String? ?? '',
      json['mentorName'] as String? ?? '',
      json['topicId'] as String? ?? '',
      json['topic'] as String? ?? '',
      json['agenda'] as String? ?? '',
      json['description'] as String? ?? '',
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
      (json['lectureNo'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$AllSoloClassesModelDataToJson(
        AllSoloClassesModelData instance) =>
    <String, dynamic>{
      'subjectId': instance.subjectId,
      'mentorName': instance.mentorName,
      'topicId': instance.topicId,
      'topic': instance.topic,
      'agenda': instance.agenda,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
      'lectureNo': instance.lectureNo,
    };
