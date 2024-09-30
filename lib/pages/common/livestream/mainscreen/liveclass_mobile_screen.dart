import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/chats/liveleftpart.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/liveclassdetail.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/videoPlayer/tpstreamMobileView.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/socket/mainsocket.dart';
import 'package:insp/widget/mobileAppbar/mobileAppbar.dart';

class LiveClassMobileScreen extends StatefulWidget {
  const LiveClassMobileScreen({super.key});
  @override
  _LiveClassScreenState createState() => _LiveClassScreenState();
}

class _LiveClassScreenState extends State<LiveClassMobileScreen> {
  @override
  Widget build(BuildContext context) {
    Future<bool> onBackPressed() async {
      leaveRoomHandler(StoreProvider.of<AppState>(context));
      return true; // Return true to allow the back navigation
    }

    return WillPopScope(
        onWillPop: onBackPressed,
        child: const Scaffold(
          appBar: Mobileappbar(),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TPStreamMobileView(),
                SizedBox(height: 20),
                SizedBox(
                  height: 200,
                  child: LiveClassDetail(),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 400,
                  child: LiveLeftPart(),
                )
              ],
            ),
          ),
        ));
  }
}
