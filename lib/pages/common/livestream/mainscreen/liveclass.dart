import 'package:flutter/material.dart';
import 'package:insp/pages/common/livestream/mainscreen/peer_list.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/chats/livechatsection.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/chats/liveleftpart.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/liveclassdetail.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/videoPlayer/tpstreamMobileView.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/videoPlayer/tpstreamview.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/mobileAppbar/mobileAppbar.dart';
import 'package:insp/widget/navbar/navbar.dart';

class LiveClassScreen extends StatefulWidget {
  const LiveClassScreen({super.key});
  @override
  _LiveClassScreenState createState() => _LiveClassScreenState();
}

class _LiveClassScreenState extends State<LiveClassScreen> {
  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    return isWebOrLandScape
        ? Scaffold(
            appBar: const Navbar(),
            body: Container(
              padding: isWebOrLandScape
                  ? const EdgeInsets.all(10.0)
                  : const EdgeInsets.all(0.0),
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 2, child: LiveChatSectionWidget()), // Expanded here
                  SizedBox(width: 16),
                  Expanded(
                    flex: 7,
                    child: TPStreamLiveVideoPlayerWidget(), // Expanded here
                  ),
                  SizedBox(width: 20),
                  PeerListWidget(),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: const Mobileappbar(),
            body: Container(
              padding: isWebOrLandScape
                  ? const EdgeInsets.all(10.0)
                  : const EdgeInsets.all(0.0),
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: const SingleChildScrollView(
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
            ),
          );
  }
}
