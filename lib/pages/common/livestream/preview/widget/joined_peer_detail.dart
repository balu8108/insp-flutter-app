import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/preview/widget/peer_list.dart';
import 'package:insp/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:insp/redux/AppState.dart';

class JoinedPeerWidget extends StatelessWidget {
  const JoinedPeerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: StoreConnector<AppState, PeersWidgetAppState>(
          converter: (store) => store.state.peersWidgetAppState,
          builder: (context, PeersWidgetAppState state) => Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Mentors Joined Section
                  const Text(
                    'Mentors Joined',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    // Add Center widget here
                    child: PeerList(
                      peers: state.allPeers.isNotEmpty
                          ? state.allPeers
                              .where((peer) => peer.isTeacher)
                              .toList()
                          : [],
                      type: "Mentor",
                      message: 'No mentors joined...',
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Students Joined Section
                  const Text(
                    'Student joined',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Center(
                    // Add Center widget here
                    child: PeerList(
                      peers: state.allPeers.isNotEmpty
                          ? state.allPeers
                              .where((peer) => !peer.isTeacher)
                              .toList()
                          : [],
                      type: "Mentor",
                      message: 'No students joined...',
                    ),
                  ),
                ],
              )),
        ));
  }
}
