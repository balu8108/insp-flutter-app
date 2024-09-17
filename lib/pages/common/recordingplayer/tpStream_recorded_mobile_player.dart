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
    print(widget.accestID);
    print(widget.accessToken);
    return Container(
        height: 300,
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
          color: Color.fromRGBO(232, 242, 249, 1),
        ),
        child: widget.accessToken.isNotEmpty && widget.accestID.isNotEmpty
            ? TPStreamPlayer(
                assetId: widget.accestID, accessToken: widget.accessToken)
            : const Text("waiting..."));
  }
}
