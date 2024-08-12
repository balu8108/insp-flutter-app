import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';

part 'lecture_assignment_card_model.g.dart';

@JsonSerializable()
class LectureAssignmentCardModel {
  const LectureAssignmentCardModel(
      this.id, this.description, this.assignmentFiles);

  final String description;
  final String id;
  @JsonKey(name: 'AssignmentFiles')
  final List<LiveClassRoomFile> assignmentFiles;

  factory LectureAssignmentCardModel.fromJson(Map<String, Object?> json) =>
      _$LectureAssignmentCardModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LectureAssignmentCardModelToJson(this);
}
