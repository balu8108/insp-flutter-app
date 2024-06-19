// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insp_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

INSPCardModel _$INSPCardModelFromJson(Map<String, dynamic> json) =>
    INSPCardModel(
      json['id'] as String,
      json['name'] as String,
      json['status'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$INSPCardModelToJson(INSPCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'description': instance.description,
    };
