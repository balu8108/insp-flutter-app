// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recording_player_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecordingPlayerCard _$RecordingPlayerCardFromJson(Map<String, dynamic> json) =>
    RecordingPlayerCard(
      json['topicName'] as String,
      json['mentorName'] as String,
      json['description'] as String,
      (json['LiveClassRoomFiles'] as List<dynamic>)
          .map((e) => LiveClassRoomFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['LiveClassRoomRecordings'] as List<dynamic>)
          .map((e) =>
              LiveClassRoomRecordings.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['agenda'] as String,
    );

Map<String, dynamic> _$RecordingPlayerCardToJson(
        RecordingPlayerCard instance) =>
    <String, dynamic>{
      'topicName': instance.topicName,
      'mentorName': instance.mentorName,
      'description': instance.description,
      'agenda': instance.agenda,
      'LiveClassRoomFiles': instance.liveClassRoomFiles,
      'LiveClassRoomRecordings': instance.liveClassRoomRecordings,
    };
