// This file is "main.dart"
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:insp/apiservices/models/calendar/all_calendar_scheduled_data_model.dart';
import 'package:insp/pages/common/calender/widget/event_data_model.dart';
import 'package:insp/utils/userDetail/getUserDetail.dart';
import 'package:insp/apiservices/remote_data_source.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:table_calendar/table_calendar.dart';

// required: associates our `main.dart` with the code generated by Freezed
part 'calendar_widget_redux.freezed.dart';

// state
@freezed
class CalendarWidgetAppState with _$CalendarWidgetAppState {
  const factory CalendarWidgetAppState({
    @Default({}) Map<DateTime, List<Event>> datewiseData,
    required ValueNotifier<DateTime> selectedDay,
    required DateTime focusedDay,
    @Default(CalendarFormat.month) CalendarFormat calendarFormat,
    @Default([]) List<Event> calendarScreenAllEventsForADay,
  }) = _CalendarWidgetAppState;
}

// Reducer
CalendarWidgetAppState calendarWidgetReducer(
    CalendarWidgetAppState state, dynamic action) {
  return _calendarWidgetReducer(state, action);
}

// Action
abstract class CalendarWidgetAction {}

// datewise earlier
class UpdateDateWiseData extends CalendarWidgetAction {
  final Map<DateTime, List<Event>> data;
  UpdateDateWiseData({required this.data});
}

// selected day
class UpdateSelectedDay extends CalendarWidgetAction {
  final ValueNotifier<DateTime> selectedDay;
  UpdateSelectedDay({required this.selectedDay});
}

// focused day
class UpdateFocusedDay extends CalendarWidgetAction {
  final DateTime focusedDay;
  UpdateFocusedDay({required this.focusedDay});
}

// calendar format month
class UpdateCalendarMonthFromat extends CalendarWidgetAction {
  final CalendarFormat calendarFormat;
  UpdateCalendarMonthFromat({required this.calendarFormat});
}

class UpdateCalendarScreenDayWise extends CalendarWidgetAction {
  final List<Event> dataForOneDay;
  UpdateCalendarScreenDayWise({required this.dataForOneDay});
}

CalendarWidgetAppState _calendarWidgetReducer(
    CalendarWidgetAppState state, CalendarWidgetAction action) {
  if (action is UpdateDateWiseData) {
    return state.copyWith(datewiseData: action.data);
  }
  if (action is UpdateSelectedDay) {
    return state.copyWith(selectedDay: action.selectedDay);
  }
  if (action is UpdateFocusedDay) {
    return state.copyWith(focusedDay: action.focusedDay);
  }
  if (action is UpdateCalendarMonthFromat) {
    return state.copyWith(calendarFormat: action.calendarFormat);
  }

  if (action is UpdateCalendarScreenDayWise) {
    return state.copyWith(calendarScreenAllEventsForADay: action.dataForOneDay);
  }
  return state;
}

// Thunk action
ThunkAction<CalendarWidgetAppState> getAllCalendarDataDateWise(
    BuildContext context) {
  return (Store<CalendarWidgetAppState> store) async {
    try {
      final remoteDataSource = RemoteDataSource();
      String userToken = getUserToken(context);
      final allDateData = await remoteDataSource.getAllCalendarData(userToken);
      final List<CalendarModel> allCalendarDateResults =
          allDateData.data.data; // api response
      final List<Event> tempVariable = allCalendarDateResults
          .map((data) => Event(
              id: data.id,
              title: data.title,
              classType: data.classType,
              classLevel: data.classLevel,
              start: DateTime.parse(data.start),
              end: DateTime.parse(data.end)))
          .toList();

      final Map<DateTime, List<Event>> calendarEventData =
          _groupEvents(tempVariable);

      store.dispatch(UpdateDateWiseData(data: calendarEventData));
      DateTime todayMidnight = DateTime.utc(
          DateTime.now().year, DateTime.now().month, DateTime.now().day);

      store.dispatch(UpdateCalendarScreenDayWise(
          dataForOneDay: calendarEventData[todayMidnight] ?? []));
    } catch (error) {
      // Handle errors appropriately here
    }
  };
}

Map<DateTime, List<Event>> _groupEvents(List<Event> events) {
  Map<DateTime, List<Event>> data = {};
  for (var event in events) {
    DateTime date =
        DateTime.utc(event.start.year, event.start.month, event.start.day);
    if (data[date] == null) data[date] = [];
    data[date]!.add(event);
  }
  return data;
}
