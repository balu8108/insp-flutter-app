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
                  LiveClassRoomRecordings.fromJson(e as Map<String, dynamic>))
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
