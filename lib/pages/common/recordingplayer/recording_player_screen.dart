import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/tpStream_recorded_player.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/recording_detail_widget.dart';
import 'package:inspflutterfrontend/pages/common/recordingplayer/recording_player_redux.dart';

import '../../../base/base.dart';

class RecordingPlayerScreen extends StatelessWidget {
  const RecordingPlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, getRecordedVideoData(context));
    void onPressedRecording(BuildContext context, String tpStreamId) {
      dispatch(context, getRecordedVideoUrlApi(context, tpStreamId));
    }

    return Scaffold(
        appBar: Navbar(),
        body: StoreConnector<RecordingPlayerAppState, RecordingPlayerAppState>(
          converter: (store) => store.state,
          builder: (context, RecordingPlayerAppState state) => Container(
              padding: const EdgeInsets.all(10.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 7,
                          child: TPStreamRecordedPlayer(
                              videourl: state.videoResponse.playback_url)),
                      const SizedBox(width: 16),
                      Expanded(
                          flex: 3,
                          child: RecordingDetailWidget(
                              recordingPlayerDetail: state.recordedVideoData,
                              onViewDetailsClicked: onPressedRecording))
                    ],
                  ),
                ),
              )),
        ));
  }

  static getScreen(String type, String classId) {
    return getBaseScreen<RecordingPlayerAppState, RecordingPlayerScreen>(
        recordingPlayerReducer,
        RecordingPlayerAppState(type: type, classId: classId),
        const RecordingPlayerScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<RecordingPlayerAppState>(context, action);
  }
}
