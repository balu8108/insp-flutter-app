import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/recordingplayer/tpStream_recorded_player.dart';
import 'package:insp/pages/common/recordingplayer/liveclasses/recording_detail_widget.dart';
import 'package:insp/pages/common/recordingplayer/recording_player_redux.dart';
import 'package:insp/redux/AppState.dart';

class RecordingPlayerDesktopScreen extends StatefulWidget {
  const RecordingPlayerDesktopScreen({super.key, required this.classId});

  final String classId;

  @override
  _RecordingPlayerDesktopScreenState createState() =>
      _RecordingPlayerDesktopScreenState();
}

class _RecordingPlayerDesktopScreenState
    extends State<RecordingPlayerDesktopScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _onPressedRecording(BuildContext context, String tpStreamId) {
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
                  flex: 7, // Adjust based on full-screen state
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Expanded(
                          child: TPStreamRecordedPlayer(
                            videourl: state.videoResponse.playback_url,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 3,
                  child: SingleChildScrollView(
                    child: RecordingDetailWidget(
                      recordingPlayerDetail: state.recordedVideoData,
                      onViewDetailsClicked: _onPressedRecording,
                      onUpdate: onUpdate,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
