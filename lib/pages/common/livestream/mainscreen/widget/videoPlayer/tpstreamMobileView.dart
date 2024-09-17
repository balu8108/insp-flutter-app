import 'package:flutter/material.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/videoPlayer/actionButton.dart';
import 'package:tpstreams_player_sdk/tpstreams_player_sdk.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';

class TPStreamMobileView extends StatefulWidget {
  const TPStreamMobileView({super.key});

  @override
  _TPStreamMobileViewState createState() => _TPStreamMobileViewState();
}

class _TPStreamMobileViewState extends State<TPStreamMobileView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isTeacher = isTeacherLogin(context);
    return Column(
      children: [
        const TPStreamPlayer(
            assetId: "BCNarYX6j93",
            accessToken: "4d701dd8-500f-4cfc-ae86-3ce1fef6b140"),
        Container(
            height: 50,
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Color.fromRGBO(232, 242, 249, 1),
            ),
            child: ActionButtonWidget(isTeacher: isTeacher))
      ],
    );
  }
}
