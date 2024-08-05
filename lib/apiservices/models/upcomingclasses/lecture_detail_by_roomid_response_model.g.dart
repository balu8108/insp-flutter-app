// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_detail_by_roomid_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LectureDetailByRoomIdResponseModel _$LectureDetailByRoomIdResponseModelFromJson(
        Map<String, dynamic> json) =>
    LectureDetailByRoomIdResponseModel(
      message: json['message'] as String,
      data: AllLecturesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LectureDetailByRoomIdResponseModelToJson(
        LectureDetailByRoomIdResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

AllLecturesData _$AllLecturesDataFromJson(Map<String, dynamic> json) =>
    AllLecturesData(
      liveClassRoom: LecturesDetailResponseModelData.fromJson(
          json['liveClassRoom'] as Map<String, dynamic>),
      questionLogCount: (json['questionLogCount'] as num).toInt(),
    );

Map<String, dynamic> _$AllLecturesDataToJson(AllLecturesData instance) =>
    <String, dynamic>{
      'liveClassRoom': instance.liveClassRoom,
      'questionLogCount': instance.questionLogCount,
    };

LecturesDetailResponseModelData _$LecturesDetailResponseModelDataFromJson(
        Map<String, dynamic> json) =>
    LecturesDetailResponseModelData(
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
      (json['LeaderBoards'] as List<dynamic>?)
              ?.map((e) => LeaderBoards.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$LecturesDetailResponseModelDataToJson(
        LecturesDetailResponseModelData instance) =>
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
      'LeaderBoards': instance.leaderBoards,
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

LiveClassRoomRecordings _$LiveClassRoomRecordingsFromJson(
        Map<String, dynamic> json) =>
    LiveClassRoomRecordings(
      (json['id'] as num?)?.toInt() ?? 0,
      json['key'] as String? ?? '',
      (json['classRoomId'] as num?)?.toInt() ?? 0,
      json['drmKeyId'] as String? ?? '',
      json['hlsDrmKey'] as String? ?? '',
      json['hlsDrmUrl'] as String? ?? '',
      json['tpStreamId'] as String? ?? '',
      json['dRMType'] as String? ?? '',
      json['status'] as String? ?? '',
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$LiveClassRoomRecordingsToJson(
        LiveClassRoomRecordings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'classRoomId': instance.classRoomId,
      'key': instance.key,
      'drmKeyId': instance.drmKeyId,
      'hlsDrmKey': instance.hlsDrmKey,
      'hlsDrmUrl': instance.hlsDrmUrl,
      'tpStreamId': instance.tpStreamId,
      'dRMType': instance.dRMType,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

LeaderBoards _$LeaderBoardsFromJson(Map<String, dynamic> json) => LeaderBoards(
      (json['id'] as num?)?.toInt() ?? 0,
      json['peerId'] as String? ?? '',
      json['peerName'] as String? ?? '',
      json['peerEmail'] as String? ?? '',
      (json['correctAnswers'] as num?)?.toInt() ?? 0,
      (json['combinedResponseTime'] as num?)?.toInt() ?? 0,
      (json['classRoomId'] as num?)?.toInt() ?? 0,
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$LeaderBoardsToJson(LeaderBoards instance) =>
    <String, dynamic>{
      'id': instance.id,
      'classRoomId': instance.classRoomId,
      'correctAnswers': instance.correctAnswers,
      'combinedResponseTime': instance.combinedResponseTime,
      'peerId': instance.peerId,
      'peerName': instance.peerName,
      'peerEmail': instance.peerEmail,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
