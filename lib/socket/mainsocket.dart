import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/login/login_response_model.dart';
import 'package:insp/data/hardcoded/secret_key.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/common/livestream/models/increase_polltime_model.dart';
import 'package:insp/pages/common/livestream/models/leaderboard_answer_model.dart';
import 'package:insp/pages/common/livestream/models/leaderboard_model.dart';
import 'package:insp/pages/common/livestream/models/peers_model.dart';
import 'package:insp/pages/common/livestream/models/polldata_model.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/poll_timer_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/preview_data_redux.dart';
import 'package:insp/pages/common/livestream/widget/chat/tpstream_redux.dart';
import 'package:insp/pages/common/recordingplayer/recording_player_redux.dart';
import 'package:insp/pages/home/home_screen.dart';
import 'package:insp/pages/teacher/soloclassrecording/redux/soloclass_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/socket/socket_events.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/popups/rating/rating.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:redux/redux.dart';
import 'package:toastification/toastification.dart';

IO.Socket? socket;

void initializeSocketConnections(
    Store<AppState> store, String roomId, String token) {
  if (socket != null) {
    socket?.disconnect(); // Disconnect the socket
    socket?.close(); // Close the connection
    socket = null; // Set the socket to null to ensure fresh initialization
  }

  if (token.isNotEmpty) {
    socket = IO.io(
        api,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .setAuth({'secret_token': token})
            .disableReconnection()
            .enableForceNew()
            .build());

    // Add event listeners
    socket?.onConnect((_) {
      print('Connected to socket');
    });
    socket?.onDisconnect((_) {
      print('Disconnected from socket');
    });
    socket?.on(
        SOCKET_EVENTS.CONNECT, (_) => socketConnectionHandler(store, roomId));
    socket?.on(SOCKET_EVENTS.NEW_PEER_JOINED,
        (data) => socketNewPeerJoinedHandler(store, data));
    socket?.on(SOCKET_EVENTS.PEER_LEAVED,
        (data) => peerLeavedResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.CHAT_MSG_FROM_SERVER,
        (data) => chatMsgResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.UPLOAD_FILE_FROM_SERVER,
        (data) => uploadFileResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.QUESTION_MSG_SENT_FROM_SERVER,
        (data) => questionMsgResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.QUESTION_SENT_FROM_SERVER,
        (data) => questionResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.LEADERBOARD_FROM_SERVER,
        (data) => leaderBoardResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.LEADERBOARD_AVERAGE_ANSWER_FROM_SERVER,
        (data) => leaderBoardAnswerResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.POLL_TIME_INCREASE_FROM_SERVER,
        (data) => pollTimeIncreaseResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.KICK_OUT_FROM_CLASS_FROM_SERVER,
        (data) => kickOutResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.END_MEET_FROM_SERVER,
        (data) => kickOutResponseHandler(store, data));
    socket?.on(SOCKET_EVENTS.TPSTREAM_STREAMING_STATUS_FROM_SERVER,
        (data) => tpStreamLivestreamStatus(store, data));
    socket?.on(SOCKET_EVENTS.DISCONNECT, (err) => {});
    socket?.on(SOCKET_EVENTS.CONNECT_ERROR, (err) => {});
    // Connect the socket
    socket?.connect();
  }
}

void chatMsgResponseHandler(Store<AppState> store, dynamic res) {
  store.dispatch(addServerChatMessage(res));
}

void sendChatMessage(String msg) {
  socket?.emit(SOCKET_EVENTS.CHAT_MSG_TO_SERVER, {'msg': msg});
}

void questionMsgResponseHandler(Store<AppState> store, dynamic res) {
  store.dispatch(addServerQuestionMessage(res));
}

void questionResponseHandler(Store<AppState> store, dynamic res) {
  PollDataModel polldata = PollDataModel.fromJson(res['data']);
  store.dispatch(UpdateQuestionFromServer(questionFromServer: polldata));
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
  // Check if the res['averagePeersOption'] is a List and not null
  if (res['averagePeersOption'] is List) {
    // Ensure that each item in the list is a Map
    List<LeaderBoardAnswerModel> leaderBoardListAnswer =
        (res['averagePeersOption'] as List<dynamic>)
            .whereType<Map<String, dynamic>>() // Filter to ensure it's a Map
            .map((item) =>
                LeaderBoardAnswerModel.fromJson(item as Map<String, dynamic>))
            .toList();

    store.dispatch(UpdateLeaderboardMessages(
        leaderBoardAnswerPercentage: leaderBoardListAnswer));
  } else {
    // Handle the case where the response is not as expected
    store.dispatch(UpdateLeaderboardMessages(leaderBoardAnswerPercentage: []));
  }
}

void sendQuestionHandler(Store<AppState> store, dynamic data) {
  socket?.emitWithAck(SOCKET_EVENTS.QUESTION_SENT_TO_SERVER, data, ack: (res) {
    PollDataModel pollDataModel = PollDataModel.fromJson(res);
    store.dispatch(UpdatePollData(pollData: pollDataModel));
    store.dispatch(setTimerValue(pollDataModel.time));
  });
}

void socketConnectionHandler(Store<AppState> store, String roomId) {
  socket?.emitWithAck(SOCKET_EVENTS.JOIN_ROOM_PREVIEW, {'roomId': roomId},
      ack: (res) {
    if (res['success'] == true) {
      store.dispatch(UpdateAllPeers(
          allPeers: List<PeersDataModel>.from((res['peers'] as List<dynamic>)
              .map((e) => PeersDataModel.fromJson(e)))));
    }
  });
}

void socketNewPeerJoinedHandler(Store<AppState> store, dynamic res) {
  final PeersDataModel newPeer = PeersDataModel.fromJson(res['peer']);
  final List<PeersDataModel> currentPeers =
      store.state.peersWidgetAppState.allPeers;

  if (!currentPeers.any((peer) => peer.id == newPeer.id)) {
    store.dispatch(UpdateAllPeers(allPeers: [...currentPeers, newPeer]));
    store.dispatch(
        UpdateFilteredPeers(filteredPeers: [...currentPeers, newPeer]));
  }
}

void roomUpdateResponseHandler(Store<AppState> store, dynamic res) {
  final List<PeersDataModel> updatedPeers = List<PeersDataModel>.from(
      (res['peer'] as List<dynamic>).map((e) => PeersDataModel.fromJson(e)));
  store.dispatch(UpdateAllPeers(allPeers: updatedPeers));
  store.dispatch(UpdateFilteredPeers(filteredPeers: updatedPeers));
}

void peerLeavedResponseHandler(Store<AppState> store, dynamic res) {
  final PeersDataModel peerLeaved = PeersDataModel.fromJson(res['peerLeaved']);

  final List<PeersDataModel> updatedPeers = store
      .state.peersWidgetAppState.allPeers
      .where((peer) => peer.id != peerLeaved.id)
      .toList();

  store.dispatch(UpdateAllPeers(allPeers: updatedPeers));
  store.dispatch(UpdateFilteredPeers(filteredPeers: updatedPeers));
}

Future<void> joinRoomHandler(
    Store<AppState> store, String roomId, BuildContext context) async {
  LoginResponseModelResult userData = getUserDataFromStore(context);
  socket?.emitWithAck(SOCKET_EVENTS.JOIN_ROOM,
      {'roomId': roomId, 'peerDetails': userData.toJson()}, ack: (res) {
    if (!res['success']) {
      toastification.show(
        context: context, // optional if you use ToastificationWrapper
        type: ToastificationType.error,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 3),
        title: Text(res['errMsg']),
        alignment: Alignment.topRight,
      );
    } else if (res['success']) {
      store.dispatch(joinRoomResponseData(context, res));
    } else {
      // Handle failure
    }
  });
}

Future<void> sendFileHandler(Store<AppState> store, dynamic filesData) async {
  socket?.emitWithAck(SOCKET_EVENTS.UPLOAD_FILE_TO_SERVER, filesData,
      ack: (res) {
    if (res['success']) {
      store.dispatch(addFileToPreviewData(res['data']));
    } else {
      // Handle failure
    }
  });
}

void uploadFileResponseHandler(Store<AppState> store, dynamic res) {
  if (res['success']) {
    store.dispatch(addFileToPreviewData(res['data']));
  } else {
    // Handle failure
  }
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

void pollTimeIncreaseResponseHandler(Store<AppState> store, dynamic res) {
  IncreasePollTimeModel increasePollTimeModel =
      IncreasePollTimeModel.fromJson(res);
  store.dispatch(UpdateIncreasePollTimeModel(
      increasePollTimeModel: increasePollTimeModel));
}

void kickOutResponseHandler(Store<AppState> store, dynamic res) {
  leaveRoomHandler(store);
}

void tpStreamLivestreamStatus(Store<AppState> store, dynamic res) {
  String message = res['msg'] ?? 'Unknown Status';
  store.dispatch(getStatus(message));
}

void endMeetHandler() {
  socket?.emit(SOCKET_EVENTS.END_MEET_TO_SERVER);
}

Future<void> leaveRoomHandler(Store<AppState> store) async {
  if (socket?.connected == true) {
    socket?.emitWithAck(SOCKET_EVENTS.LEAVE_ROOM, '', ack: (res) async {
      var feedBackStatus = res['feedBackStatus'];
      store.dispatch(setPeerInitialData());
      store.dispatch(setChatInitialData());
      store.dispatch(setTpStreamInitialData());
      store.dispatch(setRecordingTpStreamInitialData());
      store.dispatch(setSoloTpStreamInitialData());
      LoginResponseModelResult userDatas = await getUserData();
      navigatorKey.currentState?.push(
        MaterialPageRoute(
            builder: (context) =>
                MainScaffold(content: HomeScreen(userData: userDatas))),
      );
      if (feedBackStatus['success']) {
        if (userDatas.userType == 0) {
          if (!feedBackStatus['isFeedback']) {
            final currentContext = navigatorKey.currentState?.context;
            if (currentContext != null) {
              showDialog(
                  context: currentContext,
                  builder: (BuildContext context) {
                    return RatingFeedbackPopup.getScreen(
                        int.parse(feedBackStatus['feedBackTopicId']));
                  });
            }
          }
        }
      } else {
        // Handle failure
      }
      socket?.disconnect();
      socket?.close();
      toastification.show(
        type: ToastificationType.info,
        style: ToastificationStyle.fillColored,
        autoCloseDuration: const Duration(seconds: 3),
        title: const Text('Class Leaved'),
        alignment: Alignment.topRight,
      );
    });
  } else {
    store.dispatch(setRecordingTpStreamInitialData());
    store.dispatch(setSoloTpStreamInitialData());
  }
}
