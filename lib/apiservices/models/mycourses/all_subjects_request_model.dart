import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_subjects_request_model.g.dart';

@JsonSerializable()
class AllSubjectsRequestModel {
  const AllSubjectsRequestModel({required this.secret_key});

  final String secret_key;

  factory AllSubjectsRequestModel.fromJson(Map<String, Object?> json) =>
      _$AllSubjectsRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllSubjectsRequestModelToJson(this);
}
