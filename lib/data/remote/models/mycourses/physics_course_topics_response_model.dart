import 'package:freezed_annotation/freezed_annotation.dart';

part 'physics_course_topics_response_model.g.dart';

@JsonSerializable()
class PhysicsCourseTopicsResponseModel {
  const PhysicsCourseTopicsResponseModel(
      [this.status = false,
      this.responseMessage = '',
      this.physicsCourseTopicsResponseModelResult = const []]);

  final bool status;

  @JsonKey(name: 'response_message')
  final String responseMessage;

  @JsonKey(name: 'result')
  final List<PhysicsCourseTopicsResponseModelResult>
      physicsCourseTopicsResponseModelResult;

  factory PhysicsCourseTopicsResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$PhysicsCourseTopicsResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PhysicsCourseTopicsResponseModelToJson(this);
}

@JsonSerializable()
class PhysicsCourseTopicsResponseModelResult {
  const PhysicsCourseTopicsResponseModelResult([this.id = '', this.name = '']);

  final String id;
  final String name;
  factory PhysicsCourseTopicsResponseModelResult.fromJson(
          Map<String, Object?> json) =>
      _$PhysicsCourseTopicsResponseModelResultFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$PhysicsCourseTopicsResponseModelResultToJson(this);
}
