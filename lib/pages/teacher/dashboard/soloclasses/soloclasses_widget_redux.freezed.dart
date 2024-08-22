// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soloclasses_widget_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SoloClassesWidgetAppState {
  List<LatestSoloClassCardModel> get latestSoloClassesData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SoloClassesWidgetAppStateCopyWith<SoloClassesWidgetAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoloClassesWidgetAppStateCopyWith<$Res> {
  factory $SoloClassesWidgetAppStateCopyWith(SoloClassesWidgetAppState value,
          $Res Function(SoloClassesWidgetAppState) then) =
      _$SoloClassesWidgetAppStateCopyWithImpl<$Res, SoloClassesWidgetAppState>;
  @useResult
  $Res call({List<LatestSoloClassCardModel> latestSoloClassesData});
}

/// @nodoc
class _$SoloClassesWidgetAppStateCopyWithImpl<$Res,
        $Val extends SoloClassesWidgetAppState>
    implements $SoloClassesWidgetAppStateCopyWith<$Res> {
  _$SoloClassesWidgetAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestSoloClassesData = null,
  }) {
    return _then(_value.copyWith(
      latestSoloClassesData: null == latestSoloClassesData
          ? _value.latestSoloClassesData
          : latestSoloClassesData // ignore: cast_nullable_to_non_nullable
              as List<LatestSoloClassCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoloClassesWidgetAppStateImplCopyWith<$Res>
    implements $SoloClassesWidgetAppStateCopyWith<$Res> {
  factory _$$SoloClassesWidgetAppStateImplCopyWith(
          _$SoloClassesWidgetAppStateImpl value,
          $Res Function(_$SoloClassesWidgetAppStateImpl) then) =
      __$$SoloClassesWidgetAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LatestSoloClassCardModel> latestSoloClassesData});
}

/// @nodoc
class __$$SoloClassesWidgetAppStateImplCopyWithImpl<$Res>
    extends _$SoloClassesWidgetAppStateCopyWithImpl<$Res,
        _$SoloClassesWidgetAppStateImpl>
    implements _$$SoloClassesWidgetAppStateImplCopyWith<$Res> {
  __$$SoloClassesWidgetAppStateImplCopyWithImpl(
      _$SoloClassesWidgetAppStateImpl _value,
      $Res Function(_$SoloClassesWidgetAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latestSoloClassesData = null,
  }) {
    return _then(_$SoloClassesWidgetAppStateImpl(
      latestSoloClassesData: null == latestSoloClassesData
          ? _value._latestSoloClassesData
          : latestSoloClassesData // ignore: cast_nullable_to_non_nullable
              as List<LatestSoloClassCardModel>,
    ));
  }
}

/// @nodoc

class _$SoloClassesWidgetAppStateImpl
    with DiagnosticableTreeMixin
    implements _SoloClassesWidgetAppState {
  const _$SoloClassesWidgetAppStateImpl(
      {final List<LatestSoloClassCardModel> latestSoloClassesData = const []})
      : _latestSoloClassesData = latestSoloClassesData;

  final List<LatestSoloClassCardModel> _latestSoloClassesData;
  @override
  @JsonKey()
  List<LatestSoloClassCardModel> get latestSoloClassesData {
    if (_latestSoloClassesData is EqualUnmodifiableListView)
      return _latestSoloClassesData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_latestSoloClassesData);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SoloClassesWidgetAppState(latestSoloClassesData: $latestSoloClassesData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SoloClassesWidgetAppState'))
      ..add(
          DiagnosticsProperty('latestSoloClassesData', latestSoloClassesData));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoloClassesWidgetAppStateImpl &&
            const DeepCollectionEquality()
                .equals(other._latestSoloClassesData, _latestSoloClassesData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_latestSoloClassesData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SoloClassesWidgetAppStateImplCopyWith<_$SoloClassesWidgetAppStateImpl>
      get copyWith => __$$SoloClassesWidgetAppStateImplCopyWithImpl<
          _$SoloClassesWidgetAppStateImpl>(this, _$identity);
}

abstract class _SoloClassesWidgetAppState implements SoloClassesWidgetAppState {
  const factory _SoloClassesWidgetAppState(
          {final List<LatestSoloClassCardModel> latestSoloClassesData}) =
      _$SoloClassesWidgetAppStateImpl;

  @override
  List<LatestSoloClassCardModel> get latestSoloClassesData;
  @override
  @JsonKey(ignore: true)
  _$$SoloClassesWidgetAppStateImplCopyWith<_$SoloClassesWidgetAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
