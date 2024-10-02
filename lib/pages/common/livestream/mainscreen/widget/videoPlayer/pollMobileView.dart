import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/livestream/mainscreen/widget/livequestionanswer.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/redux/AppState.dart';

class PollMobileViewWidget extends StatefulWidget {
  const PollMobileViewWidget({super.key});

  @override
  _PollMobileViewWidgetState createState() => _PollMobileViewWidgetState();
}

class _PollMobileViewWidgetState extends State<PollMobileViewWidget> {
  bool _isDialogOpen = false;

  @override
  void initState() {
    super.initState();
  }

  void _closeDialog() {
    if (mounted) {
      setState(() {
        _isDialogOpen = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ChatWidgetAppState>(
      converter: (store) => store.state.chatWidgetAppState,
      builder: (context, statee) {
        // Trigger showDialog when correctAnswers are available and dialog is not already open
        if (statee.questionFromServer.correctAnswers.isNotEmpty &&
            !_isDialogOpen) {
          _isDialogOpen =
              true; // Set the flag to true before opening the dialog

          WidgetsBinding.instance.addPostFrameCallback((_) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return Dialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: StoreConnector<AppState, ChatWidgetAppState>(
                        converter: (store) => store.state.chatWidgetAppState,
                        builder: (context, state) {
                          return LiveQuestionAnswer(
                              polldata: state.questionFromServer,
                              increasePollTimeModel:
                                  state.increasePollTimeModel,
                              closedDialog: _closeDialog);
                        }));
              },
            ).then((_) {
              // Reset the flag when the dialog is dismissed
              _isDialogOpen = false;
            });
          });
        }

        // Base widget layout or empty widget
        return const SizedBox.shrink();
      },
    );
  }
}
