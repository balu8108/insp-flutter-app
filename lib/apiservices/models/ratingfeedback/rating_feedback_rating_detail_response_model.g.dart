// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_feedback_rating_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingFeedbackRatingDetailResponseModel
    _$RatingFeedbackRatingDetailResponseModelFromJson(
            Map<String, dynamic> json) =>
        RatingFeedbackRatingDetailResponseModel(
          topicDetails: (json['topicDetails'] as List<dynamic>?)
                  ?.map((e) =>
                      RatingDetailModelData.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
          topicId: json['topicId'] as String? ?? "",
        );

Map<String, dynamic> _$RatingFeedbackRatingDetailResponseModelToJson(
        RatingFeedbackRatingDetailResponseModel instance) =>
    <String, dynamic>{
      'topicId': instance.topicId,
      'topicDetails': instance.topicDetails,
    };

RatingDetailModelData _$RatingDetailModelDataFromJson(
        Map<String, dynamic> json) =>
    RatingDetailModelData(
      (json['id'] as num?)?.toInt() ?? 0,
      json['topicId'] as String? ?? '',
      json['raterId'] as String? ?? '',
      json['raterName'] as String? ?? '',
      (json['rating'] as num?)?.toInt() ?? 0,
      json['feedback'] as String? ?? '',
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$RatingDetailModelDataToJson(
        RatingDetailModelData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'rating': instance.rating,
      'topicId': instance.topicId,
      'raterId': instance.raterId,
      'raterName': instance.raterName,
      'feedback': instance.feedback,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
