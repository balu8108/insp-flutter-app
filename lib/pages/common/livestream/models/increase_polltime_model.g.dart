// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'increase_polltime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncreasePollTimeModel _$IncreasePollTimeModelFromJson(
        Map<String, dynamic> json) =>
    IncreasePollTimeModel(
      questionId: json['questionId'] as String? ?? '',
      timeIncreaseBy: (json['timeIncreaseBy'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$IncreasePollTimeModelToJson(
        IncreasePollTimeModel instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'timeIncreaseBy': instance.timeIncreaseBy,
    };
