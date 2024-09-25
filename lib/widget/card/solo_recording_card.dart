import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/soloclasses/soloclass_topicwise_details_response_model.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/common/recordingplayer/soloclasses/solo_recording_player_screen.dart';

Widget SoloRecordingCardWidget({
  required List<SoloClassRoomRecordings> soloClassRoomRecordings,
}) {
  final ScrollController scrollController = ScrollController();

  return Container(
      height: 100,
      margin: const EdgeInsets.only(right: 16),
      child: soloClassRoomRecordings.isNotEmpty
          ? Scrollbar(
              controller: scrollController,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                controller: scrollController,
                itemCount: soloClassRoomRecordings.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScaffold(
                                content: SoloRecordingPlayerScreen(
                                    classId: soloClassRoomRecordings[index]
                                        .soloClassRoomId
                                        .toString())),
                          ),
                          (route) => false,
                        );
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
                                    "https://insp-test-local-bucket.s3.ap-south-1.amazonaws.com/sXK51.png",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    left: 8,
                                    child: Text(
                                      'Recording-${index + 1}',
                                      style: const TextStyle(
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
                                    color: Colors.white,
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
