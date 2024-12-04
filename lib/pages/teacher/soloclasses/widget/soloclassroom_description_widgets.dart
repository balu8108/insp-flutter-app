import 'package:flutter/material.dart';
import 'package:insp/apiservices/models/soloclasses/soloclass_topicwise_details_response_model.dart';
import 'package:insp/data/hardcoded/library_subjects.dart';
import 'package:insp/utils/file_box_component.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/card/model/insp_card_model.dart';
import 'package:insp/widget/card/solo_recording_card.dart';
import 'package:insp/widget/heading/insp_heading.dart';

class SoloclassroomDescriptionWidgets extends StatefulWidget {
  const SoloclassroomDescriptionWidgets(
      {super.key,
      required this.soloclasstopicdetail,
      required this.selectedTopic});
  final SoloclassTopicwiseDetailsResponseModel soloclasstopicdetail;
  final INSPCardModel selectedTopic;

  @override
  State<SoloclassroomDescriptionWidgets> createState() =>
      _SoloclassroomDescriptionWidgetsState();
}

class _SoloclassroomDescriptionWidgetsState
    extends State<SoloclassroomDescriptionWidgets> {
  @override
  Widget build(BuildContext context) {
    bool isTeacher = isTeacherLogin(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600; // Adjust this threshold as necessary

    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromRGBO(232, 242, 249, 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 9, child: INSPHeading(widget.selectedTopic.name)),
            ],
          ),
          const SizedBox(height: 40),
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDescriptionSection(),
                    const SizedBox(height: 20),
                    buildAgendaSection(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: buildDescriptionSection()),
                    const SizedBox(width: 20),
                    Expanded(child: buildAgendaSection()),
                  ],
                ),
          const SizedBox(height: 40),
          buildRecordingsSection(),
          const SizedBox(height: 40),
          buildFilesSection(isTeacher),
        ],
      ),
    );
  }

  Widget buildDescriptionSection() {
    return Column(
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
        if (widget.selectedTopic.id.isNotEmpty)
          Text(
            topicDescriptionConstants[int.parse(widget.selectedTopic.id)]!,
            style: const TextStyle(
              fontSize: 12,
              color: Color.fromRGBO(44, 51, 41, 0.47),
              height: 1.75,
            ),
            overflow: TextOverflow.visible,
          ),
      ],
    );
  }

  Widget buildAgendaSection() {
    return Column(
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 7,
                                height: 7,
                                decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                agendaItem,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(44, 51, 41, 0.47),
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
    );
  }

  Widget buildRecordingsSection() {
    return Column(
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
        SoloRecordingCardWidget(
          soloClassRoomRecordings: widget
              .soloclasstopicdetail.transformedData.soloClassRoomRecordings,
        ),
      ],
    );
  }

  Widget buildFilesSection(bool isTeacher) {
    return Column(
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
            data:
                widget.soloclasstopicdetail.transformedData.soloClassRoomFiles,
            type: "solo",
            scrollDirection: "horizontal",
            isTeacher: isTeacher,
            isRecordingScreen: false),
      ],
    );
  }
}
