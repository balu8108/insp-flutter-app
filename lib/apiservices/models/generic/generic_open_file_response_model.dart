import 'package:freezed_annotation/freezed_annotation.dart';

part 'generic_open_file_response_model.g.dart';

@JsonSerializable()
class GenericOpenFileResponseModel {
  const GenericOpenFileResponseModel(
      {required this.status, required this.data});

  final bool status;
  @JsonKey(name: 'data')
  final GetUrl data;
  factory GenericOpenFileResponseModel.fromJson(Map<String, Object?> json) =>
      _$GenericOpenFileResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GenericOpenFileResponseModelToJson(this);
}

@JsonSerializable()
class GetUrl {
  const GetUrl({required this.getUrl});

  final String getUrl;

  factory GetUrl.fromJson(Map<String, Object?> json) => _$GetUrlFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetUrlToJson(this);
}
