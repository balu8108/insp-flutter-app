import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/apiservices/models/feedback/all_student_feedback_response_model.dart';

part 'create_student_feedback_response_model.g.dart';

@JsonSerializable()
class CreateStudentFeedbackResponseModel {
  const CreateStudentFeedbackResponseModel(
      {required this.message, required this.data});

  final String message;
  @JsonKey(name: 'data')
  final List<FeedbackModel> data;

  factory CreateStudentFeedbackResponseModel.fromJson(
          Map<String, Object?> json) =>
      _$CreateStudentFeedbackResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$CreateStudentFeedbackResponseModelToJson(this);
}
