import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/liveclass.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/peers_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/preview/widget/peer_list.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';

class LiveCLassPreviowlWidget extends StatelessWidget {
  final List<PeersDataModel> allPeers;
  // final Function(BuildContext, RecordingPlayerCard) onViewDetailsClicked;

  LiveCLassPreviowlWidget({
    required this.allPeers,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: FutureBuilder<bool>(
            future: isTeacherLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error loading data'));
              } else {
                bool isTeacher = snapshot.data ?? false;
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(flex: 9, child: INSPHeading('Live Session')),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Text",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF2C3329),
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "nitin",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(44, 51, 41, 0.47),
                          height: 1.75,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: Color(0xFF2C3329),
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "description",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(44, 51, 41, 0.47),
                          height: 1.75,
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Agenda',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF2C3329),
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // recordingPlayerDetail.agenda.split("\r\n").isNotEmpty
                      //     ? Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: recordingPlayerDetail.agenda
                      //             .split("\r\n")
                      //             .take(4)
                      //             .map<Widget>(
                      //               (agenda) => Padding(
                      //                 padding: const EdgeInsets.only(top: 4),
                      //                 child: Row(
                      //                   children: [
                      //                     Container(
                      //                       width: 7,
                      //                       height: 7,
                      //                       decoration: BoxDecoration(
                      //                         color: Colors.grey[400],
                      //                         borderRadius:
                      //                             BorderRadius.circular(100),
                      //                       ),
                      //                     ),
                      //                     const SizedBox(width: 6),
                      //                     Text(
                      //                       agenda,
                      //                       style: const TextStyle(
                      //                         fontSize: 12,
                      //                         color: Color.fromRGBO(
                      //                             44, 51, 41, 0.47),
                      //                         height: 1.75,
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //             )
                      //             .toList(),
                      //       )
                      //     : const Text(
                      //         'No Data',
                      //         style: TextStyle(
                      //           color: Color.fromRGBO(44, 51, 41, 0.47),
                      //           fontSize: 12,
                      //         ),
                      //       ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Mentors Joined Section
                                const Text(
                                  'Mentors Joined',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                PeerList(
                                  peers: allPeers
                                      .where((peer) => peer.isTeacher)
                                      .toList(),
                                  type: "Mentor",
                                  message: 'No mentors joined...',
                                ),
                                const SizedBox(height: 16),

                                // Students Joined Section
                                const Text(
                                  'Student joined',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                PeerList(
                                  peers: allPeers
                                      .where((peer) => !peer.isTeacher)
                                      .toList(),
                                  type: "Mentor",
                                  message: 'No students joined...',
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            height: 39,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF3C8DBC)),
                                foregroundColor: MaterialStateProperty.all(
                                    const Color(0xFF3C8DBC)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        8.0), // Adjust border radius as needed
                                  ),
                                ),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(vertical: 12.0)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        LiveClassScreen.getScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Join class",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ]);
              }
            }));
  }
}
