import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:insp/apiservices/models/soloclasses/soloclass_topicwise_details_response_model.dart';
part 'soloclass_detail_response_model.g.dart';

@JsonSerializable()
class SoloClassDetailResponseModel {
  const SoloClassDetailResponseModel(
      {required this.status, required this.data});

  final bool status;
  final SoloClassDetail data;

  factory SoloClassDetailResponseModel.fromJson(Map<String, Object?> json) =>
      _$SoloClassDetailResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SoloClassDetailResponseModelToJson(this);
}

@JsonSerializable()
class SoloClassDetail {
  const SoloClassDetail(
      [this.soloClassroomDetails = const SoloResponseModelData(),
      this.soloClassRoomFile = const [],
      this.soloClassRoomRecordings = const []]);

  @JsonKey(name: 'soloClassroomDetails')
  final SoloResponseModelData soloClassroomDetails;
  @JsonKey(name: 'soloClassRoomFile')
  final List<LiveClassRoomFile> soloClassRoomFile;
  @JsonKey(name: 'soloClassRoomRecordings')
  final List<SoloClassRoomRecordings> soloClassRoomRecordings;

  factory SoloClassDetail.fromJson(Map<String, Object?> json) =>
      _$SoloClassDetailFromJson(json);

  Map<String, dynamic> toJson() => _$SoloClassDetailToJson(this);
}

@JsonSerializable()
class SoloResponseModelData {
  const SoloResponseModelData([
    this.id = 0,
    this.subjectId = '',
    this.mentorName = '',
    this.topicId = '',
    this.topic = '',
    this.agenda = '',
    this.description = '',
    this.lectureNo = 0,
    this.createdAt = '',
    this.updatedAt = '',
  ]);

  final int id, lectureNo;
  final String mentorName,
      subjectId,
      topicId,
      topic,
      agenda,
      description,
      createdAt,
      updatedAt;

  factory SoloResponseModelData.fromJson(Map<String, Object?> json) =>
      _$SoloResponseModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$SoloResponseModelDataToJson(this);
}
