import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/recordingplayer/soloclasses/solo_recording_detail_widget.dart';
import 'package:insp/pages/common/recordingplayer/tpStream_recorded_mobile_player.dart';
import 'package:insp/pages/common/recordingplayer/recording_player_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/widget/mobileAppbar/mobileAppbar.dart';

class SoloRecordingPlayerScreen extends StatefulWidget {
  const SoloRecordingPlayerScreen({super.key, required this.classId});

  final String classId;

  @override
  _SoloRecordingPlayerScreenState createState() =>
      _SoloRecordingPlayerScreenState();
}

class _SoloRecordingPlayerScreenState extends State<SoloRecordingPlayerScreen> {
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
    store.dispatch(getSoloRecordedVideoData(context, widget.classId));
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(getSoloRecordedVideoData(context, widget.classId));
    return Scaffold(
      appBar: const Mobileappbar(),
      body: StoreConnector<AppState, RecordingPlayerAppState>(
        converter: (store) => store.state.recordingPlayerAppState,
        builder: (context, RecordingPlayerAppState state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TPStreamRecordedMobilePlayer(
                    accestID: state.accestId,
                    accessToken: state.videoResponse.code),
                const SizedBox(height: 16),
                SoloRecordingDetailWidget(
                  recordingSoloPlayerDetail: state.soloRecordedVideoData,
                  onViewDetailsClicked: onPressedRecording,
                  onUpdate: onUpdate,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
