// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_answer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderBoardAnswerModel _$LeaderBoardAnswerModelFromJson(
        Map<String, dynamic> json) =>
    LeaderBoardAnswerModel(
      key: json['key'] as String? ?? '',
      value: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$LeaderBoardAnswerModelToJson(
        LeaderBoardAnswerModel instance) =>
    <String, dynamic>{
      'value': instance.value,
      'key': instance.key,
    };
