import 'package:freezed_annotation/freezed_annotation.dart';

part 'insp_card_model.g.dart';

@JsonSerializable()
class INSPCardModel {
  const INSPCardModel(this.id, this.name, this.status,
      this.description);

  final String id, name, status, description;

  factory INSPCardModel.fromJson(Map<String, Object?> json) =>
      _$INSPCardModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$INSPCardModelToJson(this);
}