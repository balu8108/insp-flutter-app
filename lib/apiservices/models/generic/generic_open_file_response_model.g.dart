// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_open_file_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenericOpenFileResponseModel _$GenericOpenFileResponseModelFromJson(
        Map<String, dynamic> json) =>
    GenericOpenFileResponseModel(
      status: json['status'] as bool,
      data: GetUrl.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GenericOpenFileResponseModelToJson(
        GenericOpenFileResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

GetUrl _$GetUrlFromJson(Map<String, dynamic> json) => GetUrl(
      getUrl: json['getUrl'] as String,
    );

Map<String, dynamic> _$GetUrlToJson(GetUrl instance) => <String, dynamic>{
      'getUrl': instance.getUrl,
    };
