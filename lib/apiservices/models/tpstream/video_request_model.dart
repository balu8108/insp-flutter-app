import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_request_model.g.dart';

@JsonSerializable()
class VideoRequestModel {
  const VideoRequestModel(
      {this.expires_after_first_usage = false, this.annotations = const []});

  final bool expires_after_first_usage;
  final List<Annotation> annotations;

  factory VideoRequestModel.fromJson(Map<String, Object?> json) =>
      _$VideoRequestModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VideoRequestModelToJson(this);
}

@JsonSerializable()
class Annotation {
  const Annotation({
    required this.type,
    required this.text,
    required this.opacity,
    required this.color,
    required this.size,
  });

  final String type;
  final String text;
  final double opacity;
  final String color;
  final int size;

  factory Annotation.fromJson(Map<String, Object?> json) =>
      _$AnnotationFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotationToJson(this);
}

@JsonSerializable()
class StaticAnnotation extends Annotation {
  const StaticAnnotation({
    required super.type,
    required super.text,
    required super.opacity,
    required super.color,
    required super.size,
    required this.x,
    required this.y,
  });

  final int x;
  final int y;

  factory StaticAnnotation.fromJson(Map<String, Object?> json) =>
      _$StaticAnnotationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StaticAnnotationToJson(this);
}

@JsonSerializable()
class DynamicAnnotation extends Annotation {
  const DynamicAnnotation({
    required super.type,
    required super.text,
    required super.opacity,
    required super.color,
    required super.size,
    required this.interval,
    required this.skip,
  });

  final int interval;
  final int skip;

  factory DynamicAnnotation.fromJson(Map<String, Object?> json) =>
      _$DynamicAnnotationFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$DynamicAnnotationToJson(this);
}
