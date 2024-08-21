import 'package:freezed_annotation/freezed_annotation.dart';

part 'all_calendar_scheduled_data_model.g.dart';

@JsonSerializable()
class AllCalendarScheduledDataModel {
  const AllCalendarScheduledDataModel({this.data = const []});
  final List<CalendarModel> data;

  factory AllCalendarScheduledDataModel.fromJson(Map<String, Object?> json) =>
      _$AllCalendarScheduledDataModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AllCalendarScheduledDataModelToJson(this);
}

@JsonSerializable()
class CalendarModel {
  const CalendarModel([
    this.id = 0,
    this.title = "",
    this.classType = "",
    this.classLevel = "",
    this.start = "",
    this.end = "",
  ]);

  final int id;
  final String title, classType, classLevel, start, end;

  factory CalendarModel.fromJson(Map<String, Object?> json) =>
      _$CalendarModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CalendarModelToJson(this);
}
