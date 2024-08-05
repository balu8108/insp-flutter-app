import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_completed_class_response_model.g.dart';

@JsonSerializable()
class LatestCompletedClassesResponseModel {
  const LatestCompletedClassesResponseModel({this.data = const []});

  final List<LatestCompletedClassesModelData> data;

  factory LatestCompletedClassesResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$LatestCompletedClassesResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LatestCompletedClassesResponseModelToJson(this);
}

@JsonSerializable()
class LatestCompletedClassesModelData {
  const LatestCompletedClassesModelData(
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
      this.liveClassRoomDetail = const LiveClassRoomDetail()]);

  @JsonKey(name: 'LiveClassRoomDetail')
  final LiveClassRoomDetail liveClassRoomDetail;

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

  factory LatestCompletedClassesModelData.fromJson(Map<String, Object?> json) =>
      _$LatestCompletedClassesModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LatestCompletedClassesModelDataToJson(this);
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
