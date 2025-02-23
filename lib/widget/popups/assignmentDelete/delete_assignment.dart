import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/base/base.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/widget/popups/assignmentDelete/delete_assignment_redux.dart';

class DeleteAssignemnt extends StatelessWidget {
  const DeleteAssignemnt(
      {super.key, required this.fetchAssignmentAfterUpdateorDelete});

  final Function() fetchAssignmentAfterUpdateorDelete;

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    return StoreConnector<DeleteAssignmentAppState, DeleteAssignmentAppState>(
        converter: (store) => store.state,
        builder: (context, DeleteAssignmentAppState state) =>
            SingleChildScrollView(
                child: AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 26, horizontal: 28),
                    insetPadding: isWebOrLandScape ? null : EdgeInsets.zero,
                    title: Row(
                      children: [
                        const Text("Delete Assignment",
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
                      width: 500, // Set your desired width here
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment
                              .start, // Aligns the column to the start (top)
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Aligns the text to the start (left)
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                                "Are you sure? You want to delete this assignment.",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500,
                                )),
                          ]),
                    ),
                    actions: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor:
                                    const Color.fromARGB(255, 244, 238, 238),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: const Text("Cancel")),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () => dispatch(
                                  context,
                                  deleteAssignment(context, state.assignmentId,
                                      fetchAssignmentAfterUpdateorDelete)),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    const Color.fromRGBO(60, 141, 188, 1),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                              child: const Text("Delete")),
                        ),
                      ])
                ])));
  }

  static getScreen(
      int assignmentId, Function() fetchAssignmentAfterUpdateorDelete) {
    return getBaseScreen<DeleteAssignmentAppState, DeleteAssignemnt>(
        deleteAssignmentStateReducer,
        DeleteAssignmentAppState(assignmentId: assignmentId),
        DeleteAssignemnt(
            fetchAssignmentAfterUpdateorDelete:
                fetchAssignmentAfterUpdateorDelete));
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<DeleteAssignmentAppState>(context, action);
  }
}
