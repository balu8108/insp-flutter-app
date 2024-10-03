import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/preview/widget/previewvideo.dart';
import 'package:insp/pages/common/livestream/widget/chat/tpstream_redux.dart';
import 'package:insp/pages/common/recordingplayer/webview_macos.dart';
import 'package:insp/pages/common/recordingplayer/webview_window.dart';
import 'package:insp/redux/AppState.dart';

class TPStreamVideoPlayer extends StatelessWidget {
  const TPStreamVideoPlayer({super.key});

  static void dispatch(BuildContext context, TPStreamAppState action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(getVideoUrlApi(context));
    return StoreConnector<AppState, TPStreamAppState>(
      converter: (store) => store.state.tpStreamAppState,
      builder: (context, TPStreamAppState state) {
        return Container(
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
                ? Platform.isWindows
                    ? WebviewUniversalWindow(
                        url: state.videoResponse.playback_url,
                        streamStatus: state.streamStatusChangeTo)
                    : Platform.isMacOS
                        ? WebviewMacOs(
                            url: state.videoResponse.playback_url,
                            streamStatus: state.streamStatusChangeTo)
                        : const Text("Platform not supported")
                : const PreviewVideo(name: "waiting..."));
      },
    );
  }
}
