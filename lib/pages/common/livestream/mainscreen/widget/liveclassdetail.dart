import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/utils/capitalize.dart';
import 'package:inspflutterfrontend/utils/format_time.dart';
import 'package:inspflutterfrontend/widget/popups/uploadLiveclassFile/upload_liveclass_file.dart';
import 'package:inspflutterfrontend/utils/file_box_component.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';

class LiveClassDetail extends StatefulWidget {
  const LiveClassDetail({super.key});

  @override
  State<LiveClassDetail> createState() => _LiveClassDetailState();
}

class _LiveClassDetailState extends State<LiveClassDetail> {
  bool isPopupOpen = false;

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
                return StoreConnector<AppState, ChatWidgetAppState>(
                    converter: (store) => store.state.chatWidgetAppState,
                    builder: (context, ChatWidgetAppState state) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 9,
                                      child: INSPHeading('Live Session')),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                capitalizeFirstLetter(state
                                    .previewData.liveClassRoomDetail.topicName),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFF2C3329),
                                  height: 1.25,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${formatTime(state.previewData.scheduledStartTime)} - ${formatTime(state.previewData.scheduledEndTime)}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(44, 51, 41, 0.47),
                                  height: 1.75,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                    if (isTeacher)
                                      UploadFilePopup(
                                          roomId: state.previewData.roomId)
                                  ]),
                              const SizedBox(height: 10),
                              FileBoxComponent(
                                data: state.previewDataFiles,
                                type: "live",
                                scrollDirection: "vertical",
                                maxHeight: 60,
                                isTeacher: isTeacher,
                              )
                            ]));
              }
            }));
  }
}
