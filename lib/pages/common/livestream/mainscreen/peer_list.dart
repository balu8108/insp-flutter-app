import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/peers/livepeersfulllist.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/peers/livepeersfulllistteacher.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/peers/livepeerslist.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';

class PeerListWidget extends StatefulWidget {
  @override
  _PeerListWidgetState createState() => _PeerListWidgetState();
}

class _PeerListWidgetState extends State<PeerListWidget> {
  bool isExpanded = false;

  void toggleSidebar() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isTeacher = isTeacherLogin(context);
    return Container(
        color: Colors.white,
        child: GestureDetector(
          onTap: toggleSidebar,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            width: isExpanded ? 250 : 80, // Adjust these values as needed
            child: isExpanded
                ? isTeacher
                    ? LivePeersFullListTeacherWidget()
                    : LivePeersFullListWidget()
                : LivePeersListWidget(),
          ),
        ));
  }
}
