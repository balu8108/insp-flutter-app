import 'package:flutter/material.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:tpstreams_player_sdk/tpstreams_player.dart';

import '../../../apiservices/models/login/login_response_model.dart';

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
  late LoginResponseModelResult userData;

  @override
  void initState() {
    super.initState();
    initUserData();
  }

  Future<void> initUserData() async {
    setState(() async {
      userData = await getUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      widget.accessToken.isNotEmpty && widget.accestID.isNotEmpty
          ? Stack(
              alignment: Alignment.center,
              children: [
                TPStreamPlayer(
                    assetId: widget.accestID, accessToken: widget.accessToken),
                Column(
                  children: [
                    Text(
                      userData.email,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    Text(
                      userData.mobile,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                  ],
                )
              ],
            )
          : const Text("waiting...")
    ]);
  }
}
