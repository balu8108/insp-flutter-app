import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';

Widget LectureLeaderboardCard(
    {required List<LeaderBoards> leaderboardDetails, required int questionNo}) {
  return Container(
    height: 400,
    margin: const EdgeInsets.only(right: 16),
    child: leaderboardDetails.isNotEmpty
        ? Scrollbar(
            child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: leaderboardDetails.length,
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            '${(index + 1).toString()}. ${leaderboardDetails[index].peerName}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromRGBO(44, 51, 41, 0.47),
                            )),
                        Text(
                            '${leaderboardDetails[index].correctAnswers} / ${questionNo}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromRGBO(44, 51, 41, 0.47),
                            )),
                        Text(
                            '${leaderboardDetails[index].combinedResponseTime} sec',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                              color: Color.fromRGBO(44, 51, 41, 0.47),
                            ))
                      ]));
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 1,
              );
            },
          ))
        : const Padding(
            padding: EdgeInsets.only(top: 16),
            child: Text(
              'No Leaderboard for this topic.',
              style: TextStyle(fontSize: 12),
            ),
          ),
  );
}
