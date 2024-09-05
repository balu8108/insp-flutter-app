import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:inspflutterfrontend/base/base.dart';
import 'package:inspflutterfrontend/pages/common/calender/calendar_widget_redux.dart';
import 'package:inspflutterfrontend/utils/userDetail/getUserDetail.dart';
import 'package:inspflutterfrontend/widget/popups/timetableUpload/timetable_upload.dart';
import 'package:inspflutterfrontend/widget/popups/viewTimetable/view_timetable.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:universal_html/js_util.dart';

class LiveclassCalendar extends StatelessWidget {
  const LiveclassCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController _scrollController = ScrollController();

    dispatch(context, getAllCalendarDataDateWise(context));

    return StoreConnector<CalendarWidgetAppState, CalendarWidgetAppState>(
        converter: (store) => store.state,
        builder: (context, CalendarWidgetAppState state) => FutureBuilder<bool>(
            future: isTeacherLogin(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Error loading data'));
              } else {
                bool isTeacher = snapshot.data ?? false;
                return Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(
                          8.0), // Padding around the buttons
                      child: Row(
                        children: [
                          if (isTeacher)
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(200,
                                    50.0), // Set a fixed size for the button
                                backgroundColor: const Color.fromRGBO(
                                    60, 141, 188, 1), // Background color
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(5), // Border radius
                                ),
                              ),
                              onPressed: () {
                                // Handle "View Time Table" button press
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return const TimetableUpload();
                                    });
                              },
                              child: const Text(
                                'Upload Time Table',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(200, 50.0),
                              backgroundColor:
                                  const Color.fromRGBO(60, 141, 188, 1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const ViewTimetable();
                                  });
                            },
                            child: const Text(
                              'View Time Table',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      child: ValueListenableBuilder<DateTime>(
                        valueListenable: state.selectedDay,
                        builder: (context, selectedDay, _) {
                          return TableCalendar(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.utc(2030, 3, 14),
                            focusedDay: state.focusedDay,
                            calendarFormat: state.calendarFormat,
                            headerStyle: const HeaderStyle(
                              formatButtonVisible: false,
                              titleCentered: true,
                            ),
                            eventLoader: (day) {
                              return state.datewiseData[day] ?? [];
                            },
                            calendarBuilders: CalendarBuilders(
                              markerBuilder: (context, date, events) {
                                if (events.isNotEmpty) {
                                  return Positioned(
                                    right: 1,
                                    bottom: 1,
                                    child: _buildEventsMarker(date, events),
                                  );
                                }
                              },
                            ),
                            rowHeight: 50,
                            availableGestures: AvailableGestures.all,
                            selectedDayPredicate: (day) {
                              return isSameDay(selectedDay, day);
                            },
                            onDaySelected: (selectedDay, focusedDay) {
                              if (!isSameDay(
                                  state.selectedDay.value, selectedDay)) {
                                ValueNotifier<DateTime> selectedDay2 =
                                    ValueNotifier(selectedDay);
                                selectedDay2.value = selectedDay;
                                dispatch(
                                    context,
                                    UpdateSelectedDay(
                                        selectedDay: selectedDay2));

                                dispatch(context,
                                    UpdateFocusedDay(focusedDay: focusedDay));
                                dispatch(
                                    context,
                                    UpdateCalendarScreenDayWise(
                                        dataForOneDay:
                                            state.datewiseData[focusedDay] ??
                                                []));
                              }
                            },
                            onFormatChanged: (format) {
                              if (state.calendarFormat != format) {
                                dispatch(
                                    context,
                                    UpdateCalendarMonthFromat(
                                        calendarFormat: format));
                              }
                            },
                            onPageChanged: (focusedDay) {
                              dispatch(context,
                                  UpdateFocusedDay(focusedDay: focusedDay));
                            },
                            onDayLongPressed: (day, focusedDay) {
                              ValueNotifier<DateTime> selectedDay =
                                  ValueNotifier(day);
                              selectedDay.value = day;
                              dispatch(context,
                                  UpdateSelectedDay(selectedDay: selectedDay));
                            },
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        height: 500,
                        child: state.calendarScreenAllEventsForADay.isNotEmpty
                            ? Scrollbar(
                                controller: _scrollController,
                                child: ListView.separated(
                                  scrollDirection: Axis.vertical,
                                  itemCount: state
                                      .calendarScreenAllEventsForADay.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Rounded corners
                                        side: BorderSide(
                                          color: Colors.blue, // Border color
                                          width: 2.0, // Border width
                                        ),
                                      ),
                                      color:
                                          Colors.grey[200], // Background color
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Text(state
                                                .calendarScreenAllEventsForADay[
                                                    index]
                                                .title),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const SizedBox(
                                      width: 16,
                                    );
                                  },
                                ),
                              )
                            : null)
                  ],
                ));
              }
            }));
  }

  static getScreen() {
    return getBaseScreen<CalendarWidgetAppState, LiveclassCalendar>(
        calendarWidgetReducer,
        CalendarWidgetAppState(
            selectedDay: ValueNotifier<DateTime>(DateTime.now()),
            focusedDay: DateTime.now()),
        const LiveclassCalendar());
  }

  static dispatch(BuildContext context, dynamic action) {
    baseDispatch<CalendarWidgetAppState>(context, action);
  }
}

Widget _buildEventsMarker(DateTime date, List events) {
  return Container(
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Color.fromRGBO(60, 141, 188, 1),
      backgroundBlendMode: BlendMode.multiply,
    ),
    width: 16.0,
    height: 16.0,
    child: Center(
      child: Text(
        '${events.length}',
        style: TextStyle().copyWith(
          color: Colors.white,
          fontSize: 12.0,
        ),
      ),
    ),
  );
}
