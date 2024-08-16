import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/widget/heading/insp_heading.dart';
import 'package:inspflutterfrontend/widget/card/insp_upcoming_class_card.dart';
import 'package:inspflutterfrontend/data/hardcoded/upcoming_classes.dart';
import 'package:inspflutterfrontend/pages/common/upcomingclasses/upcoming_class_widget_redux.dart';
import 'package:inspflutterfrontend/widget/popups/scheduleLiveclass/schedule_liveclass.dart';

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
            child: Column(children: [
              SizedBox(
                  width: double.infinity,
                  height: 39,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          WidgetStateProperty.all(const Color(0xFF3C8DBC)),
                      foregroundColor:
                          WidgetStateProperty.all(const Color(0xFF3C8DBC)),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8.0), // Adjust border radius as needed
                        ),
                      ),
                      padding: WidgetStateProperty.all(
                          const EdgeInsets.symmetric(vertical: 12.0)),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ScheduleLiveClass.getScreen(0, false, '', '',
                                '', '', '', '', '', '', '', '', '', false, []);
                          });
                    },
                    child: const Text(
                      'Schedule Class',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.0,
                      ),
                    ),
                  )),
              const SizedBox(
                height: 17,
              ),
              SizedBox(
                height: 700,
                child: classCategories.isNotEmpty
                    ? ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: classCategories.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      flex: 9,
                                      child: INSPHeading(
                                          classCategories[index].label)),
                                ],
                              ),
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
              )
            ])));
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
