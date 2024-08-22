// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_widget_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarWidgetAppState {
  Map<DateTime, List<Event>> get datewiseData =>
      throw _privateConstructorUsedError;
  ValueNotifier<DateTime> get selectedDay => throw _privateConstructorUsedError;
  DateTime get focusedDay => throw _privateConstructorUsedError;
  CalendarFormat get calendarFormat => throw _privateConstructorUsedError;
  List<Event> get calendarScreenAllEventsForADay =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarWidgetAppStateCopyWith<CalendarWidgetAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarWidgetAppStateCopyWith<$Res> {
  factory $CalendarWidgetAppStateCopyWith(CalendarWidgetAppState value,
          $Res Function(CalendarWidgetAppState) then) =
      _$CalendarWidgetAppStateCopyWithImpl<$Res, CalendarWidgetAppState>;
  @useResult
  $Res call(
      {Map<DateTime, List<Event>> datewiseData,
      ValueNotifier<DateTime> selectedDay,
      DateTime focusedDay,
      CalendarFormat calendarFormat,
      List<Event> calendarScreenAllEventsForADay});
}

/// @nodoc
class _$CalendarWidgetAppStateCopyWithImpl<$Res,
        $Val extends CalendarWidgetAppState>
    implements $CalendarWidgetAppStateCopyWith<$Res> {
  _$CalendarWidgetAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datewiseData = null,
    Object? selectedDay = null,
    Object? focusedDay = null,
    Object? calendarFormat = null,
    Object? calendarScreenAllEventsForADay = null,
  }) {
    return _then(_value.copyWith(
      datewiseData: null == datewiseData
          ? _value.datewiseData
          : datewiseData // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<Event>>,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as ValueNotifier<DateTime>,
      focusedDay: null == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      calendarFormat: null == calendarFormat
          ? _value.calendarFormat
          : calendarFormat // ignore: cast_nullable_to_non_nullable
              as CalendarFormat,
      calendarScreenAllEventsForADay: null == calendarScreenAllEventsForADay
          ? _value.calendarScreenAllEventsForADay
          : calendarScreenAllEventsForADay // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarWidgetAppStateImplCopyWith<$Res>
    implements $CalendarWidgetAppStateCopyWith<$Res> {
  factory _$$CalendarWidgetAppStateImplCopyWith(
          _$CalendarWidgetAppStateImpl value,
          $Res Function(_$CalendarWidgetAppStateImpl) then) =
      __$$CalendarWidgetAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<DateTime, List<Event>> datewiseData,
      ValueNotifier<DateTime> selectedDay,
      DateTime focusedDay,
      CalendarFormat calendarFormat,
      List<Event> calendarScreenAllEventsForADay});
}

/// @nodoc
class __$$CalendarWidgetAppStateImplCopyWithImpl<$Res>
    extends _$CalendarWidgetAppStateCopyWithImpl<$Res,
        _$CalendarWidgetAppStateImpl>
    implements _$$CalendarWidgetAppStateImplCopyWith<$Res> {
  __$$CalendarWidgetAppStateImplCopyWithImpl(
      _$CalendarWidgetAppStateImpl _value,
      $Res Function(_$CalendarWidgetAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? datewiseData = null,
    Object? selectedDay = null,
    Object? focusedDay = null,
    Object? calendarFormat = null,
    Object? calendarScreenAllEventsForADay = null,
  }) {
    return _then(_$CalendarWidgetAppStateImpl(
      datewiseData: null == datewiseData
          ? _value._datewiseData
          : datewiseData // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, List<Event>>,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as ValueNotifier<DateTime>,
      focusedDay: null == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      calendarFormat: null == calendarFormat
          ? _value.calendarFormat
          : calendarFormat // ignore: cast_nullable_to_non_nullable
              as CalendarFormat,
      calendarScreenAllEventsForADay: null == calendarScreenAllEventsForADay
          ? _value._calendarScreenAllEventsForADay
          : calendarScreenAllEventsForADay // ignore: cast_nullable_to_non_nullable
              as List<Event>,
    ));
  }
}

/// @nodoc

class _$CalendarWidgetAppStateImpl
    with DiagnosticableTreeMixin
    implements _CalendarWidgetAppState {
  const _$CalendarWidgetAppStateImpl(
      {final Map<DateTime, List<Event>> datewiseData = const {},
      required this.selectedDay,
      required this.focusedDay,
      this.calendarFormat = CalendarFormat.month,
      final List<Event> calendarScreenAllEventsForADay = const []})
      : _datewiseData = datewiseData,
        _calendarScreenAllEventsForADay = calendarScreenAllEventsForADay;

  final Map<DateTime, List<Event>> _datewiseData;
  @override
  @JsonKey()
  Map<DateTime, List<Event>> get datewiseData {
    if (_datewiseData is EqualUnmodifiableMapView) return _datewiseData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_datewiseData);
  }

  @override
  final ValueNotifier<DateTime> selectedDay;
  @override
  final DateTime focusedDay;
  @override
  @JsonKey()
  final CalendarFormat calendarFormat;
  final List<Event> _calendarScreenAllEventsForADay;
  @override
  @JsonKey()
  List<Event> get calendarScreenAllEventsForADay {
    if (_calendarScreenAllEventsForADay is EqualUnmodifiableListView)
      return _calendarScreenAllEventsForADay;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_calendarScreenAllEventsForADay);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CalendarWidgetAppState(datewiseData: $datewiseData, selectedDay: $selectedDay, focusedDay: $focusedDay, calendarFormat: $calendarFormat, calendarScreenAllEventsForADay: $calendarScreenAllEventsForADay)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CalendarWidgetAppState'))
      ..add(DiagnosticsProperty('datewiseData', datewiseData))
      ..add(DiagnosticsProperty('selectedDay', selectedDay))
      ..add(DiagnosticsProperty('focusedDay', focusedDay))
      ..add(DiagnosticsProperty('calendarFormat', calendarFormat))
      ..add(DiagnosticsProperty(
          'calendarScreenAllEventsForADay', calendarScreenAllEventsForADay));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarWidgetAppStateImpl &&
            const DeepCollectionEquality()
                .equals(other._datewiseData, _datewiseData) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            (identical(other.focusedDay, focusedDay) ||
                other.focusedDay == focusedDay) &&
            (identical(other.calendarFormat, calendarFormat) ||
                other.calendarFormat == calendarFormat) &&
            const DeepCollectionEquality().equals(
                other._calendarScreenAllEventsForADay,
                _calendarScreenAllEventsForADay));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_datewiseData),
      selectedDay,
      focusedDay,
      calendarFormat,
      const DeepCollectionEquality().hash(_calendarScreenAllEventsForADay));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarWidgetAppStateImplCopyWith<_$CalendarWidgetAppStateImpl>
      get copyWith => __$$CalendarWidgetAppStateImplCopyWithImpl<
          _$CalendarWidgetAppStateImpl>(this, _$identity);
}

abstract class _CalendarWidgetAppState implements CalendarWidgetAppState {
  const factory _CalendarWidgetAppState(
          {final Map<DateTime, List<Event>> datewiseData,
          required final ValueNotifier<DateTime> selectedDay,
          required final DateTime focusedDay,
          final CalendarFormat calendarFormat,
          final List<Event> calendarScreenAllEventsForADay}) =
      _$CalendarWidgetAppStateImpl;

  @override
  Map<DateTime, List<Event>> get datewiseData;
  @override
  ValueNotifier<DateTime> get selectedDay;
  @override
  DateTime get focusedDay;
  @override
  CalendarFormat get calendarFormat;
  @override
  List<Event> get calendarScreenAllEventsForADay;
  @override
  @JsonKey(ignore: true)
  _$$CalendarWidgetAppStateImplCopyWith<_$CalendarWidgetAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
