// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_completed_class_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestCompletedClassesResponseModel
    _$LatestCompletedClassesResponseModelFromJson(Map<String, dynamic> json) =>
        LatestCompletedClassesResponseModel(
          data: (json['data'] as List<dynamic>)
              .map((e) => LatestCompletedClassesModelData.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$LatestCompletedClassesResponseModelToJson(
        LatestCompletedClassesResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

LatestCompletedClassesModelData _$LatestCompletedClassesModelDataFromJson(
        Map<String, dynamic> json) =>
    LatestCompletedClassesModelData(
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
    );

Map<String, dynamic> _$LatestCompletedClassesModelDataToJson(
        LatestCompletedClassesModelData instance) =>
    <String, dynamic>{
      'LiveClassRoomDetail': instance.liveClassRoomDetail,
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
    };

LiveClassRoomDetail _$LiveClassRoomDetailFromJson(Map<String, dynamic> json) =>
    LiveClassRoomDetail(
      (json['id'] as num?)?.toInt() ?? 0,
      json['chapterId'] as String? ?? '',
      json['chapterName'] as String? ?? '',
      json['topicId'] as String? ?? '',
      json['topicName'] as String? ?? '',
      json['agenda'] as String? ?? '',
      json['description'] as String? ?? '',
      (json['classRoomId'] as num?)?.toInt() ?? 0,
      (json['lectureNo'] as num?)?.toInt() ?? 0,
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$LiveClassRoomDetailToJson(
        LiveClassRoomDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'topicId': instance.topicId,
      'topicName': instance.topicName,
      'agenda': instance.agenda,
      'description': instance.description,
      'classRoomId': instance.classRoomId,
      'lectureNo': instance.lectureNo,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
