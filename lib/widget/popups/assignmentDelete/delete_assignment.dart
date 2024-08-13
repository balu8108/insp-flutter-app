import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/widget/popups/assignmentDelete/delete_assignment_redux.dart';

class DeleteAssignemnt extends StatelessWidget {
  const DeleteAssignemnt({super.key});

  @override
  Widget build(BuildContext context) {
    void createAssignment(int assignmentId) {
      dispatch(context, deleteAssignment(context, assignmentId));
    }

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
                            Navigator.of(context).pop(); // Close the dialog
                          },
                        ),
                      ],
                    ),
                    content: const SizedBox(
                      height: 50,
                      width: 500, // Set your desired width here
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
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
                        Container(
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black,
                                backgroundColor:
                                    Color.fromARGB(255, 244, 238, 238),
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
                        Container(
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () =>
                                  createAssignment(state.assignmentId),
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

  static getScreen(int assignmentId) {
    return getBaseScreen<DeleteAssignmentAppState, DeleteAssignemnt>(
        deleteAssignmentStateReducer,
        DeleteAssignmentAppState(assignmentId: assignmentId),
        const DeleteAssignemnt());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<DeleteAssignmentAppState>(context, action);
  }
}
