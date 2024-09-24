import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/recordingplayer/webview_macos.dart';
import 'package:insp/pages/common/recordingplayer/webview_window.dart';
import 'package:insp/pages/teacher/soloclassrecording/redux/soloclass_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:universal_platform/universal_platform.dart';

class SoloclassRecording extends StatelessWidget {
  const SoloclassRecording({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, SoloClassDetailDataAppState>(
        converter: (store) => store.state.soloClassDetailDataAppState,
        builder: (context, SoloClassDetailDataAppState state) {
          return Container(
              height: MediaQuery.of(context).size.height - 150 < 600
                  ? MediaQuery.of(context).size.height - 150
                  : 600,
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                color: Color.fromRGBO(232, 242, 249, 1),
              ),
              child: state.videoResponse.playback_url.isNotEmpty
                  ? UniversalPlatform.isWindows || UniversalPlatform.isAndroid
                      ? WebviewUniversalWindow(
                          url: state.videoResponse.playback_url,
                          streamStatus: "")
                      : WebviewMacOs(
                          url: state.videoResponse.playback_url,
                          streamStatus: "",
                        )
                  : const Text("waiting..."));
        });
  }
}
