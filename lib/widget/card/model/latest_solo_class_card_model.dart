import 'package:freezed_annotation/freezed_annotation.dart';

part 'latest_solo_class_card_model.g.dart';

@JsonSerializable()
class LatestSoloClassCardModel {
  const LatestSoloClassCardModel(
      this.id, this.topicId, this.topic, this.mentorName, this.description);

  final String id, topicId, topic, mentorName, description;

  factory LatestSoloClassCardModel.fromJson(Map<String, Object?> json) =>
      _$LatestSoloClassCardModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LatestSoloClassCardModelToJson(this);
}
