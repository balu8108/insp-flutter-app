import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/pages/common/recordingplayer/recording_player_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/extensions.dart';

class LeaveSoloClassPopup extends StatelessWidget {
  const LeaveSoloClassPopup({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    final store = StoreProvider.of<AppState>(context);

    void leaveOrEnd() {
      store.dispatch(stopSoloClassLecture(context));
    }

    void defaultLoaderFunction() {}

    return StoreConnector<AppState, RecordingPlayerAppState>(
        converter: (store) => store.state.recordingPlayerAppState,
        builder: (context, RecordingPlayerAppState state) => AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 26, horizontal: 28),
              insetPadding: isWebOrLandScape ? null : EdgeInsets.zero,
              title: Row(
                children: [
                  const Text("",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      )),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              ),
              content: const SizedBox(
                height: 50,
                width: 400, // Set your desired width here
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .start, // Aligns the column to the start (top)
                  crossAxisAlignment: CrossAxisAlignment
                      .start, // Aligns the text to the start (left)
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Are you sure you want to end the lecture?",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromRGBO(60, 141, 188, 1),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: const Text("No"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 100,
                      child: ElevatedButton(
                        onPressed: state.isDeleted
                            ? defaultLoaderFunction
                            : leaveOrEnd,
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromRGBO(60, 141, 188, 1),
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        child: state.isDeleted
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: Center(
                                    child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                )))
                            : const Text("Yes"),
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }
}
