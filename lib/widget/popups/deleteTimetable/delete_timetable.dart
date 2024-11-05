import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:insp/pages/common/livestream/widget/chat/chat_widget_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/toaster.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:toastification/toastification.dart';

class DeleteTimeTablePopup extends StatefulWidget {
  const DeleteTimeTablePopup({super.key, required this.timeTableId});

  final int timeTableId;

  @override
  _DeleteTimeTablePopupState createState() => _DeleteTimeTablePopupState();
}

class _DeleteTimeTablePopupState extends State<DeleteTimeTablePopup> {
  bool isDeleting = false;

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();

    void removetimetable() async {
      setState(() {
        isDeleting = true; // Show loading indicator
      });

      try {
        String userToken = getUserToken(context);
        final remoteDataSource = RemoteDataSource();
        final deleteTopicData = await remoteDataSource.deleteTimeTable(
            widget.timeTableId, userToken);

        if (deleteTopicData.response.statusCode == 200) {
          Navigator.of(context).pop();
          showToast(context, 'Time table Deleted Successfully',
              ToastificationType.success);
        } else {
          Navigator.of(context).pop();
          showToast(context, 'Some issue, please try again',
              ToastificationType.warning);
        }
      } catch (error) {
        Navigator.of(context).pop();
        showToast(
            context, 'Some issue, please try again', ToastificationType.error);
      } finally {
        setState(() {
          isDeleting = false; // Hide loading indicator
        });
        Navigator.pop(context);
      }
    }

    void defaultLoaderFunction() {}

    return StoreConnector<AppState, ChatWidgetAppState>(
        converter: (store) => store.state.chatWidgetAppState,
        builder: (context, state) => AlertDialog(
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
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              content: const SizedBox(
                height: 50,
                width: 400, // Set your desired width here
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Are you sure you want to delete timetable?",
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
                        onPressed: isDeleting
                            ? defaultLoaderFunction
                            : removetimetable,
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
                        child: isDeleting
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                ),
                              )
                            : const Text("Ok"),
                      ),
                    ),
                  ],
                ),
              ],
            ));
  }
}
