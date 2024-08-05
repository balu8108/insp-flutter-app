import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/insp_upcoming_class_card.dart';
import 'package:inspflutterfrontend/data/hardcoded/upcoming_classes.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_widget_redux.dart';

class UpcomingClassesScreen extends StatelessWidget {
  const UpcomingClassesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    dispatch(context, getAllUpcomingClass(context));
    return StoreConnector<UpcomingWidgetAppState, UpcomingWidgetAppState>(
        converter: (store) => store.state,
        builder: (context, UpcomingWidgetAppState state) => Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.fromRGBO(232, 242, 249, 1),
            ),
            child: SizedBox(
                height: 700,
                child: Container(
                  child: classCategories.isNotEmpty
                      ? ListView.separated(
                          scrollDirection: Axis.vertical,
                          itemCount: classCategories.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                INSPHeading(classCategories[index].label),
                                const SizedBox(height: 20),
                                ScheduleClassBox(
                                    type: classCategories[index].category,
                                    upcomingWidgetAppState: state.weeklyData),
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              width: 17,
                            );
                          })
                      : const Center(child: Text('No items')),
                ))));
  }

  static getScreen() {
    return getBaseScreen<UpcomingWidgetAppState, UpcomingClassesScreen>(
        upcomingWidgetReducer,
        const UpcomingWidgetAppState(),
        const UpcomingClassesScreen());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<UpcomingWidgetAppState>(context, action);
  }
}
