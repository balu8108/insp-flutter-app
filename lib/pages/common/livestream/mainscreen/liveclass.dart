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
                child: Expanded(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: LiveChatSectionWidget()),
                    const SizedBox(width: 16),
                    const Expanded(
                      flex: 7,
                      child: TPStreamLiveVideoPlayerWidget(),
                    ),
                    const SizedBox(width: 20),
                    PeerListWidget()
                  ],
                ))))
        : Scaffold(
            appBar: const Mobileappbar(),
            body: Container(
                padding: isWebOrLandScape
                    ? const EdgeInsets.all(10.0)
                    : const EdgeInsets.all(0.0),
                color: Colors.white,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TPStreamMobileView(),
                        const SizedBox(height: 20),
                        const SizedBox(
                          height: 200,
                          child: LiveClassDetail(),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 400,
                          child: LiveLeftPart(),
                        )
                        // const SizedBox(width: 20),
                        // PeerListWidget()
                      ],
                    ))));
  }
}
