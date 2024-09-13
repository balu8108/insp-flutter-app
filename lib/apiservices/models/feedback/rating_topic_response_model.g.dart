// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_topic_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingTopicResponseModel _$RatingTopicResponseModelFromJson(
        Map<String, dynamic> json) =>
    RatingTopicResponseModel(
      status: json['status'] as bool,
      data: json['data'] as String,
    );

Map<String, dynamic> _$RatingTopicResponseModelToJson(
        RatingTopicResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
