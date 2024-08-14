import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/utils/file_box_component.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/model/topic_assignment_card_model.dart';
import 'package:inspflutterfrontend/widget/popups/assignmentDelete/delete_assignment.dart';
import 'package:inspflutterfrontend/widget/popups/assignmentPopup/add_assignment.dart';

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
  @override
  void initState() {
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  Widget _buildHeading(BuildContext context) {
    return context.isWebOrLandScape()
        ? Row(
            children: [
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF3C8DBC),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.heading,
                    style: const TextStyle(
                        fontSize: 16, overflow: TextOverflow.ellipsis),
                  ),
                ],
              ),
              const Spacer(),
              // searchBox(context, _filterWithQueryText),
            ],
          )
        : Column(
            children: [
              INSPHeading(widget.heading),
              const SizedBox(height: 16),
              // searchBox(context, _filterWithQueryText),
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(
        children: [
          _buildHeading(context),
          const SizedBox(height: 16),
          Container(
              height: widget.allAssignemntofTopic.isNotEmpty
                  ? widget.allAssignemntofTopic.length * 200
                  : 100,
              margin: const EdgeInsets.only(right: 16),
              child: widget.allAssignemntofTopic.isNotEmpty
                  ? Scrollbar(
                      controller: _scrollController,
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: widget.allAssignemntofTopic.length,
                        itemBuilder: (context, index) {
                          final TopicAssignmentCardModel assignment =
                              widget.allAssignemntofTopic[index];
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
                                      Text(
                                        assignment.topicName,
                                        style: TextStyle(fontSize: 12),
                                      ),
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
                                        type: "live",
                                        scrollDirection: "horizontal",
                                        maxHeight: 60,
                                      )
                                    ],
                                  ),
                                ),
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
                                                    .fetchAssignmentAfterUpdateorDelete);
                                          });
                                      // Add your edit functionality here
                                    },
                                  ),
                                ),
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
                        },
                      ))
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
