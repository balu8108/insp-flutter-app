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
  bool isFullScreen = false;

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
            padding: isFullScreen
                ? const EdgeInsets.all(0.0)
                : const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: isFullScreen
                      ? 10
                      : 7, // Adjust based on full-screen state
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      children: [
                        Expanded(
                          child: TPStreamRecordedPlayer(
                            videourl: state.videoResponse.playback_url,
                          ),
                        ),
                        _buildBottomBar(), // Refactored bottom bar
                      ],
                    ),
                  ),
                ),
                if (!isFullScreen) const SizedBox(width: 16),
                if (!isFullScreen)
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

  // Refactored bottom bar
  Widget _buildBottomBar() {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.only(right: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        color: Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.end, // Align the fullscreen button to the right
        children: [
          Tooltip(
            message: isFullScreen ? "Exit FullScreen" : "FullScreen",
            child: IconButton(
              icon: isFullScreen
                  ? const Icon(Icons.fullscreen_exit)
                  : const Icon(Icons.fullscreen),
              iconSize: 24.0,
              onPressed: () {
                setState(() {
                  isFullScreen = !isFullScreen;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
