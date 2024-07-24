import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_topic_for_chapter_request_model.g.dart';

@JsonSerializable()
class AllTopicsForChapterRequestModel {
  const AllTopicsForChapterRequestModel(
      {required this.secret_key, required this.chapter_id});

  final String secret_key;
  final String chapter_id;
  factory AllTopicsForChapterRequestModel.fromJson(Map<String, Object?> json) =>
      _$AllTopicsForChapterRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$AllTopicsForChapterRequestModelToJson(this);
}
