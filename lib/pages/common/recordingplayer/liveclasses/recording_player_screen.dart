import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/recordingplayer/tpStream_recorded_mobile_player.dart';
import 'package:insp/pages/common/recordingplayer/liveclasses/recording_detail_widget.dart';
import 'package:insp/pages/common/recordingplayer/recording_player_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/socket/mainsocket.dart';

import 'package:insp/widget/mobileAppbar/mobileAppbar.dart';

class RecordingPlayerScreen extends StatefulWidget {
  const RecordingPlayerScreen({super.key, required this.classId});

  final String classId;

  @override
  _RecordingPlayerScreenState createState() => _RecordingPlayerScreenState();
}

class _RecordingPlayerScreenState extends State<RecordingPlayerScreen> {
  @override
  void initState() {
    super.initState();
  }

  void onPressedRecording(BuildContext context, String tpStreamId) {
    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(getRecordedVideoUrlApi(context, tpStreamId));
  }

  void onUpdate() {
    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(getLiveRecordedVideoData(context, widget.classId));
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(getLiveRecordedVideoData(context, widget.classId));

    Future<bool> onBackPressed() async {
      leaveRoomHandler(StoreProvider.of<AppState>(context));
      return true; // Return true to allow the back navigation
    }

    return WillPopScope(
        onWillPop: onBackPressed,
        child: Scaffold(
            appBar: const Mobileappbar(),
            body: StoreConnector<AppState, RecordingPlayerAppState>(
                converter: (store) => store.state.recordingPlayerAppState,
                builder: (context, RecordingPlayerAppState state) {
                  return SingleChildScrollView(
                      child: Column(children: [
                    TPStreamRecordedMobilePlayer(
                        accestID: state.accestId,
                        accessToken: state.videoResponse.code),
                    const SizedBox(height: 16),
                    RecordingDetailWidget(
                      recordingPlayerDetail: state.recordedVideoData,
                      onViewDetailsClicked: onPressedRecording,
                      onUpdate: onUpdate,
                    ),
                  ]));
                })));
  }
}
