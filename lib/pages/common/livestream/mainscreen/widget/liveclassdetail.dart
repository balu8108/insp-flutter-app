import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/preview_data_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/capitalize.dart';
import 'package:insp/utils/format_time.dart';
import 'package:insp/widget/popups/uploadLiveclassFile/upload_liveclass_file.dart';
import 'package:insp/utils/file_box_component.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/heading/insp_heading.dart';

class LiveClassDetail extends StatefulWidget {
  const LiveClassDetail({super.key});

  @override
  State<LiveClassDetail> createState() => _LiveClassDetailState();
}

class _LiveClassDetailState extends State<LiveClassDetail> {
  bool isPopupOpen = false;

  @override
  Widget build(BuildContext context) {
    bool isTeacher = isTeacherLogin(context);
    return Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: StoreConnector<AppState, PreviewDataAppState>(
            converter: (store) => store.state.previewDataAppState,
            builder: (context, PreviewDataAppState state) =>
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 9, child: INSPHeading('Live Session')),
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
                        ]))));
  }
}
