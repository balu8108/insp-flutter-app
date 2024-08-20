import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/utils/file_box_component.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/card/model/lecture_assignment_card_model.dart';

class LectureAssignmentCard extends StatelessWidget {
  final List<LectureAssignmentCardModel> assignmentDetails;

  const LectureAssignmentCard({Key? key, required this.assignmentDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();
    return Container(
        height:
            assignmentDetails.isNotEmpty ? assignmentDetails.length * 200 : 100,
        margin: const EdgeInsets.only(right: 16),
        child: assignmentDetails.isNotEmpty
            ? Scrollbar(
                controller: _scrollController,
                child: FutureBuilder<bool>(
                    future: isTeacherLogin(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return const Center(child: Text('Error loading data'));
                      } else {
                        bool isTeacher = snapshot.data ?? false;
                        return ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: assignmentDetails.length,
                          itemBuilder: (context, index) {
                            final assignment = assignmentDetails[index];
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18),
                              ),
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Description',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      assignment.description,
                                      style: const TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromRGBO(44, 51, 41, 0.47)),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    const SizedBox(height: 16),
                                    FileBoxComponent(
                                      data: assignment.assignmentFiles,
                                      type: "live",
                                      scrollDirection: "horizontal",
                                      maxHeight: 60,
                                      isTeacher: isTeacher,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 10,
                            );
                          },
                        );
                      }
                    }))
            : const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'No assignments for this topic.',
                  style: TextStyle(fontSize: 12),
                ),
              ));
  }
}
