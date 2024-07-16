import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_completed_class_card_model.g.dart';

@JsonSerializable()
class LatestCompletedClassCardModel {
  const LatestCompletedClassCardModel(
      this.id, this.topicName, this.topicId, this.mentorName, this.description);

  final String id, topicName, topicId, mentorName, description;

  factory LatestCompletedClassCardModel.fromJson(Map<String, Object?> json) =>
      _$LatestCompletedClassCardModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LatestCompletedClassCardModelToJson(this);
}
