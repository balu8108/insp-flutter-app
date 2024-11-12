import 'dart:async';
import 'dart:math';

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
  double x = 0;
  double y = 0;

  @override
  void initState() {
    super.initState();
    initUserData();
    Timer.periodic(const Duration(seconds: 5), (timer) {

      setState(() {
        x = Random().nextDouble();
        y = Random().nextDouble();
      });

    });
  }

  Future<void> initUserData() async {
    userData = await getUserData();
    setState(() {
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
                  Positioned(
                    left: x*MediaQuery.of(context).size.width*0.7,
                    top: y*MediaQuery.of(context).size.width*(9/16)*0.8,
                    child: Column(
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
                    ),
                  )
                ],
              )
          : const Text("waiting...")
    ]);
  }
}
