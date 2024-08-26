// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaderboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaderboardModel _$LeaderboardModelFromJson(Map<String, dynamic> json) =>
    LeaderboardModel(
      combinedResponseTime:
          (json['combinedResponseTime'] as num?)?.toInt() ?? 0,
      correctAnswers: (json['correctAnswers'] as num?)?.toInt() ?? 0,
      peerDetails: json['peerDetails'] == null
          ? const PeerDetailLeaderboard(id: '', name: '')
          : PeerDetailLeaderboard.fromJson(
              json['peerDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeaderboardModelToJson(LeaderboardModel instance) =>
    <String, dynamic>{
      'combinedResponseTime': instance.combinedResponseTime,
      'correctAnswers': instance.correctAnswers,
      'peerDetails': instance.peerDetails,
    };

PeerDetailLeaderboard _$PeerDetailLeaderboardFromJson(
        Map<String, dynamic> json) =>
    PeerDetailLeaderboard(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$PeerDetailLeaderboardToJson(
        PeerDetailLeaderboard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
