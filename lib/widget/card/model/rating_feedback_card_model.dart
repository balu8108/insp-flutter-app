import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_feedback_card_model.g.dart';

@JsonSerializable()
class RatingFeedbackCardModal {
  const RatingFeedbackCardModal(this.raterName, this.feedback, this.rating)
      : super();

  @override
  final String raterName, feedback;
  final int rating;

  factory RatingFeedbackCardModal.fromJson(Map<String, Object?> json) =>
      _$RatingFeedbackCardModalFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RatingFeedbackCardModalToJson(this);
}
