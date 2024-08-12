import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_upload_assignment_response_model.g.dart';

@JsonSerializable()
class LatestUploadedAssignmentResponseModel {
  const LatestUploadedAssignmentResponseModel({this.data = const []});

  final List<LatestUploadedAssignmentModelData> data;

  factory LatestUploadedAssignmentResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$LatestUploadedAssignmentResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LatestUploadedAssignmentResponseModelToJson(this);
}

@JsonSerializable()
class LatestUploadedAssignmentModelData {
  const LatestUploadedAssignmentModelData(
      [this.id = 0,
      this.topicId = '',
      this.topicName = '',
      this.instructorName = '',
      this.description = '',
      this.subjectId = '',
      this.subjectName = '',
      this.createdAt = '',
      this.updatedAt = '']);

  final int id;
  final String subjectId,
      subjectName,
      createdAt,
      updatedAt,
      topicId,
      topicName,
      instructorName,
      description;

  factory LatestUploadedAssignmentModelData.fromJson(
          Map<String, Object?> json) =>
      _$LatestUploadedAssignmentModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$LatestUploadedAssignmentModelDataToJson(this);
}
