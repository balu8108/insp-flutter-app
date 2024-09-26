// This file is "main.dart"
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/main.dart';
import 'package:insp/pages/common/livestream/mainscreen/liveclass.dart';
import 'package:insp/pages/common/livestream/models/chat_message_model.dart';
import 'package:insp/pages/common/livestream/models/increase_polltime_model.dart';
import 'package:insp/pages/common/livestream/models/leaderboard_answer_model.dart';
import 'package:insp/pages/common/livestream/models/leaderboard_model.dart';
import 'package:insp/pages/common/livestream/models/peers_model.dart';
import 'package:insp/pages/common/livestream/models/polldata_model.dart';
import 'package:insp/pages/common/livestream/models/question_message_model.dart';
import 'package:insp/pages/common/livestream/widget/chat/peers_widget_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/socket/mainsocket.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'chat_widget_redux.freezed.dart';

var uuid = const Uuid();

@freezed
class ChatWidgetAppState with _$ChatWidgetAppState {
  const factory ChatWidgetAppState(
      {@Default([]) List<ChatMessageModel> chatMessages,
      @Default([]) List<LeaderboardModel> leaderBoard,
      @Default([]) List<LeaderBoardAnswerModel> leaderBoardAnswerPercentage,
      @Default([]) List<QuestionMessageModel> questionMessages,
      @Default(PollDataModel()) PollDataModel pollData,
      @Default(PollDataModel()) PollDataModel questionFromServer,
      @Default(IncreasePollTimeModel())
      IncreasePollTimeModel increasePollTimeModel}) = _ChatWidgetAppState;
}

class UpdateChatMessages extends ChatWidgetAction {
  List<ChatMessageModel> chatMessages;
  UpdateChatMessages({required this.chatMessages});
}

class UpdateLeaderBoard extends ChatWidgetAction {
  List<LeaderboardModel> leaderBoard;
  UpdateLeaderBoard({required this.leaderBoard});
}

class UpdateLeaderboardMessages extends ChatWidgetAction {
  List<LeaderBoardAnswerModel> leaderBoardAnswerPercentage;
  UpdateLeaderboardMessages({required this.leaderBoardAnswerPercentage});
}

class UpdateQuestionMessage extends ChatWidgetAction {
  List<QuestionMessageModel> questionMessages;
  UpdateQuestionMessage({required this.questionMessages});
}

class UpdatePollData extends ChatWidgetAction {
  PollDataModel pollData;
  UpdatePollData({required this.pollData});
}

class UpdateQuestionFromServer extends ChatWidgetAction {
  PollDataModel questionFromServer;
  UpdateQuestionFromServer({required this.questionFromServer});
}

class UpdateIncreasePollTimeModel extends ChatWidgetAction {
  IncreasePollTimeModel increasePollTimeModel;
  UpdateIncreasePollTimeModel({required this.increasePollTimeModel});
}

sealed class ChatWidgetAction {}

ChatWidgetAppState chatMessageStateReducer(
    ChatWidgetAppState state, dynamic action) {
  if (action is UpdateChatMessages) {
    return state.copyWith(chatMessages: action.chatMessages);
  } else if (action is UpdateLeaderBoard) {
    return state.copyWith(leaderBoard: action.leaderBoard);
  } else if (action is UpdateLeaderboardMessages) {
    return state.copyWith(
        leaderBoardAnswerPercentage: action.leaderBoardAnswerPercentage);
  } else if (action is UpdateQuestionMessage) {
    return state.copyWith(questionMessages: action.questionMessages);
  } else if (action is UpdatePollData) {
    return state.copyWith(pollData: action.pollData);
  } else if (action is UpdateQuestionFromServer) {
    return state.copyWith(questionFromServer: action.questionFromServer);
  } else if (action is UpdateIncreasePollTimeModel) {
    return state.copyWith(increasePollTimeModel: action.increasePollTimeModel);
  }
  return state;
}

ThunkAction<AppState> navigateToRoom(BuildContext context, String roomId) {
  return (Store<AppState> store) async {
    await joinRoomHandler(store, roomId, context);
  };
}

ThunkAction<AppState> cleanState() {
  return (Store<AppState> store) async {
    PollDataModel polldata = const PollDataModel(
        correctAnswers: [], noOfOptions: 0, questionId: '', type: '', time: 0);
    store.dispatch(UpdatePollData(pollData: polldata));
  };
}

ThunkAction<AppState> cleanQuestionState() {
  return (Store<AppState> store) async {
    PollDataModel questionFromServer = const PollDataModel(
        correctAnswers: [], noOfOptions: 0, questionId: '', type: '', time: 0);
    store.dispatch(
        UpdateQuestionFromServer(questionFromServer: questionFromServer));
  };
}

ThunkAction<AppState> addServerChatMessage(dynamic res) {
  return (Store<AppState> store) async {
    // Extracting 'msg' and 'peerDetails' from the response
    String msg = res['msg'];
    PeerDetail peerDetails = PeerDetail.fromJson(res['peerDetails']);

    // Assuming 'ChatMessageModel.fromJson' can handle the JSON structure
    ChatMessageModel newMessage = ChatMessageModel.fromJson(
        {'msg': msg, 'peerDetails': peerDetails.toJson()});

    // Get the current messages from the store
    List<ChatMessageModel> currentMessages =
        store.state.chatWidgetAppState.chatMessages;

    // Create the updated list of messages
    List<ChatMessageModel> chatMessages = [
      ...currentMessages.sublist(max(0, currentMessages.length - 50)),
      newMessage
    ];

    // Dispatch the action to update chat messages in the store
    store.dispatch(UpdateChatMessages(chatMessages: chatMessages));
  };
}

ThunkAction<AppState> addUserChatMessage(BuildContext context, String msg) {
  return (Store<AppState> store) async {
    // Extracting 'msg' and 'peerDetails' from the response
    PeerDetail peerDetails = PeerDetail(id: uuid.v4(), name: 'You');

    // Assuming 'ChatMessageModel.fromJson' can handle the JSON structure
    ChatMessageModel newMessage = ChatMessageModel.fromJson(
        {'msg': msg, 'peerDetails': peerDetails.toJson()});

    // Get the current messages from the store
    List<ChatMessageModel> currentMessages =
        store.state.chatWidgetAppState.chatMessages;

    // Create the updated list of messages
    List<ChatMessageModel> chatMessages = [
      ...currentMessages.sublist(max(0, currentMessages.length - 50)),
      newMessage
    ];

    // Dispatch the action to update chat messages in the store
    store.dispatch(UpdateChatMessages(chatMessages: chatMessages));
  };
}

ThunkAction<AppState> addServerQuestionMessage(dynamic res) {
  return (Store<AppState> store) async {
    // Extracting 'msg' and 'peerDetails' from the response
    String msg = res['questionMsg'];
    PeerDetail peerDetails = PeerDetail.fromJson(res['peerDetails']);

    // Assuming 'ChatMessageModel.fromJson' can handle the JSON structure
    QuestionMessageModel newMessage = QuestionMessageModel.fromJson(
        {'questionMsg': msg, 'peerDetails': peerDetails.toJson()});

    // Get the current messages from the store
    List<QuestionMessageModel> currentMessages =
        store.state.chatWidgetAppState.questionMessages;

    // Create the updated list of messages
    List<QuestionMessageModel> questionMessages = [
      ...currentMessages.sublist(max(0, currentMessages.length - 50)),
      newMessage
    ];

    // Dispatch the action to update chat messages in the store
    store.dispatch(UpdateQuestionMessage(questionMessages: questionMessages));
  };
}

ThunkAction<AppState> addUserQuestionMessage(BuildContext context, String msg) {
  return (Store<AppState> store) async {
    // Extracting 'msg' and 'peerDetails' from the response
    PeerDetail peerDetails = PeerDetail(id: uuid.v4(), name: 'You');

    // Assuming 'ChatMessageModel.fromJson' can handle the JSON structure
    QuestionMessageModel newMessage = QuestionMessageModel.fromJson(
        {'questionMsg': msg, 'peerDetails': peerDetails.toJson()});

    // Get the current messages from the store
    List<QuestionMessageModel> currentQuestion =
        store.state.chatWidgetAppState.questionMessages;

    // Create the updated list of messages
    List<QuestionMessageModel> questionMessages = [
      ...currentQuestion.sublist(max(0, currentQuestion.length - 50)),
      newMessage
    ];

    // Dispatch the action to update chat messages in the store
    store.dispatch(UpdateQuestionMessage(questionMessages: questionMessages));
  };
}

ThunkAction<AppState> joinRoomResponseData(BuildContext context, dynamic res) {
  return (Store<AppState> store) async {
    if (res['selfDetails'] != null) {
      PeersDataModel peerdetail = PeersDataModel.fromJson(res['selfDetails']);

      List<PeersDataModel> allPeers = store.state.peersWidgetAppState.allPeers;

      List<PeersDataModel> updatedLiveClassRoomPeer = [
        ...allPeers,
        peerdetail // Add all new files to the list
      ];
      store.dispatch(UpdateAllPeers(allPeers: updatedLiveClassRoomPeer));
      store.dispatch(
          UpdateFilteredPeers(filteredPeers: updatedLiveClassRoomPeer));
    }
    if (res['leaderBoardData'] is List &&
        res['leaderBoardData'] != null &&
        res['leaderBoardData'].isNotEmpty) {
      // Ensure that each item in the list is a Map
      List<LeaderBoardAnswerModel> leaderBoardListAnswer =
          (res['leaderBoardData'] as List<dynamic>)
              .map((item) =>
                  LeaderBoardAnswerModel.fromJson(item as Map<String, dynamic>))
              .toList();

      store.dispatch(UpdateLeaderboardMessages(
          leaderBoardAnswerPercentage: leaderBoardListAnswer));
    }
    pushAndRemoveUntilWithoutAnimation(context, const LiveClassScreen());
  };
}

ThunkAction<AppState> setChatInitialData() {
  return (Store<AppState> store) async {
    store.dispatch(UpdateChatMessages(chatMessages: []));
    store.dispatch(UpdateLeaderBoard(leaderBoard: []));
    store.dispatch(UpdateQuestionMessage(questionMessages: []));
    store.dispatch(UpdateLeaderboardMessages(leaderBoardAnswerPercentage: []));
  };
}
