import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_lecture_no_request_model.g.dart';

@JsonSerializable()
class GetLectureNoRequestModel {
  const GetLectureNoRequestModel(
      {required this.classLevel,
      required this.classType,
      required this.subjectName,
      required this.isSoloClass});

  final String classLevel, classType, subjectName;
  final bool isSoloClass;

  factory GetLectureNoRequestModel.fromJson(Map<String, Object?> json) =>
      _$GetLectureNoRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetLectureNoRequestModelToJson(this);
}
