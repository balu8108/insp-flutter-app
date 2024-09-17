import 'package:flutter/material.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/videoPlayer/actionButton.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/videoPlayer/pollMobileView.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/videoPlayer/tpstreamMobile.dart';
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
        const TPStreamMobileVideoPlayer(),
        Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 16),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              color: Color.fromRGBO(232, 242, 249, 1),
            ),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ActionButtonWidget(isTeacher: isTeacher))),
        const PollMobileViewWidget()
      ],
    );
  }
}
