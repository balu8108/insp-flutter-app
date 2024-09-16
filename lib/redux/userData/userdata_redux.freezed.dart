// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'userdata_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserDataAppState {
  LoginResponseModelResult get userData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserDataAppStateCopyWith<UserDataAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataAppStateCopyWith<$Res> {
  factory $UserDataAppStateCopyWith(
          UserDataAppState value, $Res Function(UserDataAppState) then) =
      _$UserDataAppStateCopyWithImpl<$Res, UserDataAppState>;
  @useResult
  $Res call({LoginResponseModelResult userData});
}

/// @nodoc
class _$UserDataAppStateCopyWithImpl<$Res, $Val extends UserDataAppState>
    implements $UserDataAppStateCopyWith<$Res> {
  _$UserDataAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = null,
  }) {
    return _then(_value.copyWith(
      userData: null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as LoginResponseModelResult,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataAppStateImplCopyWith<$Res>
    implements $UserDataAppStateCopyWith<$Res> {
  factory _$$UserDataAppStateImplCopyWith(_$UserDataAppStateImpl value,
          $Res Function(_$UserDataAppStateImpl) then) =
      __$$UserDataAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoginResponseModelResult userData});
}

/// @nodoc
class __$$UserDataAppStateImplCopyWithImpl<$Res>
    extends _$UserDataAppStateCopyWithImpl<$Res, _$UserDataAppStateImpl>
    implements _$$UserDataAppStateImplCopyWith<$Res> {
  __$$UserDataAppStateImplCopyWithImpl(_$UserDataAppStateImpl _value,
      $Res Function(_$UserDataAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userData = null,
  }) {
    return _then(_$UserDataAppStateImpl(
      null == userData
          ? _value.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as LoginResponseModelResult,
    ));
  }
}

/// @nodoc

class _$UserDataAppStateImpl implements _UserDataAppState {
  const _$UserDataAppStateImpl(
      [this.userData = const LoginResponseModelResult()]);

  @override
  @JsonKey()
  final LoginResponseModelResult userData;

  @override
  String toString() {
    return 'UserDataAppState(userData: $userData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataAppStateImpl &&
            (identical(other.userData, userData) ||
                other.userData == userData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataAppStateImplCopyWith<_$UserDataAppStateImpl> get copyWith =>
      __$$UserDataAppStateImplCopyWithImpl<_$UserDataAppStateImpl>(
          this, _$identity);
}

abstract class _UserDataAppState implements UserDataAppState {
  const factory _UserDataAppState([final LoginResponseModelResult userData]) =
      _$UserDataAppStateImpl;

  @override
  LoginResponseModelResult get userData;
  @override
  @JsonKey(ignore: true)
  _$$UserDataAppStateImplCopyWith<_$UserDataAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
