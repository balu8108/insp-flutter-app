import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_topic_response_model.g.dart';

@JsonSerializable()
class RatingTopicResponseModel {
  const RatingTopicResponseModel({required this.status, required this.data});

  final bool status;
  final String data;
  factory RatingTopicResponseModel.fromJson(Map<String, Object?> json) =>
      _$RatingTopicResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RatingTopicResponseModelToJson(this);
}
