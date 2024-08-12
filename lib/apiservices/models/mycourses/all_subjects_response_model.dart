import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_subjects_response_model.g.dart';

@JsonSerializable()
class AllSubjectsResponseModel {
  const AllSubjectsResponseModel(
      [this.status = false,
      this.responseMessage = '',
      this.allSubjectsResponseModelResults = const []]);

  final bool status;

  @JsonKey(name: 'response_message')
  final String responseMessage;

  @JsonKey(name: 'result')
  final List<AllSubjectsResponseModelResult> allSubjectsResponseModelResults;

  factory AllSubjectsResponseModel.fromJson(Map<String, Object?> json) =>
      _$AllSubjectsResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllSubjectsResponseModelToJson(this);
}

@JsonSerializable()
class AllSubjectsResponseModelResult {
  const AllSubjectsResponseModelResult([this.id = '', this.name = '']);

  final String id;
  final String name;

  factory AllSubjectsResponseModelResult.fromJson(Map<String, Object?> json) =>
      _$AllSubjectsResponseModelResultFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllSubjectsResponseModelResultToJson(this);
}