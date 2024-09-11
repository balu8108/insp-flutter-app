// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_lectures_for_course_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllLecturesForCourseResponseModel _$AllLecturesForCourseResponseModelFromJson(
        Map<String, dynamic> json) =>
    AllLecturesForCourseResponseModel(
      json['message'] as String? ?? '',
      (json['data'] as List<dynamic>?)
              ?.map((e) => AllLecturesForCourseResponseModelData.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$AllLecturesForCourseResponseModelToJson(
        AllLecturesForCourseResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

AllLecturesForCourseResponseModelData
    _$AllLecturesForCourseResponseModelDataFromJson(
            Map<String, dynamic> json) =>
        AllLecturesForCourseResponseModelData(
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
                  ?.map((e) =>
                      LiveClassRoomFile.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$AllLecturesForCourseResponseModelDataToJson(
        AllLecturesForCourseResponseModelData instance) =>
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
    };

LiveClassRoomFile _$LiveClassRoomFileFromJson(Map<String, dynamic> json) =>
    LiveClassRoomFile(
      (json['id'] as num?)?.toInt() ?? 0,
      json['key'] as String? ?? '',
      json['isDownloadable'] as bool? ?? false,
      json['isShareable'] as bool? ?? false,
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$LiveClassRoomFileToJson(LiveClassRoomFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'isDownloadable': instance.isDownloadable,
      'isShareable': instance.isShareable,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
