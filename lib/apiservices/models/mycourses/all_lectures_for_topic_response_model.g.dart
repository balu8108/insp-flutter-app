// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_lectures_for_topic_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllLecturesForTopicResponseModel _$AllLecturesForTopicResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllLecturesForTopicResponseModel(
      json['message'] as String? ?? '',
      (json['data'] as List<dynamic>?)
              ?.map((e) => AllLecturesForTopicResponseModelData.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllLecturesForTopicResponseModelToJson(
        AllLecturesForTopicResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

AllLecturesForTopicResponseModelData
    _$AllLecturesForTopicResponseModelDataFromJson(Map<String, dynamic> json) =>
        AllLecturesForTopicResponseModelData(
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

Map<String, dynamic> _$AllLecturesForTopicResponseModelDataToJson(
        AllLecturesForTopicResponseModelData instance) =>
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
      'LiveClassRoomDetail': instance.liveClassRoomDetail,
    };
