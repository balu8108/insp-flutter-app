import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/mycourses/all_lectures_for_course_response_model.dart';
import 'package:inspflutterfrontend/utils/file_box_component.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';

class LiveClassDetail extends StatelessWidget {
  // final Function(BuildContext, RecordingPlayerCard) onViewDetailsClicked;

  LiveClassDetail();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(12.0),
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
                        height: 5,
                      ),
                      Text(
                        "Alternating current",
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF2C3329),
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "10:00 AM -11:00 PM",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(44, 51, 41, 0.47),
                          height: 1.75,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Files',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xFF2C3329),
                              height: 1.25,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.tab),
                            iconSize: 14.0,
                            onPressed: () {
                              print("click");
                              // widget.deleteFeedback(context, data.id);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      FileBoxComponent(
                        data: const [
                          LiveClassRoomFile(),
                          LiveClassRoomFile(),
                          LiveClassRoomFile()
                        ],
                        type: "live",
                        scrollDirection: "vertical",
                        maxHeight: 60,
                        isTeacher: isTeacher,
                      )
                    ]);
              }
            }));
  }
}
