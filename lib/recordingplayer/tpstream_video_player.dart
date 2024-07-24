import 'package:flutter/material.dart';
import 'package:tpstreams_player_sdk/tpstreams_player_sdk.dart';

class TPStreamVideoPlayerWidget extends StatelessWidget {
  TPStreamVideoPlayerWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 600,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: const TPStreamPlayer(
            assetId: 'KE7nFqKrXY6',
            accessToken:
                '69e1a7f824dfe1fecdd29133bf44eea910e96257a64624a54cea315e7ffe05e5'));
  }
}
