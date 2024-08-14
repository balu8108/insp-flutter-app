import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_student_feedback_response_model.g.dart';

@JsonSerializable()
class AllStudentFeedbackResponseModel {
  const AllStudentFeedbackResponseModel(
      {required this.total,
      required this.page,
      required this.totalPages,
      required this.message,
      required this.data});

  final int total, page, totalPages;
  final String message;
  @JsonKey(name: 'data')
  final List<FeedbackModel> data;

  factory AllStudentFeedbackResponseModel.fromJson(Map<String, Object?> json) =>
      _$AllStudentFeedbackResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AllStudentFeedbackResponseModelToJson(this);
}

@JsonSerializable()
class FeedbackModel {
  const FeedbackModel(
      [this.id = 0,
      this.studentName = '',
      this.studentEmail = '',
      this.feedback = '',
      this.createdAt = '',
      this.updatedAt = '']);

  final int id;
  final String studentName, studentEmail, feedback;
  final String createdAt, updatedAt;

  factory FeedbackModel.fromJson(Map<String, Object?> json) =>
      _$FeedbackModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FeedbackModelToJson(this);
}
