import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/main.dart';
import 'package:inspflutterfrontend/pages/common/alltopicswidget/all_topics_widget.dart';
import 'package:inspflutterfrontend/pages/student/assignment/assignmenttopic/assignment_topic_screen.dart';
import 'package:inspflutterfrontend/utils/extensions.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';

class MyUploads extends StatelessWidget {
  const MyUploads({super.key});

  @override
  Widget build(BuildContext context) {
    bool isWebOrLandScape = context.isWebOrLandScape();
    void onPressedMyCourse(BuildContext context, INSPCardModel selectedTopic) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MainScaffold(
                content: AssignmentTopicScreen.getScreen(selectedTopic))),
      );
    }

    return Container(
      padding: isWebOrLandScape
          ? const EdgeInsets.all(10.0)
          : const EdgeInsets.all(0.0),
      color: Colors.white,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AllTopicWidget.getScreen(
                        heading: 'My Uploads',
                        onPressedViewDetails: onPressedMyCourse)
                  ],
                ),
              ),
              const SizedBox(width: 17),
              if (isWebOrLandScape)
                const Expanded(
                  flex: 3,
                  child: UpcomingClassesScreen(),
                ),
            ],
          )),
    );
  }
}
