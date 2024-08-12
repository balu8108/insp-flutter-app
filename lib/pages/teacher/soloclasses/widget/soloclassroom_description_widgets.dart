import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/apiservices/models/soloclasses/soloclass_topicwise_details_response_model.dart';
import 'package:inspflutterfrontend/data/hardcoded/library_subjects.dart';
import 'package:inspflutterfrontend/utils/file_box_component.dart';
import 'package:inspflutterfrontend/widget/card/lecture_recording_card.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';

class SoloclassroomDescriptionWidgets extends StatefulWidget {
  const SoloclassroomDescriptionWidgets(
      {super.key, required this.soloclasstopicdetail});
  final SoloclassTopicwiseDetailsResponseModel soloclasstopicdetail;

  @override
  State<SoloclassroomDescriptionWidgets> createState() =>
      _SoloclassroomDescriptionWidgetsState();
}

class _SoloclassroomDescriptionWidgetsState
    extends State<SoloclassroomDescriptionWidgets> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          INSPHeading(
              '( ${widget.soloclasstopicdetail.transformedData.topic} )'),
          const SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFF2C3329),
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      topicDescriptionConstants[int.parse(widget
                              .soloclasstopicdetail.transformedData.topicId)] ??
                          '',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromRGBO(44, 51, 41, 0.47),
                        height: 1.75,
                      ),
                      overflow: TextOverflow.visible,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                  width: 20), // Adjusted spacing between Description and Agenda
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Agenda',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF2C3329),
                        height: 1.25,
                      ),
                    ),
                    const SizedBox(height: 22),
                    agenda.isNotEmpty
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: agenda
                                .map<Widget>(
                                  (agendaItem) => Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 7,
                                            height: 7,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[400],
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            agendaItem,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Color.fromRGBO(
                                                  44, 51, 41, 0.47),
                                              height: 1.75,
                                            ),
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          )
                        : const Text(
                            'No Data',
                            style: TextStyle(
                              color: Color.fromRGBO(44, 51, 41, 0.47),
                              fontSize: 12,
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Recordings',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: Color(0xFF2C3329),
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 10),
              LectureRecordingCardWidget(
                  liveClassRoomRecordings: widget.soloclasstopicdetail
                      .transformedData.soloClassRoomRecordings,
                  topicName: widget.soloclasstopicdetail.transformedData.topic,
                  mentorName: "Nitin Sachan",
                  description: "",
                  files: widget
                      .soloclasstopicdetail.transformedData.soloClassRoomFiles,
                  agenda: "")
            ],
          ),
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Files/Notes',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF2C3329),
                  height: 1.25,
                ),
              ),
              const SizedBox(height: 10),
              FileBoxComponent(
                data: widget
                    .soloclasstopicdetail.transformedData.soloClassRoomFiles,
                type: "solo",
                scrollDirection: "horizontal",
                maxHeight: 60,
              )
            ],
          ),
        ],
      ),
    );
  }
}
