import 'package:flutter/material.dart';
import 'package:tpstreams_player_sdk/tpstreams_player.dart';

class TPStreamRecordedMobilePlayer extends StatefulWidget {
  const TPStreamRecordedMobilePlayer(
      {super.key, required this.accestID, required this.accessToken});

  final String accestID, accessToken;

  @override
  _TPStreamRecordedMobilePlayerState createState() =>
      _TPStreamRecordedMobilePlayerState();
}

class _TPStreamRecordedMobilePlayerState
    extends State<TPStreamRecordedMobilePlayer> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      widget.accessToken.isNotEmpty && widget.accestID.isNotEmpty
          ? TPStreamPlayer(
              assetId: widget.accestID, accessToken: widget.accessToken)
          : const Text("waiting...")
    ]);
  }
}
