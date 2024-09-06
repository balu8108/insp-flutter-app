import 'package:freezed_annotation/freezed_annotation.dart';

part 'timetable_response_model.g.dart';

@JsonSerializable()
class TimeTableResponseDataModel {
  const TimeTableResponseDataModel({this.message = '', this.data = const []});

  final String message;
  @JsonKey(name: 'data')
  final List<TimeTableDataModel> data;

  factory TimeTableResponseDataModel.fromJson(Map<String, Object?> json) =>
      _$TimeTableResponseDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TimeTableResponseDataModelToJson(this);
}

@JsonSerializable()
class TimeTableDataModel {
  const TimeTableDataModel([
    this.id = 0,
    this.url = "",
    this.createdAt = "",
    this.updatedAt = "",
  ]);

  final int id;
  final String url, createdAt, updatedAt;

  factory TimeTableDataModel.fromJson(Map<String, Object?> json) =>
      _$TimeTableDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TimeTableDataModelToJson(this);
}
