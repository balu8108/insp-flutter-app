import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';

part 'all_assignment_response_model.g.dart';

@JsonSerializable()
class AllAssignmentResponseModel {
  const AllAssignmentResponseModel({this.data = const []});

  final List<AllAssignmentModelData> data;

  factory AllAssignmentResponseModel.fromJson(Map<String, Object?> json) =>
      _$AllAssignmentResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllAssignmentResponseModelToJson(this);
}

@JsonSerializable()
class AllAssignmentModelData {
  const AllAssignmentModelData(
      [this.id = 0,
      this.topicId = '',
      this.topicName = '',
      this.instructorName = '',
      this.description = '',
      this.subjectId = '',
      this.subjectName = '',
      this.createdAt = '',
      this.updatedAt = '',
      this.assignmentFiles = const []]);

  final int id;
  final String subjectId,
      subjectName,
      createdAt,
      updatedAt,
      topicId,
      topicName,
      instructorName,
      description;
  @JsonKey(name: 'AssignmentFiles')
  final List<LiveClassRoomFile> assignmentFiles;

  factory AllAssignmentModelData.fromJson(Map<String, Object?> json) =>
      _$AllAssignmentModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllAssignmentModelDataToJson(this);
}
