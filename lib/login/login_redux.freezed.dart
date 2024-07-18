// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginAppState {
  String get emailId => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  bool get isPasswordVisible => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginAppStateCopyWith<LoginAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginAppStateCopyWith<$Res> {
  factory $LoginAppStateCopyWith(
          LoginAppState value, $Res Function(LoginAppState) then) =
      _$LoginAppStateCopyWithImpl<$Res, LoginAppState>;
  @useResult
  $Res call(
      {String emailId,
      String password,
      bool isPasswordVisible,
      bool isLoading});
}

/// @nodoc
class _$LoginAppStateCopyWithImpl<$Res, $Val extends LoginAppState>
    implements $LoginAppStateCopyWith<$Res> {
  _$LoginAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailId = null,
    Object? password = null,
    Object? isPasswordVisible = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      emailId: null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isPasswordVisible: null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginAppStateImplCopyWith<$Res>
    implements $LoginAppStateCopyWith<$Res> {
  factory _$$LoginAppStateImplCopyWith(
          _$LoginAppStateImpl value, $Res Function(_$LoginAppStateImpl) then) =
      __$$LoginAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String emailId,
      String password,
      bool isPasswordVisible,
      bool isLoading});
}

/// @nodoc
class __$$LoginAppStateImplCopyWithImpl<$Res>
    extends _$LoginAppStateCopyWithImpl<$Res, _$LoginAppStateImpl>
    implements _$$LoginAppStateImplCopyWith<$Res> {
  __$$LoginAppStateImplCopyWithImpl(
      _$LoginAppStateImpl _value, $Res Function(_$LoginAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailId = null,
    Object? password = null,
    Object? isPasswordVisible = null,
    Object? isLoading = null,
  }) {
    return _then(_$LoginAppStateImpl(
      null == emailId
          ? _value.emailId
          : emailId // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == isPasswordVisible
          ? _value.isPasswordVisible
          : isPasswordVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginAppStateImpl
    with DiagnosticableTreeMixin
    implements _LoginAppState {
  const _$LoginAppStateImpl(
      [this.emailId = '',
      this.password = '',
      this.isPasswordVisible = false,
      this.isLoading = false]);

  @override
  @JsonKey()
  final String emailId;
  @override
  @JsonKey()
  final String password;
  @override
  @JsonKey()
  final bool isPasswordVisible;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginAppState(emailId: $emailId, password: $password, isPasswordVisible: $isPasswordVisible, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginAppState'))
      ..add(DiagnosticsProperty('emailId', emailId))
      ..add(DiagnosticsProperty('password', password))
      ..add(DiagnosticsProperty('isPasswordVisible', isPasswordVisible))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginAppStateImpl &&
            (identical(other.emailId, emailId) || other.emailId == emailId) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isPasswordVisible, isPasswordVisible) ||
                other.isPasswordVisible == isPasswordVisible) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, emailId, password, isPasswordVisible, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginAppStateImplCopyWith<_$LoginAppStateImpl> get copyWith =>
      __$$LoginAppStateImplCopyWithImpl<_$LoginAppStateImpl>(this, _$identity);
}

abstract class _LoginAppState implements LoginAppState {
  const factory _LoginAppState(
      [final String emailId,
      final String password,
      final bool isPasswordVisible,
      final bool isLoading]) = _$LoginAppStateImpl;

  @override
  String get emailId;
  @override
  String get password;
  @override
  bool get isPasswordVisible;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$LoginAppStateImplCopyWith<_$LoginAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
