import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:inspflutterfrontend/redux/AppState.dart';
import 'package:inspflutterfrontend/socket/mainsocket.dart';
import 'package:inspflutterfrontend/widget/card/live_chat_card.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class LiveChat extends StatefulWidget {
  const LiveChat({super.key});

  @override
  State<LiveChat> createState() => _LiveChatState();
}

class _LiveChatState extends State<LiveChat> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _controller = TextEditingController();
  bool isEmojiVisible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  void toggleEmojiKeyboard() {
    setState(() {
      isEmojiVisible = !isEmojiVisible;
    });
  }

  void addEmojiToText(Emoji emoji) {
    _controller
      ..text += emoji.emoji
      ..selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
  }

  void sendMessage() {
    String message = _controller.text.trim();
    if (message.isNotEmpty) {
      StoreProvider.of<AppState>(context)
          .dispatch(addUserChatMessage(context, message));
      sendChatMessage(message);
      _controller.clear();
    }
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
    return StoreConnector<AppState, ChatWidgetAppState>(
      converter: (store) => store.state.chatWidgetAppState,
      onDidChange: (previousState, currentState) {
        if (currentState.chatMessages.length !=
            previousState?.chatMessages.length) {
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
              child: state.chatMessages.isNotEmpty
                  ? ListView.separated(
                      scrollDirection: Axis.vertical,
                      controller: _scrollController,
                      itemCount: state.chatMessages.length,
                      itemBuilder: (BuildContext context, int index) {
                        final cardModel = state.chatMessages[index];
                        return LiveChatCard(
                          context: context,
                          username: cardModel.peerDetails.name,
                          feedback: cardModel.msg,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 20);
                      },
                    )
                  : const Center(child: Text('No item')),
            ),
            const SizedBox(height: 10),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Type Something...',
                      hintStyle: const TextStyle(fontSize: 14),
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.emoji_emotions),
                        iconSize: 24.0,
                        onPressed: () {},
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.send),
                        iconSize: 24.0,
                        onPressed: sendMessage,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
