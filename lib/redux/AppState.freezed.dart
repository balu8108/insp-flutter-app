// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AppState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  LoginAppState get loginState => throw _privateConstructorUsedError;
  UpcomingWidgetAppState get upcomingWidgetAppState =>
      throw _privateConstructorUsedError;
  ChatWidgetAppState get chatWidgetAppState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {LoginAppState loginState,
      UpcomingWidgetAppState upcomingWidgetAppState,
      ChatWidgetAppState chatWidgetAppState});

  $LoginAppStateCopyWith<$Res> get loginState;
  $UpcomingWidgetAppStateCopyWith<$Res> get upcomingWidgetAppState;
  $ChatWidgetAppStateCopyWith<$Res> get chatWidgetAppState;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginState = null,
    Object? upcomingWidgetAppState = null,
    Object? chatWidgetAppState = null,
  }) {
    return _then(_value.copyWith(
      loginState: null == loginState
          ? _value.loginState
          : loginState // ignore: cast_nullable_to_non_nullable
              as LoginAppState,
      upcomingWidgetAppState: null == upcomingWidgetAppState
          ? _value.upcomingWidgetAppState
          : upcomingWidgetAppState // ignore: cast_nullable_to_non_nullable
              as UpcomingWidgetAppState,
      chatWidgetAppState: null == chatWidgetAppState
          ? _value.chatWidgetAppState
          : chatWidgetAppState // ignore: cast_nullable_to_non_nullable
              as ChatWidgetAppState,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LoginAppStateCopyWith<$Res> get loginState {
    return $LoginAppStateCopyWith<$Res>(_value.loginState, (value) {
      return _then(_value.copyWith(loginState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UpcomingWidgetAppStateCopyWith<$Res> get upcomingWidgetAppState {
    return $UpcomingWidgetAppStateCopyWith<$Res>(_value.upcomingWidgetAppState,
        (value) {
      return _then(_value.copyWith(upcomingWidgetAppState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatWidgetAppStateCopyWith<$Res> get chatWidgetAppState {
    return $ChatWidgetAppStateCopyWith<$Res>(_value.chatWidgetAppState,
        (value) {
      return _then(_value.copyWith(chatWidgetAppState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LoginAppState loginState,
      UpcomingWidgetAppState upcomingWidgetAppState,
      ChatWidgetAppState chatWidgetAppState});

  @override
  $LoginAppStateCopyWith<$Res> get loginState;
  @override
  $UpcomingWidgetAppStateCopyWith<$Res> get upcomingWidgetAppState;
  @override
  $ChatWidgetAppStateCopyWith<$Res> get chatWidgetAppState;
}

/// @nodoc
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginState = null,
    Object? upcomingWidgetAppState = null,
    Object? chatWidgetAppState = null,
  }) {
    return _then(_$AppStateImpl(
      loginState: null == loginState
          ? _value.loginState
          : loginState // ignore: cast_nullable_to_non_nullable
              as LoginAppState,
      upcomingWidgetAppState: null == upcomingWidgetAppState
          ? _value.upcomingWidgetAppState
          : upcomingWidgetAppState // ignore: cast_nullable_to_non_nullable
              as UpcomingWidgetAppState,
      chatWidgetAppState: null == chatWidgetAppState
          ? _value.chatWidgetAppState
          : chatWidgetAppState // ignore: cast_nullable_to_non_nullable
              as ChatWidgetAppState,
    ));
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(
      {required this.loginState,
      required this.upcomingWidgetAppState,
      required this.chatWidgetAppState});

  @override
  final LoginAppState loginState;
  @override
  final UpcomingWidgetAppState upcomingWidgetAppState;
  @override
  final ChatWidgetAppState chatWidgetAppState;

  @override
  String toString() {
    return 'AppState(loginState: $loginState, upcomingWidgetAppState: $upcomingWidgetAppState, chatWidgetAppState: $chatWidgetAppState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
            (identical(other.loginState, loginState) ||
                other.loginState == loginState) &&
            (identical(other.upcomingWidgetAppState, upcomingWidgetAppState) ||
                other.upcomingWidgetAppState == upcomingWidgetAppState) &&
            (identical(other.chatWidgetAppState, chatWidgetAppState) ||
                other.chatWidgetAppState == chatWidgetAppState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, loginState, upcomingWidgetAppState, chatWidgetAppState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      {required final LoginAppState loginState,
      required final UpcomingWidgetAppState upcomingWidgetAppState,
      required final ChatWidgetAppState chatWidgetAppState}) = _$AppStateImpl;

  @override
  LoginAppState get loginState;
  @override
  UpcomingWidgetAppState get upcomingWidgetAppState;
  @override
  ChatWidgetAppState get chatWidgetAppState;
  @override
  @JsonKey(ignore: true)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
