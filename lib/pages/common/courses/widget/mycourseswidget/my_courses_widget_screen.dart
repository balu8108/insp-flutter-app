import 'package:flutter/material.dart';
import 'package:inspflutterfrontend/widget/card/insp_card.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/model/insp_card_model.dart';
import 'package:inspflutterfrontend/pages/common/courses/widget/mycourseswidget/my_courses_widget_redux.dart';
import 'package:inspflutterfrontend/widget/popups/questiongenerate/question_generate.dart';

import '../../../../../data/hardcoded/mycourses_subjects.dart';

class MyCoursesWidget extends StatefulWidget {
  const MyCoursesWidget({super.key, required this.onViewDetailsClicked});

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;

  @override
  State<StatefulWidget> createState() {
    return MyCoursesWidgetState(onViewDetailsClicked);
  }
}

class MyCoursesWidgetState extends State<MyCoursesWidget> {
  MyCoursesWidgetAppState myCoursesWidgetAppState =
      const MyCoursesWidgetAppState();

  MyCoursesWidgetState(this.onViewDetailsClicked);

  final void Function(BuildContext, INSPCardModel) onViewDetailsClicked;
  final ScrollController _scrollController = ScrollController();

  void updateState(MyCoursesWidgetAppState myCoursesWidgetAppState) {
    setState(() {
      this.myCoursesWidgetAppState = myCoursesWidgetAppState;
    });
  }

  @override
  void initState() {
    super.initState();
    updateState(myCoursesWidgetAppState.copyWith(
        myCoursesInspCardModels: myCoursesData));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 9, child: INSPHeading('My Courses')),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 230.0,
            child: myCoursesWidgetAppState.myCoursesInspCardModels.isNotEmpty
                ? Scrollbar(
                    controller: _scrollController,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      controller: _scrollController,
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
