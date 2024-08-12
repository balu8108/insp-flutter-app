import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
part 'lecture_detail_by_roomid_response_model.g.dart';

@JsonSerializable()
class LectureDetailByRoomIdResponseModel {
  const LectureDetailByRoomIdResponseModel(
      {required this.message, required this.data});

  final String message;
  final AllLecturesData data;

  factory LectureDetailByRoomIdResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$LectureDetailByRoomIdResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LectureDetailByRoomIdResponseModelToJson(this);
}

@JsonSerializable()
class AllLecturesData {
  const AllLecturesData({
    required this.liveClassRoom,
    required this.questionLogCount,
  });

  final LecturesDetailResponseModelData liveClassRoom;
  final int questionLogCount;

  factory AllLecturesData.fromJson(Map<String, Object?> json) =>
      _$AllLecturesDataFromJson(json);

  Map<String, dynamic> toJson() => _$AllLecturesDataToJson(this);
}

@JsonSerializable()
class LecturesDetailResponseModelData {
  const LecturesDetailResponseModelData(
      [this.id = 0,
      this.roomId = '',
      this.scheduledDate = '',
      this.scheduledStartTime = '',
      this.scheduledEndTime = '',
      this.mentorId = '',
      this.mentorName = '',
      this.mentorEmail = '',
      this.mentorMobile = '',
      this.muteAllStudents = false,
      this.blockStudentsCamera = false,
      this.subjectId = '',
      this.subjectName = '',
      this.classStatus = '',
      this.classType = '',
      this.classLevel = '',
      this.createdAt = '',
      this.updatedAt = '',
      this.liveClassRoomDetail = const LiveClassRoomDetail(),
      this.liveClassRoomFiles = const [],
      this.liveClassRoomRecordings = const [],
      this.leaderBoards = const []]);

  final int id;
  final String roomId,
      scheduledDate,
      scheduledStartTime,
      scheduledEndTime,
      mentorId,
      mentorName,
      mentorEmail,
      mentorMobile;
  final bool muteAllStudents, blockStudentsCamera;
  final String subjectId,
      subjectName,
      classStatus,
      classType,
      classLevel,
      createdAt,
      updatedAt;
  @JsonKey(name: 'LiveClassRoomFiles')
  final List<LiveClassRoomFile> liveClassRoomFiles;
  @JsonKey(name: 'LiveClassRoomDetail')
  final LiveClassRoomDetail liveClassRoomDetail;
  @JsonKey(name: 'LiveClassRoomRecordings')
  final List<LiveClassRoomRecordings> liveClassRoomRecordings;
  @JsonKey(name: 'LeaderBoards')
  final List<LeaderBoards> leaderBoards;

  factory LecturesDetailResponseModelData.fromJson(Map<String, Object?> json) =>
      _$LecturesDetailResponseModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LecturesDetailResponseModelDataToJson(this);
}

@JsonSerializable()
class LiveClassRoomDetail {
  const LiveClassRoomDetail(
      [this.id = 0,
      this.chapterId = '',
      this.chapterName = '',
      this.topicId = '',
      this.topicName = '',
      this.agenda = '',
      this.description = '',
      this.classRoomId = 0,
      this.lectureNo = 0,
      this.createdAt = '',
      this.updatedAt = '']);

  final int id;
  final String chapterId, chapterName, topicId, topicName, agenda, description;
  final int classRoomId, lectureNo;
  final String createdAt, updatedAt;

  factory LiveClassRoomDetail.fromJson(Map<String, Object?> json) =>
      _$LiveClassRoomDetailFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LiveClassRoomDetailToJson(this);
}

@JsonSerializable()
class LiveClassRoomRecordings {
  const LiveClassRoomRecordings(
      [this.id = 0,
      this.key = '',
      this.drmKeyId = '',
      this.hlsDrmKey = '',
      this.hlsDrmUrl = '',
      this.tpStreamId = '',
      this.dRMType = '',
      this.status = '',
      this.createdAt = '',
      this.updatedAt = '']);

  final int id;
  final String key, drmKeyId, hlsDrmKey, hlsDrmUrl, tpStreamId, dRMType, status;
  final String createdAt, updatedAt;

  factory LiveClassRoomRecordings.fromJson(Map<String, Object?> json) =>
      _$LiveClassRoomRecordingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LiveClassRoomRecordingsToJson(this);
}

@JsonSerializable()
class LeaderBoards {
  const LeaderBoards(
      [this.id = 0,
      this.peerId = '',
      this.peerName = '',
      this.peerEmail = '',
      this.correctAnswers = 0,
      this.combinedResponseTime = 0,
      this.classRoomId = 0,
      this.createdAt = '',
      this.updatedAt = '']);

  final int id, classRoomId, correctAnswers, combinedResponseTime;
  final String peerId, peerName, peerEmail;
  final String createdAt, updatedAt;

  factory LeaderBoards.fromJson(Map<String, Object?> json) =>
      _$LeaderBoardsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LeaderBoardsToJson(this);
}
