import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/upcomingclasses/lecture_detail_by_roomid_response_model.dart';
import 'package:inspflutterfrontend/main.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/recording_player_screen.dart';

Widget LectureRecordingCardWidget(
    {required List<LiveClassRoomRecordings> liveClassRoomRecordings,
    required String classId,
    required String topicName,
    required mentorName,
    required description,
    required files,
    required agenda}) {
  final ScrollController scrollController = ScrollController();

  return Container(
      height: 100,
      margin: const EdgeInsets.only(right: 16),
      child: liveClassRoomRecordings.isNotEmpty
          ? Scrollbar(
              controller: scrollController,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                itemCount: liveClassRoomRecordings.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MainScaffold(
                                    content: RecordingPlayerScreen.getScreen(
                                        "live", classId))));
                      },
                      child: MouseRegion(
                          cursor: SystemMouseCursors.click,
                          child: Container(
                              width: 160,
                              margin: const EdgeInsets.only(right: 16),
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Image.network(
                                    "https://insp-test-local-bucket.s3.ap-south-1.amazonaws.com/image1.png",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                  const Positioned(
                                    bottom: 8,
                                    left: 8,
                                    child: Text(
                                      'Recording-${1}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.transparent,
                                          Colors.black.withOpacity(0.6),
                                        ],
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  const Icon(
                                    Icons.play_circle_fill,
                                    size: 24,
                                    color: Colors.black,
                                  ),
                                ],
                              ))));
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            )
          : const Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text(
                'No data available for this topic.',
                style: TextStyle(fontSize: 12),
              ),
            ));
  // Assuming a gap of 16px between items
}
