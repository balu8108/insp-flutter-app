import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/models/polldata_model.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/socket/mainsocket.dart';
import 'package:inspflutterfrontend/widget/popups/questiongenerate/question_generate.dart';
// import 'package:tpstreams_player_sdk/tpstreams_player_sdk.dart';

class TPStreamLiveVideoPlayerWidget extends StatelessWidget {
  TPStreamLiveVideoPlayerWidget();
  static void dispatch(BuildContext context, ChatWidgetAppState action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);

    void generatePoll(PollDataModel data) {
      sendQuestionHandler(store, data);
    }

    return StoreConnector<AppState, ChatWidgetAppState>(
        converter: (store) => store.state.chatWidgetAppState,
        builder: (context, ChatWidgetAppState state) => Container(
            height: 600,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(232, 242, 249, 1),
            ),
            child: Column(
              children: [
                Tooltip(
                    message: "Polls", // Adjust as per your utility function
                    child: IconButton(
                      icon: const Icon(Icons.poll),
                      iconSize: 16.0,
                      onPressed: () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return QuestionGenerate.getScreen(
                                sendPollToServer: generatePoll);
                          }),
                    )),
              ],
            )));
  }
}
