import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inspflutterfrontend/apiservices/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';
part 'liveclass_preview_response_model.g.dart';

@JsonSerializable()
class LiveClassPreviewResponseModel {
  const LiveClassPreviewResponseModel({required this.data});

  final LecturesDetailResponseModelData data;

  factory LiveClassPreviewResponseModel.fromJson(Map<String, Object?> json) =>
      _$LiveClassPreviewResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LiveClassPreviewResponseModelToJson(this);
}
