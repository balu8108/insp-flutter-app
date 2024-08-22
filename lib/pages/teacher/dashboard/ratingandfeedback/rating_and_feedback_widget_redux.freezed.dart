// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_and_feedback_widget_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RatingFeedbackWidgetAppState {
  List<LatestCompletedClassCardModel> get latestCompletedClassData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RatingFeedbackWidgetAppStateCopyWith<RatingFeedbackWidgetAppState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingFeedbackWidgetAppStateCopyWith<$Res> {
  factory $RatingFeedbackWidgetAppStateCopyWith(
          RatingFeedbackWidgetAppState value,
          $Res Function(RatingFeedbackWidgetAppState) then) =
      _$RatingFeedbackWidgetAppStateCopyWithImpl<$Res,
          RatingFeedbackWidgetAppState>;
  @useResult
  $Res call({List<LatestCompletedClassCardModel> latestCompletedClassData});
}

/// @nodoc
class _$RatingFeedbackWidgetAppStateCopyWithImpl<$Res,
        $Val extends RatingFeedbackWidgetAppState>
    implements $RatingFeedbackWidgetAppStateCopyWith<$Res> {
  _$RatingFeedbackWidgetAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestCompletedClassData = null,
  }) {
    return _then(_value.copyWith(
      latestCompletedClassData: null == latestCompletedClassData
          ? _value.latestCompletedClassData
          : latestCompletedClassData // ignore: cast_nullable_to_non_nullable
              as List<LatestCompletedClassCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingFeedbackWidgetAppStateImplCopyWith<$Res>
    implements $RatingFeedbackWidgetAppStateCopyWith<$Res> {
  factory _$$RatingFeedbackWidgetAppStateImplCopyWith(
          _$RatingFeedbackWidgetAppStateImpl value,
          $Res Function(_$RatingFeedbackWidgetAppStateImpl) then) =
      __$$RatingFeedbackWidgetAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LatestCompletedClassCardModel> latestCompletedClassData});
}

/// @nodoc
class __$$RatingFeedbackWidgetAppStateImplCopyWithImpl<$Res>
    extends _$RatingFeedbackWidgetAppStateCopyWithImpl<$Res,
        _$RatingFeedbackWidgetAppStateImpl>
    implements _$$RatingFeedbackWidgetAppStateImplCopyWith<$Res> {
  __$$RatingFeedbackWidgetAppStateImplCopyWithImpl(
      _$RatingFeedbackWidgetAppStateImpl _value,
      $Res Function(_$RatingFeedbackWidgetAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestCompletedClassData = null,
  }) {
    return _then(_$RatingFeedbackWidgetAppStateImpl(
      latestCompletedClassData: null == latestCompletedClassData
          ? _value._latestCompletedClassData
          : latestCompletedClassData // ignore: cast_nullable_to_non_nullable
              as List<LatestCompletedClassCardModel>,
    ));
  }
}

/// @nodoc

class _$RatingFeedbackWidgetAppStateImpl
    with DiagnosticableTreeMixin
    implements _RatingFeedbackWidgetAppState {
  const _$RatingFeedbackWidgetAppStateImpl(
      {final List<LatestCompletedClassCardModel> latestCompletedClassData =
          const []})
      : _latestCompletedClassData = latestCompletedClassData;

  final List<LatestCompletedClassCardModel> _latestCompletedClassData;
  @override
  @JsonKey()
  List<LatestCompletedClassCardModel> get latestCompletedClassData {
    if (_latestCompletedClassData is EqualUnmodifiableListView)
      return _latestCompletedClassData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestCompletedClassData);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RatingFeedbackWidgetAppState(latestCompletedClassData: $latestCompletedClassData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RatingFeedbackWidgetAppState'))
      ..add(DiagnosticsProperty(
          'latestCompletedClassData', latestCompletedClassData));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingFeedbackWidgetAppStateImpl &&
            const DeepCollectionEquality().equals(
                other._latestCompletedClassData, _latestCompletedClassData));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_latestCompletedClassData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingFeedbackWidgetAppStateImplCopyWith<
          _$RatingFeedbackWidgetAppStateImpl>
      get copyWith => __$$RatingFeedbackWidgetAppStateImplCopyWithImpl<
          _$RatingFeedbackWidgetAppStateImpl>(this, _$identity);
}

abstract class _RatingFeedbackWidgetAppState
    implements RatingFeedbackWidgetAppState {
  const factory _RatingFeedbackWidgetAppState(
      {final List<LatestCompletedClassCardModel>
          latestCompletedClassData}) = _$RatingFeedbackWidgetAppStateImpl;

  @override
  List<LatestCompletedClassCardModel> get latestCompletedClassData;
  @override
  @JsonKey(ignore: true)
  _$$RatingFeedbackWidgetAppStateImplCopyWith<
          _$RatingFeedbackWidgetAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
