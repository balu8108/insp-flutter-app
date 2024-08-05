import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/latest_assignment_card.dart';
import 'package:inspflutterfrontend/common/model/latest_assignment_card_model.dart';
import 'package:inspflutterfrontend/data/remote/remote_data_source.dart';
import 'package:inspflutterfrontend/myuploads/myupload_widget_redux.dart';
import 'package:inspflutterfrontend/popups/add_assignment.dart';

import '../utils/capitalize.dart';

class MyUploadScreen extends StatefulWidget {
  const MyUploadScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyUploadWidgetState();
  }
}

class MyUploadWidgetState extends State {
  MyUploadWidgetAppState myUploadWidgetAppState =
      const MyUploadWidgetAppState(myUploadData: []);

  MyUploadWidgetState();

  ScrollController _scrollController = ScrollController();

  void updateState(MyUploadWidgetAppState myUploadWidgetAppState) {
    setState(() {
      this.myUploadWidgetAppState = myUploadWidgetAppState;
    });
  }

  // call an API of get all subjects
  void getAllLatestAssignmentClasses() async {
    final remoteDataSource = RemoteDataSource();
    const token = 'Token 3adf1ab5b437ebe26888186e6a6163d3';
    final latestAssignment = await remoteDataSource.getLatestAssignment(token);
    if (latestAssignment.data.data.isNotEmpty) {
      var allAssignmentResults = latestAssignment.data.data;

      final latestSoloCardModels = allAssignmentResults
          .map((latestAssignmentResult) => LatestAssignmentCardModel(
              latestAssignmentResult.id.toString(),
              latestAssignmentResult.topicName == ""
                  ? "General"
                  : capitalizeFirstLetter(latestAssignmentResult.topicName),
              latestAssignmentResult.topicId,
              latestAssignmentResult.instructorName,
              latestAssignmentResult.description))
          .toList();

      updateState(
          myUploadWidgetAppState.copyWith(myUploadData: latestSoloCardModels));
    }
  }

  @override
  void initState() {
    super.initState();
    getAllLatestAssignmentClasses();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            INSPHeading('My Uploads'),
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AddAssignment();
                    });
              },
              child: Text("+ Add Assignment"),
            ),
          ],
        ),
        const SizedBox(
          height: 17,
        ),
        const SizedBox(
          height: 17,
        ),
        SizedBox(
            height: 200.0,
            child: myUploadWidgetAppState.myUploadData.isNotEmpty
                ? Scrollbar(
                    controller: _scrollController,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: myUploadWidgetAppState.myUploadData.length,
                      itemBuilder: (BuildContext context, int index) {
                        return LatestAssignmentCard(
                            assignmentCardModel:
                                myUploadWidgetAppState.myUploadData[index],
                            context: context);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 16,
                        );
                      },
                    ),
                  )
                : const Center(child: Text('No item')))
      ]),
    );
  }
}
