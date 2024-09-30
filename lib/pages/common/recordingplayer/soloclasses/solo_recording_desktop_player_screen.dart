import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/recordingplayer/soloclasses/solo_recording_detail_widget.dart';
import 'package:insp/pages/common/recordingplayer/tpStream_recorded_player.dart';
import 'package:insp/pages/common/recordingplayer/recording_player_redux.dart';
import 'package:insp/redux/AppState.dart';

class SoloRecordingDesktopPlayerScreen extends StatefulWidget {
  const SoloRecordingDesktopPlayerScreen({super.key, required this.classId});

  final String classId;

  @override
  _SoloRecordingDesktopPlayerScreenState createState() =>
      _SoloRecordingDesktopPlayerScreenState();
}

class _SoloRecordingDesktopPlayerScreenState
    extends State<SoloRecordingDesktopPlayerScreen> {
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
    return Container(
        padding: const EdgeInsets.all(10.0),
        color: Colors.white,
        child: StoreConnector<AppState, RecordingPlayerAppState>(
            converter: (store) => store.state.recordingPlayerAppState,
            builder: (context, RecordingPlayerAppState state) {
              return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 7,
                        child: TPStreamRecordedPlayer(
                            videourl: state.videoResponse.playback_url),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                          flex: 3,
                          child: SingleChildScrollView(
                            child: SoloRecordingDetailWidget(
                              recordingSoloPlayerDetail:
                                  state.soloRecordedVideoData,
                              onViewDetailsClicked: onPressedRecording,
                              onUpdate: onUpdate,
                            ),
                          )),
                    ],
                  ));
            }));
  }
}
