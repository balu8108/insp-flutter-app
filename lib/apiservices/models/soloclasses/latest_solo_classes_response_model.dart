import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_solo_classes_response_model.g.dart';

@JsonSerializable()
class LatestSoloClassesResponseModel {
  const LatestSoloClassesResponseModel([this.data = const []]);

  final List<AllSoloClassesModelData> data;

  factory LatestSoloClassesResponseModel.fromJson(Map<String, Object?> json) =>
      _$LatestSoloClassesResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LatestSoloClassesResponseModelToJson(this);
}

@JsonSerializable()
class AllSoloClassesModelData {
  const AllSoloClassesModelData(
      [this.id = 0,
      this.subjectId = '',
      this.mentorName = '',
      this.topicId = '',
      this.topic = '',
      this.agenda = '',
      this.description = '',
      this.createdAt = '',
      this.updatedAt = '',
      this.lectureNo = 0]);

  final String subjectId,
      mentorName,
      topicId,
      topic,
      agenda,
      description,
      createdAt,
      updatedAt;
  final int id, lectureNo;

  factory AllSoloClassesModelData.fromJson(Map<String, Object?> json) =>
      _$AllSoloClassesModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllSoloClassesModelDataToJson(this);
}
