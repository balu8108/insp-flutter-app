import 'package:freezed_annotation/freezed_annotation.dart';

part 'physics_course_topics_request_model.g.dart';

@JsonSerializable()
class PhysicsCourseTopicsRequestModel {
  const PhysicsCourseTopicsRequestModel({required this.secret_key});

  final String secret_key;

  factory PhysicsCourseTopicsRequestModel.fromJson(Map<String, Object?> json) =>
      _$PhysicsCourseTopicsRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PhysicsCourseTopicsRequestModelToJson(this);
}
