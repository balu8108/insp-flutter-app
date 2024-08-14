import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_student_feedback_request_model.g.dart';

@JsonSerializable()
class AllStudentFeedbackRequestModel {
  const AllStudentFeedbackRequestModel(
      {required this.limit, required this.page, required this.search});

  final int limit, page;
  final String search;
  factory AllStudentFeedbackRequestModel.fromJson(Map<String, Object?> json) =>
      _$AllStudentFeedbackRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllStudentFeedbackRequestModelToJson(this);
}
