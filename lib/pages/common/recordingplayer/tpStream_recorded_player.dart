import 'package:flutter/material.dart';
import 'package:insp/pages/common/recordingplayer/webview_macos.dart';
import 'package:insp/pages/common/recordingplayer/webview_window.dart';
import 'package:universal_platform/universal_platform.dart';

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
      height: MediaQuery.of(context).size.height - 150 < 600
          ? MediaQuery.of(context).size.height - 150
          : 600,
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
        color: Color.fromRGBO(232, 242, 249, 1),
      ),
      child: widget.videourl.isNotEmpty
          ? UniversalPlatform.isWindows
              ? WebviewUniversalWindow(url: widget.videourl, streamStatus: '')
              : UniversalPlatform.isMacOS
                  ? WebviewMacOs(url: widget.videourl, streamStatus: '')
                  : const Text("Platform not supported")
          : const Text("Waiting..."),
    );
  }
}
