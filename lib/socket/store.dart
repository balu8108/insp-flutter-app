import 'package:flutter/foundation.dart';

class Store with ChangeNotifier {
  bool _isMeetEnd = false;
  List<dynamic> _peers = [];

  bool get isMeetEnd => _isMeetEnd;
  List<dynamic> get peers => _peers;

  void setIsMeetEnd(bool value) {
    _isMeetEnd = value;
    notifyListeners();
  }

  void setAllPeers(List<dynamic> peers) {
    _peers = peers;
    notifyListeners();
  }

  void setNewPeerJoined(dynamic peer) {
    _peers.add(peer);
    notifyListeners();
  }

  void setPeerLeaved(dynamic peerLeaved) {
    _peers.removeWhere((peer) => peer.id == peerLeaved.id);
    notifyListeners();
  }

  // Add other state management logic as required...
}
