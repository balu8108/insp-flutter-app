import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/common/extensions.dart';
import 'package:inspflutterfrontend/common/insp_card.dart';
import 'package:inspflutterfrontend/common/insp_heading.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/mycourseswidget/my_courses_widget_redux.dart';

import '../data/hardcoded/mycourses_subjects.dart';
import '../data/hardcoded/secret_key.dart';
import '../data/remote/models/mycourses/all_subjects_request_model.dart';
import '../data/remote/remote_data_source.dart';

class MyCoursesWidget extends StatefulWidget {
  const MyCoursesWidget(
      {super.key,
      required this.onViewDetailsClicked,
      required this.callCourseApi});

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;
  final void Function() callCourseApi;

  @override
  State<StatefulWidget> createState() {
    return MyCoursesWidgetState(onViewDetailsClicked, callCourseApi);
  }
}

class MyCoursesWidgetState extends State<MyCoursesWidget> {
  MyCoursesWidgetAppState myCoursesWidgetAppState =
      const MyCoursesWidgetAppState();

  MyCoursesWidgetState(this.onViewDetailsClicked, this.callCourseApi);

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;
  final void Function() callCourseApi;

  void updateState(MyCoursesWidgetAppState myCoursesWidgetAppState) {
    setState(() {
      this.myCoursesWidgetAppState = myCoursesWidgetAppState;
    });
  }

  @override
  void initState() {
    super.initState();
    // callCourseApi();
    updateState(myCoursesWidgetAppState.copyWith(
        myCoursesInspCardModels: myCoursesData));
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
          INSPHeading('My Courses'),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 220.0,
            child: myCoursesWidgetAppState.myCoursesInspCardModels.isNotEmpty
                ? Scrollbar(
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: myCoursesWidgetAppState
                          .myCoursesInspCardModels.length,
                      itemBuilder: (BuildContext context, int index) {
                        return INSPCard(
                            inspCardModel: myCoursesWidgetAppState
                                .myCoursesInspCardModels[index],
                            context: context,
                            onPressedViewDetails: onViewDetailsClicked);
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 16,
                        );
                      },
                    ),
                  )
                : const Center(child: Text('No items')),
          ),
        ],
      ),
    );
  }
}
