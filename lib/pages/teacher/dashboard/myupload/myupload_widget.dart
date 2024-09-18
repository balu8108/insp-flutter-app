import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/base/base.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/latest_assignment_card.dart';
import 'package:insp/pages/teacher/dashboard/myupload/myupload_widget_redux.dart';
import 'package:insp/widget/popups/assignmentPopup/add_assignment.dart';

class MyUpload extends StatelessWidget {
  const MyUpload({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    void temporyFunction() {}

    void getAssignment() {
      dispatch(context, getLatestAssigmentapi(context));
    }

    dispatch(context, getLatestAssigmentapi(context));

    return Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
        child: StoreConnector<MyUploadWidgetAppState, MyUploadWidgetAppState>(
            converter: (store) => store.state,
            builder: (context, MyUploadWidgetAppState state) => Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: const Color.fromRGBO(232, 242, 249, 1),
                  ),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 5, child: INSPHeading('My Uploads')),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AddAssignment.getScreen(
                                      0,
                                      false,
                                      '',
                                      '',
                                      '',
                                      [],
                                      temporyFunction,
                                      getAssignment);
                                });
                          },
                          child: const Text(
                            "+ Add Assignment",
                            style: TextStyle(color: Color(0xFF3C8DBC)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    SizedBox(
                        height: 200.0,
                        child: state.myUploadData.isNotEmpty
                            ? Scrollbar(
                                controller: scrollController,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  controller: scrollController,
                                  itemCount: state.myUploadData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return LatestAssignmentCard(
                                        assignmentCardModel:
                                            state.myUploadData[index],
                                        context: context);
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      width: 16,
                                    );
                                  },
                                ),
                              )
                            : const Center(child: Text('No item')))
                  ]),
                )));
  }

  static getScreen() {
    return getBaseScreen<MyUploadWidgetAppState, MyUpload>(
        myUploadWidgetReducer,
        const MyUploadWidgetAppState(),
        const MyUpload());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<MyUploadWidgetAppState>(context, action);
  }
}
