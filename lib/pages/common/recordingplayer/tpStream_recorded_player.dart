import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insp/pages/common/livestream/preview/widget/previewvideo.dart';
import 'package:insp/pages/common/recordingplayer/webview_macos.dart';
import 'package:insp/pages/common/recordingplayer/webview_window.dart';

class TPStreamRecordedPlayer extends StatefulWidget {
  const TPStreamRecordedPlayer({super.key, required this.videourl});

  final String videourl;

  @override
  _TPStreamRecordedPlayerState createState() => _TPStreamRecordedPlayerState();
}

class _TPStreamRecordedPlayerState extends State<TPStreamRecordedPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Color.fromRGBO(232, 242, 249, 1),
      ),
      child: widget.videourl.isNotEmpty
          ? Platform.isWindows
              ? WebviewUniversalWindow(url: widget.videourl, streamStatus: '')
              : Platform.isMacOS
                  ? WebviewMacOs(url: widget.videourl, streamStatus: '')
                  : const Text("Platform not supported")
          : const PreviewVideo(name: "waiting..."),
    );
  }
}
