import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/preview/widget/joined_peer_detail.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/preview_data_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/capitalize.dart';
import 'package:insp/utils/format_time.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:toastification/toastification.dart';

class LiveCLassPreviowlWidget extends StatelessWidget {
  final String roomId;

  const LiveCLassPreviowlWidget({
    super.key,
    required this.roomId,
  });

  @override
  Widget build(BuildContext context) {
    bool isTeacher = isTeacherLogin(context);
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(getPreviewClassData(context, roomId));
    void navigateToRoomScreen(String roomId) {
      store.dispatch(navigateToRoom(context, roomId));
    }

    void copyTextToClipboard(String textToCopy) {
      Clipboard.setData(ClipboardData(text: textToCopy));
      toastification.show(
        context: context, // optional if you use ToastificationWrapper
        type: ToastificationType.success,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 3),
        title: const Text('Text copied to clipboard!'),
        alignment: Alignment.topRight,
      );
    }

    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: StoreConnector<AppState, PreviewDataAppState>(
            converter: (store) => store.state.previewDataAppState,
            builder: (context, PreviewDataAppState state) =>
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 9, child: INSPHeading('Live Session')),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 5,
                          child: Text(
                            capitalizeFirstLetter(state
                                .previewData.liveClassRoomDetail.topicName),
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Color(0xFF2C3329),
                              height: 1.25,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )),
                      const SizedBox(width: 5),
                      Text(
                        '${formatTime(state.previewData.scheduledStartTime)} - ${formatTime(state.previewData.scheduledEndTime)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF2C3329),
                          height: 1.25,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    state.previewData.mentorName,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color.fromRGBO(44, 51, 41, 0.47),
                      height: 1.75,
                    ),
                  ),
                  const SizedBox(height: 40),
                  if (isTeacher)
                    Row(
                      children: [
                        const Icon(Icons.link, size: 20),
                        const SizedBox(width: 5),
                        MouseRegion(
                            cursor: SystemMouseCursors
                                .click, // Change cursor to pointer
                            child: GestureDetector(
                                onTap: () => copyTextToClipboard(state
                                        .previewData
                                        .liveClassRoomRecordings
                                        .isNotEmpty
                                    ? state.previewData
                                        .liveClassRoomRecordings[0].rtmpUrl
                                    : ''),
                                child: Text(
                                  state.previewData.liveClassRoomRecordings
                                          .isNotEmpty
                                      ? state.previewData
                                          .liveClassRoomRecordings[0].rtmpUrl
                                      : '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color.fromRGBO(44, 51, 41, 0.47),
                                    height: 1.25,
                                  ),
                                )))
                      ],
                    ),
                  if (isTeacher) const SizedBox(height: 5),
                  if (isTeacher)
                    Row(
                      children: [
                        const Icon(
                          Icons.key,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        MouseRegion(
                            cursor: SystemMouseCursors
                                .click, // Change cursor to pointer
                            child: GestureDetector(
                                onTap: () => copyTextToClipboard(state
                                        .previewData
                                        .liveClassRoomRecordings
                                        .isNotEmpty
                                    ? state.previewData
                                        .liveClassRoomRecordings[0].streamKey
                                    : ''),
                                child: Text(
                                  state.previewData.liveClassRoomRecordings
                                          .isNotEmpty
                                      ? state.previewData
                                          .liveClassRoomRecordings[0].streamKey
                                      : '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color.fromRGBO(44, 51, 41, 0.47),
                                    height: 1.25,
                                  ),
                                )))
                      ],
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
                    state.previewData.liveClassRoomDetail.description,
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
                  state.previewData.liveClassRoomDetail.agenda
                          .split("\r\n")
                          .isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: state.previewData.liveClassRoomDetail.agenda
                              .split("\r\n")
                              .take(4)
                              .map<Widget>(
                                (agenda) => Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 7,
                                        height: 7,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[400],
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      Text(
                                        agenda,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(44, 51, 41, 0.47),
                                          height: 1.75,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                              .toList(),
                        )
                      : const Text(
                          'No Data',
                          style: TextStyle(
                            color: Color.fromRGBO(44, 51, 41, 0.47),
                            fontSize: 12,
                          ),
                        ),
                  Column(
                    children: [
                      const JoinedPeerWidget(),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        height: 39,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                                const Color(0xFF3C8DBC)),
                            foregroundColor: WidgetStateProperty.all(
                                const Color(0xFF3C8DBC)),
                            shape:
                                WidgetStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust border radius as needed
                              ),
                            ),
                            padding: WidgetStateProperty.all(
                                const EdgeInsets.symmetric(vertical: 12.0)),
                          ),
                          onPressed: () {
                            navigateToRoomScreen(state.previewData.roomId);
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
                ])));
  }
}
