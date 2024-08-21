import 'package:freezed_annotation/freezed_annotation.dart';

part 'event_data_model.g.dart';

@JsonSerializable()
class Event {
  final int id;
  final String title, classType, classLevel;
  final DateTime start, end;

  Event({
    required this.id,
    required this.title,
    required this.classType,
    required this.classLevel,
    required this.start,
    required this.end,
  });
  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
