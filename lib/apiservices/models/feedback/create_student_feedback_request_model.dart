import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_student_feedback_request_model.g.dart';

@JsonSerializable()
class CreateStudentFeedbackRequestModel {
  const CreateStudentFeedbackRequestModel(
      {required this.feedback,
      required this.studentEmail,
      required this.studentName});

  final String feedback, studentEmail, studentName;

  factory CreateStudentFeedbackRequestModel.fromJson(
          Map<String, Object?> json) =>
      _$CreateStudentFeedbackRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$CreateStudentFeedbackRequestModelToJson(this);
}
