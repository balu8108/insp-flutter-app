import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:insp/redux/AppState.dart';

class LivePeersListWidget extends StatelessWidget {
  const LivePeersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, PeersWidgetAppState>(
      converter: (store) => store.state.peersWidgetAppState,
      builder: (context, PeersWidgetAppState state) {
        return ListView.builder(
          itemCount: state.filteredPeers.length,
          itemBuilder: (context, index) {
            final peer = state.filteredPeers[index];
            return Container(
              width: 100,
              padding: const EdgeInsets.all(8),
              margin:
                  const EdgeInsets.only(bottom: 8), // Add spacing between peers
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(60, 141, 188, 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    peer.name[0]
                        .toUpperCase(), // Display the first letter of the peer's name
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
