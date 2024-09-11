import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/preview/widget/peer_menu_popup.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';

class LivePeersFullListTeacherWidget extends StatelessWidget {
  static void dispatch(BuildContext context, PeersWidgetAction action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return StoreConnector<AppState, PeersWidgetAppState>(
        converter: (store) => store.state.peersWidgetAppState,
        builder: (context, PeersWidgetAppState state) {
          return Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (text) {
                        if (text.isEmpty) {
                          store.dispatch(defaultPeers());
                        }
                        store
                            .dispatch(UpdateSearchKeyword(searchKeyword: text));
                      },
                      onSubmitted: (value) {
                        store.dispatch(filteredPeers());
                      },
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: const TextStyle(
                            fontSize: 16, color: Color(0x613A3541)),
                        contentPadding: const EdgeInsets.all(14.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(58, 53, 65, 0.38),
                              width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.blue, width: 2.0),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(Icons.search),
                      iconSize: 16.0,
                      onPressed: () => {store.dispatch(filteredPeers())})
                ],
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                itemCount: state.filteredPeers.length,
                itemBuilder: (context, index) {
                  final peer = state.filteredPeers[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: 40,
                                  height: 40,
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromRGBO(60, 141, 188, 1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Center(
                                        child: Text(
                                      peer.name[0].toUpperCase(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    )),
                                  )),
                              const SizedBox(width: 10),
                              Text(
                                peer.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          KickPeerWidget(
                              peerId: peer.id,
                              isTeacher: peer.isTeacher,
                              socketId: peer.socketId)
                        ],
                      ),
                    ),
                  );
                },
              )),
            ],
          );
        });
  }
}
