// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_timer_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PollTimerAppState {
  int get timer => throw _privateConstructorUsedError;
  bool get isTimerInitialized => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PollTimerAppStateCopyWith<PollTimerAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollTimerAppStateCopyWith<$Res> {
  factory $PollTimerAppStateCopyWith(
          PollTimerAppState value, $Res Function(PollTimerAppState) then) =
      _$PollTimerAppStateCopyWithImpl<$Res, PollTimerAppState>;
  @useResult
  $Res call({int timer, bool isTimerInitialized});
}

/// @nodoc
class _$PollTimerAppStateCopyWithImpl<$Res, $Val extends PollTimerAppState>
    implements $PollTimerAppStateCopyWith<$Res> {
  _$PollTimerAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timer = null,
    Object? isTimerInitialized = null,
  }) {
    return _then(_value.copyWith(
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as int,
      isTimerInitialized: null == isTimerInitialized
          ? _value.isTimerInitialized
          : isTimerInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollTimerAppStateImplCopyWith<$Res>
    implements $PollTimerAppStateCopyWith<$Res> {
  factory _$$PollTimerAppStateImplCopyWith(_$PollTimerAppStateImpl value,
          $Res Function(_$PollTimerAppStateImpl) then) =
      __$$PollTimerAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int timer, bool isTimerInitialized});
}

/// @nodoc
class __$$PollTimerAppStateImplCopyWithImpl<$Res>
    extends _$PollTimerAppStateCopyWithImpl<$Res, _$PollTimerAppStateImpl>
    implements _$$PollTimerAppStateImplCopyWith<$Res> {
  __$$PollTimerAppStateImplCopyWithImpl(_$PollTimerAppStateImpl _value,
      $Res Function(_$PollTimerAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timer = null,
    Object? isTimerInitialized = null,
  }) {
    return _then(_$PollTimerAppStateImpl(
      timer: null == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as int,
      isTimerInitialized: null == isTimerInitialized
          ? _value.isTimerInitialized
          : isTimerInitialized // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PollTimerAppStateImpl implements _PollTimerAppState {
  const _$PollTimerAppStateImpl(
      {this.timer = 0, this.isTimerInitialized = false});

  @override
  @JsonKey()
  final int timer;
  @override
  @JsonKey()
  final bool isTimerInitialized;

  @override
  String toString() {
    return 'PollTimerAppState(timer: $timer, isTimerInitialized: $isTimerInitialized)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollTimerAppStateImpl &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.isTimerInitialized, isTimerInitialized) ||
                other.isTimerInitialized == isTimerInitialized));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timer, isTimerInitialized);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PollTimerAppStateImplCopyWith<_$PollTimerAppStateImpl> get copyWith =>
      __$$PollTimerAppStateImplCopyWithImpl<_$PollTimerAppStateImpl>(
          this, _$identity);
}

abstract class _PollTimerAppState implements PollTimerAppState {
  const factory _PollTimerAppState(
      {final int timer,
      final bool isTimerInitialized}) = _$PollTimerAppStateImpl;

  @override
  int get timer;
  @override
  bool get isTimerInitialized;
  @override
  @JsonKey(ignore: true)
  _$$PollTimerAppStateImplCopyWith<_$PollTimerAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
