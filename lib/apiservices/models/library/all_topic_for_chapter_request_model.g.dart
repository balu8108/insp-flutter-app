// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_topic_for_chapter_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllTopicsForChapterRequestModel _$AllTopicsForChapterRequestModelFromJson(
        Map<String, dynamic> json) =>
    AllTopicsForChapterRequestModel(
      secret_key: json['secret_key'] as String,
      chapter_id: json['chapter_id'] as String,
    );

Map<String, dynamic> _$AllTopicsForChapterRequestModelToJson(
        AllTopicsForChapterRequestModel instance) =>
    <String, dynamic>{
      'secret_key': instance.secret_key,
      'chapter_id': instance.chapter_id,
    };
