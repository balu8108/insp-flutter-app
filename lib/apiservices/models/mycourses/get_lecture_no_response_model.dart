import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_lecture_no_response_model.g.dart';

@JsonSerializable()
class GetLectureNoResponseModel {
  const GetLectureNoResponseModel({required this.message, required this.data});

  final String message;
  final int data;

  factory GetLectureNoResponseModel.fromJson(Map<String, Object?> json) =>
      _$GetLectureNoResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$GetLectureNoResponseModelToJson(this);
}
