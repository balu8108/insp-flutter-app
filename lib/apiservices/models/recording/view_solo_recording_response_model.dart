import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:insp/apiservices/models/soloclasses/soloclass_topicwise_details_response_model.dart';

part 'view_solo_recording_response_model.g.dart';

@JsonSerializable()
class ViewSoloRecordingResponseModel {
  const ViewSoloRecordingResponseModel(
      {this.status = false,
      this.data = const RecordSoloVideoResponseModelData()});

  final bool status;
  final RecordSoloVideoResponseModelData data;

  factory ViewSoloRecordingResponseModel.fromJson(Map<String, Object?> json) =>
      _$ViewSoloRecordingResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ViewSoloRecordingResponseModelToJson(this);
}

@JsonSerializable()
class RecordSoloVideoResponseModelData {
  const RecordSoloVideoResponseModelData(
      [this.id = 0,
      this.subjectId = '',
      this.mentorName = '',
      this.topicId = '',
      this.topic = '',
      this.agenda = '',
      this.description = '',
      this.lectureNo = 0,
      this.createdAt = '',
      this.updatedAt = '',
      this.soloClassRoomFiles = const [],
      this.soloClassRoomRecordings = const []]);

  final int id, lectureNo;
  final String description,
      subjectId,
      topicId,
      topic,
      agenda,
      mentorName,
      createdAt,
      updatedAt;
  @JsonKey(name: 'SoloClassRoomFiles')
  final List<LiveClassRoomFile> soloClassRoomFiles;
  @JsonKey(name: 'SoloClassRoomRecordings')
  final List<SoloClassRoomRecordings> soloClassRoomRecordings;

  factory RecordSoloVideoResponseModelData.fromJson(
          Map<String, Object?> json) =>
      _$RecordSoloVideoResponseModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RecordSoloVideoResponseModelDataToJson(this);
}
