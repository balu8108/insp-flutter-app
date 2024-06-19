import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_topics_for_subject_request_model.g.dart';

@JsonSerializable()
class AllTopicsForSubjectRequestModel {
  const AllTopicsForSubjectRequestModel(
      {required this.secret_key, required this.subject_id});

  final String secret_key;
  final String subject_id;
  factory AllTopicsForSubjectRequestModel.fromJson(Map<String, Object?> json) =>
      _$AllTopicsForSubjectRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AllTopicsForSubjectRequestModelToJson(this);
}
