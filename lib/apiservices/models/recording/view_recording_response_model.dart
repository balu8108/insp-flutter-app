import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/apiservices/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';

part 'view_recording_response_model.g.dart';

@JsonSerializable()
class ViewRecordingResponseModel {
  const ViewRecordingResponseModel(
      {this.status = false, this.data = const RecordVideoResponseModelData()});

  final bool status;
  final RecordVideoResponseModelData data;

  factory ViewRecordingResponseModel.fromJson(Map<String, Object?> json) =>
      _$ViewRecordingResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ViewRecordingResponseModelToJson(this);
}

@JsonSerializable()
class RecordVideoResponseModelData {
  const RecordVideoResponseModelData(
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
      this.liveClassRoomRecordings = const []]);

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

  factory RecordVideoResponseModelData.fromJson(Map<String, Object?> json) =>
      _$RecordVideoResponseModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RecordVideoResponseModelDataToJson(this);
}
