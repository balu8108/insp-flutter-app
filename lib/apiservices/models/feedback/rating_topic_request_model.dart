import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_topic_request_model.g.dart';

@JsonSerializable()
class RatingTopicRequestModel {
  const RatingTopicRequestModel(
      {required this.rating, required this.topicId, required this.feedback});

  final int rating, topicId;
  final String feedback;
  factory RatingTopicRequestModel.fromJson(Map<String, Object?> json) =>
      _$RatingTopicRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RatingTopicRequestModelToJson(this);
}
