import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';

part 'topic_assignment_card_model.g.dart';

@JsonSerializable()
class TopicAssignmentCardModel {
  const TopicAssignmentCardModel(this.id, this.description,
      this.assignmentFiles, this.topicName, this.instructorName);

  final String description, topicName, instructorName, id;
  @JsonKey(name: 'AssignmentFiles')
  final List<LiveClassRoomFile> assignmentFiles;

  factory TopicAssignmentCardModel.fromJson(Map<String, Object?> json) =>
      _$TopicAssignmentCardModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TopicAssignmentCardModelToJson(this);
}
