import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_assignment_response_model.g.dart';

@JsonSerializable()
class DeleteAssignmentResponseModel {
  const DeleteAssignmentResponseModel({this.message = ''});

  final String message;

  factory DeleteAssignmentResponseModel.fromJson(Map<String, Object?> json) =>
      _$DeleteAssignmentResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DeleteAssignmentResponseModelToJson(this);
}
