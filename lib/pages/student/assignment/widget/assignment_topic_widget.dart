import 'package:flutter/material.dart';
import 'package:insp/utils/extensions.dart';
import 'package:insp/utils/file_box_component.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/model/topic_assignment_card_model.dart';
import 'package:insp/widget/popups/assignmentDelete/delete_assignment.dart';
import 'package:insp/widget/popups/assignmentPopup/add_assignment.dart';
import 'package:insp/widget/searchbox/search_box.dart';

class AssignmentTopicWidget extends StatefulWidget {
  const AssignmentTopicWidget(
      {super.key,
      required this.heading,
      required this.allAssignemntofTopic,
      required this.fetchAssignmentAfterUpdateorDelete});

  final String heading;
  final List<TopicAssignmentCardModel> allAssignemntofTopic;
  final Function() fetchAssignmentAfterUpdateorDelete;

  @override
  State<StatefulWidget> createState() {
    return _AssignmentTopicWidgetState();
  }
}

class _AssignmentTopicWidgetState extends State<AssignmentTopicWidget> {
  final ScrollController _scrollController = ScrollController();
  List<TopicAssignmentCardModel> filteredAssignmentTopics = [];

  @override
  void initState() {
    super.initState();
    filteredAssignmentTopics = widget.allAssignemntofTopic;
  }

  @override
  void didUpdateWidget(covariant AssignmentTopicWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.allAssignemntofTopic != widget.allAssignemntofTopic) {
      filteredAssignmentTopics = widget.allAssignemntofTopic;
    }
  }

  void _filterWithQueryText(String query) {
    if (query.isNotEmpty) {
      setState(() {
        filteredAssignmentTopics = widget.allAssignemntofTopic
            .where((it) =>
                it.topicName.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        filteredAssignmentTopics = widget.allAssignemntofTopic;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    void temporyFunction() {}
    bool isTeacher = isTeacherLogin(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(
        children: [
          isWebOrLandScape
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 5, child: INSPHeading(widget.heading)),
                    searchBox(context, _filterWithQueryText),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    INSPHeading(widget.heading),
                    const SizedBox(
                      height: 10,
                    ),
                    searchBox(context, _filterWithQueryText),
                  ],
                ),
          const SizedBox(height: 16),
          SizedBox(
              height: MediaQuery.of(context).size.height,
              child: filteredAssignmentTopics.isNotEmpty
                  ? Scrollbar(
                      controller: _scrollController,
                      child: ListView.separated(
                          scrollDirection: Axis.vertical,
                          controller: _scrollController,
                          itemCount: filteredAssignmentTopics.length,
                          itemBuilder: (context, index) {
                            final TopicAssignmentCardModel assignment =
                                filteredAssignmentTopics[index];
                            return Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                color: Colors.white,
                                child: Stack(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    assignment.topicName,
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )),
                                            ]),
                                        const SizedBox(height: 2),
                                        Text(
                                          assignment.instructorName,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  44, 51, 41, 0.47)),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 16),
                                        const Text(
                                          'Description',
                                          style: TextStyle(fontSize: 12),
                                        ),
                                        const SizedBox(height: 2),
                                        Text(
                                          assignment.description,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  44, 51, 41, 0.47)),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 16),
                                        FileBoxComponent(
                                          data: assignment.assignmentFiles,
                                          type: "assignment",
                                          scrollDirection: "horizontal",
                                          isTeacher: isTeacher,
                                        )
                                      ],
                                    ),
                                  ),
                                  if (isTeacher)
                                    Positioned(
                                      right: 64,
                                      top: 8,
                                      child: IconButton(
                                        icon: const Icon(Icons.edit,
                                            color: Colors.black),
                                        iconSize: 16.0, // Adjust the icon size
                                        padding: const EdgeInsets.all(4.0),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AddAssignment.getScreen(
                                                    assignment.id,
                                                    true,
                                                    'PHYSICS',
                                                    assignment.topicName,
                                                    assignment.description,
                                                    assignment.assignmentFiles,
                                                    widget
                                                        .fetchAssignmentAfterUpdateorDelete,
                                                    temporyFunction);
                                              });
                                          // Add your edit functionality here
                                        },
                                      ),
                                    ),
                                  if (isTeacher)
                                    Positioned(
                                      right: 8,
                                      top: 8,
                                      child: IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.black),
                                        iconSize: 16.0, // Adjust the icon size
                                        padding: const EdgeInsets.all(4.0),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return DeleteAssignemnt.getScreen(
                                                    assignment.id,
                                                    widget
                                                        .fetchAssignmentAfterUpdateorDelete);
                                              });
                                          // Add your edit functionality here
                                        },
                                      ),
                                    )
                                ]));
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 10,
                            );
                          }))
                  : const Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text(
                        'No assignments for this topic.',
                        style: TextStyle(fontSize: 12),
                      ),
                    ))
        ],
      ),
    );
  }
}
