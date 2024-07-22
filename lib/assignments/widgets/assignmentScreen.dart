import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/assignmentCoursesWidgets/assignment_course_widgets.dart';
import 'package:inspflutterfrontend/assignments/widgets/assignment_screen_redux.dart';
import 'package:inspflutterfrontend/common/model/insp_card_model.dart';
import 'package:inspflutterfrontend/home/my_app_bar.dart';
import 'package:inspflutterfrontend/mycourses/my_courses_redux.dart';
import 'package:inspflutterfrontend/upcomingclasseswidget/upcoming_class_screen.dart';
import '../../base/base.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});
  @override
  Widget build(BuildContext context) {
    void onPressedMyCourse(BuildContext context, INSPCardModel inspCardModel) {
      dispatch(context, showSelectedItem(context, inspCardModel));
    }

    void callCourseApi() {
      dispatch(context, getMyCourses(context));
    }

    return Scaffold(
        appBar: MyAppBar(),
        body: StoreConnector<AssignmentScreenAppState,
                AssignmentScreenAppState>(
            converter: (store) => store.state,
            builder: (context, AssignmentScreenAppState state) => Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              AssignmentCourseWidgets(
                                onViewDetailsClicked: onPressedMyCourse,
                                callCourseApi: callCourseApi,
                              ),
                              const SizedBox(height: 16),
                              if (state.selectedItem.name == "Mathematics" ||
                                  state.selectedItem.name == "Chemistry")
                                Column(
                                  children: [
                                    if (state.selectedItem.name ==
                                        "Mathematics")
                                      Image.asset(
                                          'assets/images/mathematics.png')
                                    else
                                      Image.asset('assets/images/science.png'),
                                    const SizedBox(height: 16),
                                    const Text(
                                      "Coming Soon",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                )
                              else
                                const Text("Physics Page"),
                            ],
                          ),
                        ),
                        const SizedBox(width: 17),
                        const Expanded(
                          flex: 1,
                          child: UpcomingClassesScreen(),
                        ),
                      ],
                    ),
                  ),
                ))));
  }

  static getScreen(INSPCardModel selectedItem) {
    return getBaseScreen<AssignmentScreenAppState, AssignmentScreen>(
        assignmentCoursesStateReducer,
        AssignmentScreenAppState(selectedItem: selectedItem),
        const AssignmentScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<AssignmentScreenAppState>(context, action);
  }
}
