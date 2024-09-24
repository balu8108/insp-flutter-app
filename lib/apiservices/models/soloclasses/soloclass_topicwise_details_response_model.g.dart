// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'soloclass_topicwise_details_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SoloclassTopicwiseDetailsResponseModel
    _$SoloclassTopicwiseDetailsResponseModelFromJson(
            Map<String, dynamic> json) =>
        SoloclassTopicwiseDetailsResponseModel(
          transformedData: json['transformedData'] == null
              ? const TransformedModelData()
              : TransformedModelData.fromJson(
                  json['transformedData'] as Map<String, dynamic>),
          totalLectures: (json['totalLectures'] as num?)?.toInt() ?? 0,
        );

Map<String, dynamic> _$SoloclassTopicwiseDetailsResponseModelToJson(
        SoloclassTopicwiseDetailsResponseModel instance) =>
    <String, dynamic>{
      'totalLectures': instance.totalLectures,
      'transformedData': instance.transformedData,
    };

TransformedModelData _$TransformedModelDataFromJson(
        Map<String, dynamic> json) =>
    TransformedModelData(
      json['subjectId'] as String? ?? '',
      json['topicId'] as String? ?? '',
      json['topic'] as String? ?? '',
      (json['SoloClassRoomRecordings'] as List<dynamic>?)
              ?.map((e) =>
                  SoloClassRoomRecordings.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      (json['SoloClassRoomFiles'] as List<dynamic>?)
              ?.map(
                  (e) => LiveClassRoomFile.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$TransformedModelDataToJson(
        TransformedModelData instance) =>
    <String, dynamic>{
      'subjectId': instance.subjectId,
      'topicId': instance.topicId,
      'topic': instance.topic,
      'SoloClassRoomRecordings': instance.soloClassRoomRecordings,
      'SoloClassRoomFiles': instance.soloClassRoomFiles,
    };

SoloClassRoomRecordings _$SoloClassRoomRecordingsFromJson(
        Map<String, dynamic> json) =>
    SoloClassRoomRecordings(
      (json['id'] as num?)?.toInt() ?? 0,
      json['key'] as String? ?? '',
      (json['soloClassRoomId'] as num?)?.toInt() ?? 0,
      json['tpStreamId'] as String? ?? '',
      json['rtmp_url'] as String? ?? '',
      json['stream_key'] as String? ?? '',
      json['status'] as String? ?? '',
      json['createdAt'] as String? ?? '',
      json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$SoloClassRoomRecordingsToJson(
        SoloClassRoomRecordings instance) =>
    <String, dynamic>{
      'id': instance.id,
      'soloClassRoomId': instance.soloClassRoomId,
      'key': instance.key,
      'tpStreamId': instance.tpStreamId,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'rtmp_url': instance.rtmpUrl,
      'stream_key': instance.streamKey,
    };
