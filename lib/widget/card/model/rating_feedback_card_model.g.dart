// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_feedback_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingFeedbackCardModal _$RatingFeedbackCardModalFromJson(
        Map<String, dynamic> json) =>
    RatingFeedbackCardModal(
      json['raterName'] as String,
      json['feedback'] as String,
      (json['rating'] as num).toInt(),
    );

Map<String, dynamic> _$RatingFeedbackCardModalToJson(
        RatingFeedbackCardModal instance) =>
    <String, dynamic>{
      'raterName': instance.raterName,
      'feedback': instance.feedback,
      'rating': instance.rating,
    };
