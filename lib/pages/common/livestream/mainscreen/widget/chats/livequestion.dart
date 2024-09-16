import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/socket/mainsocket.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/card/live_chat_card.dart';

class LiveQuestion extends StatefulWidget {
  const LiveQuestion({super.key});

  @override
  State<LiveQuestion> createState() => _LiveQuestionState();
}

class _LiveQuestionState extends State<LiveQuestion> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // _scrollToLatestMessage();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  // Function to scroll the chat to the bottom
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isTeacher = isTeacherLogin(context);
    final store = StoreProvider.of<AppState>(context);

    void sendMessage() {
      String message = _controller.text.trim();
      if (message.isNotEmpty) {
        store.dispatch(addUserQuestionMessage(context, message));
        sendQuestionMsg(message);
        _controller.clear(); // Clear the text field
      }
    }

    return StoreConnector<AppState, ChatWidgetAppState>(
        converter: (store) => store.state.chatWidgetAppState,
        onDidChange: (previousState, currentState) {
          if (currentState.questionMessages.length !=
              previousState?.questionMessages.length) {
            _scrollToBottom();
          }
        },
        builder: (context, state) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 9,
                    child: state.questionMessages.isNotEmpty
                        ? ListView.separated(
                            scrollDirection: Axis.vertical,
                            controller: _scrollController,
                            itemCount: state.questionMessages.length,
                            itemBuilder: (BuildContext context, int index) {
                              final cardModel = state.questionMessages[index];
                              return LiveChatCard(
                                context: context,
                                username: cardModel.peerDetails.name,
                                feedback: cardModel.questionMsg,
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(height: 20);
                            },
                          )
                        : const Center(child: Text('No Questions')),
                  ),
                  const SizedBox(height: 10),
                  if (!isTeacher)
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 300,
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'Ask Something...',
                            hintStyle: const TextStyle(fontSize: 14),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.send),
                              iconSize: 16.0,
                              onPressed: () {
                                sendMessage();
                              },
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 5,
                            ), // Adjust padding
                          ),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF2C3329), // Text color
                          ),
                          onSubmitted: (value) {
                            sendMessage();
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ));
  }
}
