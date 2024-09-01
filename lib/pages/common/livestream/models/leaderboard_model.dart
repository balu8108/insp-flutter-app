import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_model.g.dart';

@JsonSerializable()
class LeaderboardModel {
  const LeaderboardModel(
      {this.combinedResponseTime = 0,
      this.correctAnswers = 0,
      this.peerDetails = const PeerDetailLeaderboard(id: '', name: '')});

  final int combinedResponseTime, correctAnswers;
  final PeerDetailLeaderboard peerDetails;

  factory LeaderboardModel.fromJson(Map<String, Object?> json) =>
      _$LeaderboardModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LeaderboardModelToJson(this);
}

@JsonSerializable()
class PeerDetailLeaderboard {
  const PeerDetailLeaderboard({this.id = '', this.name = '', this.email = ''});
  final String id, name, email;

  factory PeerDetailLeaderboard.fromJson(Map<String, Object?> json) =>
      _$PeerDetailLeaderboardFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PeerDetailLeaderboardToJson(this);
}
