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

LiveClassRoomFile _$LiveClassRoomFileFromJson(Map<String, dynamic> json) =>
    LiveClassRoomFile(
      (json['id'] as num?)?.toInt() ?? 0,
      json['key'] as String? ?? '',
      json['isDownloadable'] as bool? ?? false,
      json['isShareable'] as bool? ?? false,
      (json['classRoomId'] as num?)?.toInt() ?? 0,
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$LiveClassRoomFileToJson(LiveClassRoomFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'key': instance.key,
      'isDownloadable': instance.isDownloadable,
      'isShareable': instance.isShareable,
      'classRoomId': instance.classRoomId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
