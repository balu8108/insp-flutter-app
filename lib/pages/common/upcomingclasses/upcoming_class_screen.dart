import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:insp/redux/AppState.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/widget/heading/insp_heading.dart';
import 'package:insp/widget/card/insp_upcoming_class_card.dart';
import 'package:insp/data/hardcoded/upcoming_classes.dart';
import 'package:insp/pages/common/upcomingclasses/upcoming_class_widget_redux.dart';
import 'package:insp/widget/popups/scheduleLiveclass/schedule_liveclass.dart';

class UpcomingClassesScreen extends StatelessWidget {
  const UpcomingClassesScreen({super.key});
  static void dispatch(BuildContext context, UpcomingWidgetAction action) {
    StoreProvider.of<AppState>(context).dispatch(action);
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    bool isTeacher = isTeacherLogin(context);
    final store = StoreProvider.of<AppState>(context);
    store.dispatch(getAllUpcomingClass(context));

    void getUpcomingClass() {
      store.dispatch(getAllUpcomingClass(context));
    }

    return StoreConnector<AppState, UpcomingWidgetAppState>(
      converter: (store) => store.state.upcomingWidgetAppState,
      builder: (context, UpcomingWidgetAppState state) => Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color.fromRGBO(232, 242, 249, 1),
        ),
        child: Column(
          children: [
            if (isTeacher)
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
                        return ScheduleLiveClass.getScreen(
                            0,
                            false,
                            '',
                            '',
                            '',
                            '',
                            '',
                            '',
                            '',
                            '',
                            '',
                            '',
                            '',
                            false,
                            [],
                            getUpcomingClass);
                      },
                    );
                  },
                  child: const Text(
                    'Schedule Class',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            const SizedBox(height: 17),
            Expanded(
              child: classCategories.isNotEmpty
                  ? ListView.separated(
                      scrollDirection: Axis.vertical,
                      controller: scrollController,
                      itemCount: classCategories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 9,
                                  child:
                                      INSPHeading(classCategories[index].label),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ScheduleClassBox(
                                type: classCategories[index].category,
                                upcomingWidgetAppState: state.weeklyData,
                                getUpcomingClass: getUpcomingClass),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 20,
                        );
                      },
                    )
                  : const Center(
                      child: Text(
                      'No items',
                      style: TextStyle(color: Color.fromRGBO(44, 51, 41, 0.47)),
                    )),
            )
          ],
        ),
      ),
    );
  }
}
