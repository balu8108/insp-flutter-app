import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';

class LivePollResult extends StatelessWidget {
  LivePollResult();
  static void dispatch(BuildContext context, ChatWidgetAppState action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatWidgetAppState>(
        converter: (store) => store.state.chatWidgetAppState,
        builder: (context, state) => Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(232, 242, 249, 1),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(flex: 9, child: INSPHeading('Poll Result')),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              state.leaderBoardAnswerPercentage.isEmpty
                  ? const Text(
                      "No Data",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(44, 51, 41, 0.47),
                        height: 1.75,
                      ),
                    )
                  : Expanded(
                      child: Expanded(
                      child: ListView.builder(
                        itemCount: state.leaderBoardAnswerPercentage.length,
                        itemBuilder: (context, index) {
                          final value =
                              state.leaderBoardAnswerPercentage[index].value;
                          final subjectName =
                              state.leaderBoardAnswerPercentage[index].key;

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      subjectName,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      '${value.toStringAsFixed(1)}%',
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                LayoutBuilder(
                                  builder: (context, constraints) {
                                    // Calculate the width as a percentage of the available width
                                    double percentageWidth =
                                        (constraints.maxWidth * value) / 100;

                                    return Container(
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Container(
                                          width: percentageWidth,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                                60, 141, 188, 1),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ))
            ])));
  }
}
