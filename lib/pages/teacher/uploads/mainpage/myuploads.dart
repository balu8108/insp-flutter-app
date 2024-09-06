import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:inspflutterfrontend/pages/common/alltopicswidget/all_topics_widget.dart';
import 'package:inspflutterfrontend/pages/student/assignment/assignmenttopic/assignment_topic_screen.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/widget/navbar/navbar.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_screen.dart';

class MyUploads extends StatelessWidget {
  const MyUploads({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        kIsWeb || Platform.isWindows || Platform.isLinux || Platform.isMacOS;
    void onPressedMyCourse(BuildContext context, INSPCardModel selectedTopic) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                AssignmentTopicScreen.getScreen(selectedTopic)),
      );
    }

    return Scaffold(
      appBar: Navbar(),
      body: Container(
          padding: const EdgeInsets.all(32.0),
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
                  if (isDesktop) ...[
                    Expanded(
                      flex: 3,
                      child: const UpcomingClassesScreen(),
                    ),
                  ]
                ],
              ))),
    );
  }
}
