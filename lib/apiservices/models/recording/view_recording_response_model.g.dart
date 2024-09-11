// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_recording_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ViewRecordingResponseModel _$ViewRecordingResponseModelFromJson(
        Map<String, dynamic> json) =>
    ViewRecordingResponseModel(
      status: json['status'] as bool? ?? false,
      data: json['data'] == null
          ? const RecordVideoResponseModelData()
          : RecordVideoResponseModelData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ViewRecordingResponseModelToJson(
        ViewRecordingResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

RecordVideoResponseModelData _$RecordVideoResponseModelDataFromJson(
        Map<String, dynamic> json) =>
    RecordVideoResponseModelData(
      (json['id'] as num?)?.toInt() ?? 0,
      json['roomId'] as String? ?? '',
      json['scheduledDate'] as String? ?? '',
      json['scheduledStartTime'] as String? ?? '',
      json['scheduledEndTime'] as String? ?? '',
      json['mentorId'] as String? ?? '',
      json['mentorName'] as String? ?? '',
      json['mentorEmail'] as String? ?? '',
      json['mentorMobile'] as String? ?? '',
      json['muteAllStudents'] as bool? ?? false,
      json['blockStudentsCamera'] as bool? ?? false,
      json['subjectId'] as String? ?? '',
      json['subjectName'] as String? ?? '',
      json['classStatus'] as String? ?? '',
      json['classType'] as String? ?? '',
      json['classLevel'] as String? ?? '',
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
      json['LiveClassRoomDetail'] == null
          ? const LiveClassRoomDetail()
          : LiveClassRoomDetail.fromJson(
              json['LiveClassRoomDetail'] as Map<String, dynamic>),
      (json['LiveClassRoomFiles'] as List<dynamic>?)
              ?.map(
                  (e) => LiveClassRoomFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      (json['LiveClassRoomRecordings'] as List<dynamic>?)
              ?.map((e) =>
                  LiveClassRoomRecordings.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RecordVideoResponseModelDataToJson(
        RecordVideoResponseModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomId': instance.roomId,
      'scheduledDate': instance.scheduledDate,
      'scheduledStartTime': instance.scheduledStartTime,
      'scheduledEndTime': instance.scheduledEndTime,
      'mentorId': instance.mentorId,
      'mentorName': instance.mentorName,
      'mentorEmail': instance.mentorEmail,
      'mentorMobile': instance.mentorMobile,
      'muteAllStudents': instance.muteAllStudents,
      'blockStudentsCamera': instance.blockStudentsCamera,
      'subjectId': instance.subjectId,
      'subjectName': instance.subjectName,
      'classStatus': instance.classStatus,
      'classType': instance.classType,
      'classLevel': instance.classLevel,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'LiveClassRoomFiles': instance.liveClassRoomFiles,
      'LiveClassRoomDetail': instance.liveClassRoomDetail,
      'LiveClassRoomRecordings': instance.liveClassRoomRecordings,
    };
