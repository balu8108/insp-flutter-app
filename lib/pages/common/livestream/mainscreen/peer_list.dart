import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/livepeersfulllist.dart';
import 'package:inspflutterfrontend/pages/common/livestream/mainscreen/widget/livepeerslist.dart';

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
    return GestureDetector(
      onTap: toggleSidebar,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
        width: isExpanded ? 250 : 80, // Adjust these values as needed
        child: isExpanded ? LivePeersFullListWidget() : LivePeersListWidget(),
      ),
    );
  }
}
