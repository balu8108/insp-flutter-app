// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soloclass_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoloClassDetailResponseModel _$SoloClassDetailResponseModelFromJson(
        Map<String, dynamic> json) =>
    SoloClassDetailResponseModel(
      status: json['status'] as bool,
      data: SoloClassDetail.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SoloClassDetailResponseModelToJson(
        SoloClassDetailResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

SoloClassDetail _$SoloClassDetailFromJson(Map<String, dynamic> json) =>
    SoloClassDetail(
      json['soloClassroomDetails'] == null
          ? const SoloResponseModelData()
          : SoloResponseModelData.fromJson(
              json['soloClassroomDetails'] as Map<String, dynamic>),
      (json['soloClassRoomFile'] as List<dynamic>?)
              ?.map(
                  (e) => LiveClassRoomFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      (json['soloClassRoomRecordings'] as List<dynamic>?)
              ?.map((e) =>
                  SoloClassRoomRecordings.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$SoloClassDetailToJson(SoloClassDetail instance) =>
    <String, dynamic>{
      'soloClassroomDetails': instance.soloClassroomDetails,
      'soloClassRoomFile': instance.soloClassRoomFile,
      'soloClassRoomRecordings': instance.soloClassRoomRecordings,
    };

SoloResponseModelData _$SoloResponseModelDataFromJson(
        Map<String, dynamic> json) =>
    SoloResponseModelData(
      (json['id'] as num?)?.toInt() ?? 0,
      json['subjectId'] as String? ?? '',
      json['mentorName'] as String? ?? '',
      json['topicId'] as String? ?? '',
      json['topic'] as String? ?? '',
      json['agenda'] as String? ?? '',
      json['description'] as String? ?? '',
      (json['lectureNo'] as num?)?.toInt() ?? 0,
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$SoloResponseModelDataToJson(
        SoloResponseModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lectureNo': instance.lectureNo,
      'mentorName': instance.mentorName,
      'subjectId': instance.subjectId,
      'topicId': instance.topicId,
      'topic': instance.topic,
      'agenda': instance.agenda,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
