// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_solo_recording_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewSoloRecordingResponseModel _$ViewSoloRecordingResponseModelFromJson(
        Map<String, dynamic> json) =>
    ViewSoloRecordingResponseModel(
      status: json['status'] as bool? ?? false,
      data: json['data'] == null
          ? const RecordSoloVideoResponseModelData()
          : RecordSoloVideoResponseModelData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewSoloRecordingResponseModelToJson(
        ViewSoloRecordingResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

RecordSoloVideoResponseModelData _$RecordSoloVideoResponseModelDataFromJson(
        Map<String, dynamic> json) =>
    RecordSoloVideoResponseModelData(
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
      (json['SoloClassRoomFiles'] as List<dynamic>?)
              ?.map(
                  (e) => LiveClassRoomFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      (json['SoloClassRoomRecordings'] as List<dynamic>?)
              ?.map((e) =>
                  SoloClassRoomRecordings.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RecordSoloVideoResponseModelDataToJson(
        RecordSoloVideoResponseModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lectureNo': instance.lectureNo,
      'description': instance.description,
      'subjectId': instance.subjectId,
      'topicId': instance.topicId,
      'topic': instance.topic,
      'agenda': instance.agenda,
      'mentorName': instance.mentorName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'SoloClassRoomFiles': instance.soloClassRoomFiles,
      'SoloClassRoomRecordings': instance.soloClassRoomRecordings,
    };
