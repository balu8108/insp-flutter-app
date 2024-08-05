import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_assignment_card_model.g.dart';

@JsonSerializable()
class LatestAssignmentCardModel {
  const LatestAssignmentCardModel(this.id, this.topicName, this.topicId,
      this.instructorName, this.description);

  final String id, topicName, topicId, instructorName, description;

  factory LatestAssignmentCardModel.fromJson(Map<String, Object?> json) =>
      _$LatestAssignmentCardModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LatestAssignmentCardModelToJson(this);
}
