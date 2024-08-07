import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_feedback_rating_detail_response_model.g.dart';

@JsonSerializable()
class RatingFeedbackRatingDetailResponseModel {
  const RatingFeedbackRatingDetailResponseModel(
      {this.topicDetails = const [], this.topicId = ""});

  final String topicId;
  final List<RatingDetailModelData> topicDetails;

  factory RatingFeedbackRatingDetailResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$RatingFeedbackRatingDetailResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$RatingFeedbackRatingDetailResponseModelToJson(this);
}

@JsonSerializable()
class RatingDetailModelData {
  const RatingDetailModelData([
    this.id = 0,
    this.topicId = '',
    this.raterId = '',
    this.raterName = '',
    this.rating = 0,
    this.feedback = '',
    this.createdAt = '',
    this.updatedAt = '',
  ]);

  final int id, rating;
  final String topicId, raterId, raterName, feedback, createdAt, updatedAt;

  factory RatingDetailModelData.fromJson(Map<String, Object?> json) =>
      _$RatingDetailModelDataFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RatingDetailModelDataToJson(this);
}
