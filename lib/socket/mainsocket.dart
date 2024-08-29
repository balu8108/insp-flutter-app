import 'dart:math';

import 'package:inspflutterfrontend/pages/common/livestream/models/chat_message_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/leaderboard_answer_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/leaderboard_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/peers_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/polldata_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/socket/socket_events.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:redux/redux.dart';

IO.Socket? socket;

void initializeSocketConnections(Store<AppState> store, String roomId) {
  final String secretToken = '70bc7fe19e8e055142e02bf67fa13de0';

  if (secretToken.isNotEmpty) {
    socket = IO.io(
        "http://localhost:4000",
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .setAuth({'secret_token': '70bc7fe19e8e055142e02bf67fa13de0'})
            .build());

    socket?.on(
        SOCKET_EVENTS.CONNECT, (_) => socketConnectionHandler(store, roomId));
    socket?.on(SOCKET_EVENTS.NEW_PEER_JOINED,
        (data) => socketNewPeerJoinedHandler(store, data));
    socket?.on(SOCKET_EVENTS.CHAT_MSG_FROM_SERVER,
        (data) => chatMsgResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.QUESTION_MSG_SENT_FROM_SERVER,
        (data) => questionMsgResponseHandler(store, data));
    // socket?.on(SOCKET_EVENTS.QUESTION_SENT_FROM_SERVER,
    //     (data) => questionResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.LEADERBOARD_FROM_SERVER,
        (data) => leaderBoardResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.LEADERBOARD_AVERAGE_ANSWER_FROM_SERVER,
        (data) => leaderBoardAnswerResponseHandler(store, data));
  }
}

void chatMsgResponseHandler(Store<AppState> store, dynamic res) {
  store.dispatch(addServerChatMessage(res));
}

void sendChatMessage(String msg) {
  socket?.emit(SOCKET_EVENTS.CHAT_MSG_TO_SERVER, {'msg': msg});
}

void questionMsgResponseHandler(Store<AppState> store, dynamic res) {
  print("123445");
  print(res);
  store.dispatch(addServerQuestionMessage(res));
}

void questionResponseHandler(Store<AppState> store, dynamic res) {
  print("1234456777");
  print(res);
  store.dispatch(addServerQuestionMessage(res));
}

void sendQuestionMsg(String questionMsg) {
  socket?.emit(
    SOCKET_EVENTS.QUESTION_MSG_SENT_TO_SERVER,
    {'questionMsg': questionMsg},
  );
}

void leaderBoardResponseHandler(Store<AppState> store, dynamic res) {
  List<LeaderboardModel> leaderBoardList = (res['leaderBoard'] as List)
      .map((item) => LeaderboardModel.fromJson(item))
      .toList();
  store.dispatch(UpdateLeaderBoard(leaderBoard: leaderBoardList));
}

void leaderBoardAnswerResponseHandler(Store<AppState> store, dynamic res) {
  List<LeaderBoardAnswerModel> leaderBoardListAnswer =
      (res['averagePeersOption'] as List)
          .map((item) => LeaderBoardAnswerModel.fromJson(item))
          .toList();

  store.dispatch(UpdateLeaderboardMessages(
      leaderBoardAnswerPercentage: leaderBoardListAnswer));
}

void sendQuestionHandler(Store<AppState> store, dynamic data) {
  socket?.emitWithAck(SOCKET_EVENTS.QUESTION_SENT_TO_SERVER, data, ack: (res) {
    PollDataModel pollDataModel = PollDataModel.fromJson(res);
    store.dispatch(UpdatePollData(pollData: pollDataModel));
  });
}

void socketConnectionHandler(Store<dynamic> store, String roomId) {
  socket?.emitWithAck(SOCKET_EVENTS.JOIN_ROOM_PREVIEW, {'roomId': roomId},
      ack: (res) {
    if (res['success'] == true) {
      store.dispatch(UpdateAllPeers(
          allPeers: List<PeersDataModel>.from((res['peers'] as List<dynamic>)
              .map((e) => PeersDataModel.fromJson(e)))));
    }
  });
}

void socketNewPeerJoinedHandler(Store<dynamic> store, dynamic res) {
  final PeersDataModel newPeer = PeersDataModel.fromJson(res['peer']);
  final List<PeersDataModel> currentPeers = store.state.allPeers;

  if (!currentPeers.any((peer) => peer.id == newPeer.id)) {
    store.dispatch(UpdateAllPeers(allPeers: [...currentPeers, newPeer]));
  }
}

void roomUpdateResponseHandler(Store<dynamic> store, dynamic res) {
  final List<PeersDataModel> updatedPeers = List<PeersDataModel>.from(
      (res['peer'] as List<dynamic>).map((e) => PeersDataModel.fromJson(e)));
  store.dispatch(UpdateAllPeers(allPeers: updatedPeers));
}

void peerLeavedResponseHandler(Store<dynamic> store, dynamic res) {
  final PeersDataModel peerLeaved = PeersDataModel.fromJson(res['peerLeaved']);

  final List<PeersDataModel> updatedPeers =
      store.state.allPeers.where((peer) => peer.id != peerLeaved.id).toList();

  store.dispatch(UpdateAllPeers(allPeers: updatedPeers));
}

Future<void> joinRoomHandler(
    Store<dynamic> store, String roomId, dynamic userProfile) async {
  socket?.emitWithAck(
      SOCKET_EVENTS.JOIN_ROOM, {'roomId': roomId, 'peerDetails': userProfile},
      ack: (res) {
    if (res['success']) {
      store.dispatch(UpdateLeaderboardMessages(
          leaderBoardAnswerPercentage: res['leaderBoardData']));
    } else {
      // Handle failure
    }
  });
}

void sendAnswerHandler(dynamic data) {
  socket?.emit(SOCKET_EVENTS.ANSWER_SENT_TO_SERVER, data);
}

void kickOutFromClass(String peerSocketId, String peerId) {
  socket?.emit(SOCKET_EVENTS.KICK_OUT_FROM_CLASS_TO_SERVER,
      {'peerSocketId': peerSocketId, 'peerId': peerId});
}

void sendPollTimeIncreaseToServer(String questionId, int timeIncreaseBy) {
  socket?.emit(SOCKET_EVENTS.POLL_TIME_INCREASE_TO_SERVER,
      {'questionId': questionId, 'timeIncreaseBy': timeIncreaseBy});
}
