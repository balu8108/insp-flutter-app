// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_topic_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingTopicRequestModel _$RatingTopicRequestModelFromJson(
        Map<String, dynamic> json) =>
    RatingTopicRequestModel(
      rating: (json['rating'] as num).toInt(),
      topicId: (json['topicId'] as num).toInt(),
      feedback: json['feedback'] as String,
    );

Map<String, dynamic> _$RatingTopicRequestModelToJson(
        RatingTopicRequestModel instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'topicId': instance.topicId,
      'feedback': instance.feedback,
    };
