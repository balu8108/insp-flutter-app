import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_topics_for_subject_response_model.g.dart';

@JsonSerializable()
class AllTopicsForSubjectResponseModel {
  const AllTopicsForSubjectResponseModel(
      [this.status = false,
      this.responseMessage = '',
      this.allTopicsForSubjectResponseModelResult = const []]);

  final bool status;

  @JsonKey(name: 'response_message')
  final String responseMessage;

  @JsonKey(name: 'result')
  final List<AllTopicsForSubjectResponseModelResult>
      allTopicsForSubjectResponseModelResult;

  factory AllTopicsForSubjectResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$AllTopicsForSubjectResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AllTopicsForSubjectResponseModelToJson(this);
}

@JsonSerializable()
class AllTopicsForSubjectResponseModelResult {
  const AllTopicsForSubjectResponseModelResult([this.id = '', this.name = '']);

  final String id;
  final String name;
  factory AllTopicsForSubjectResponseModelResult.fromJson(
          Map<String, Object?> json) =>
      _$AllTopicsForSubjectResponseModelResultFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AllTopicsForSubjectResponseModelResultToJson(this);
}
