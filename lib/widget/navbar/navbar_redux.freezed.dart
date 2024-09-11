// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navbar_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavbarAppState {
  String get selectedButton => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NavbarAppStateCopyWith<NavbarAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavbarAppStateCopyWith<$Res> {
  factory $NavbarAppStateCopyWith(
          NavbarAppState value, $Res Function(NavbarAppState) then) =
      _$NavbarAppStateCopyWithImpl<$Res, NavbarAppState>;
  @useResult
  $Res call({String selectedButton});
}

/// @nodoc
class _$NavbarAppStateCopyWithImpl<$Res, $Val extends NavbarAppState>
    implements $NavbarAppStateCopyWith<$Res> {
  _$NavbarAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedButton = null,
  }) {
    return _then(_value.copyWith(
      selectedButton: null == selectedButton
          ? _value.selectedButton
          : selectedButton // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NavbarAppStateImplCopyWith<$Res>
    implements $NavbarAppStateCopyWith<$Res> {
  factory _$$NavbarAppStateImplCopyWith(_$NavbarAppStateImpl value,
          $Res Function(_$NavbarAppStateImpl) then) =
      __$$NavbarAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String selectedButton});
}

/// @nodoc
class __$$NavbarAppStateImplCopyWithImpl<$Res>
    extends _$NavbarAppStateCopyWithImpl<$Res, _$NavbarAppStateImpl>
    implements _$$NavbarAppStateImplCopyWith<$Res> {
  __$$NavbarAppStateImplCopyWithImpl(
      _$NavbarAppStateImpl _value, $Res Function(_$NavbarAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedButton = null,
  }) {
    return _then(_$NavbarAppStateImpl(
      selectedButton: null == selectedButton
          ? _value.selectedButton
          : selectedButton // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NavbarAppStateImpl implements _NavbarAppState {
  const _$NavbarAppStateImpl({this.selectedButton = 'Home'});

  @override
  @JsonKey()
  final String selectedButton;

  @override
  String toString() {
    return 'NavbarAppState(selectedButton: $selectedButton)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NavbarAppStateImpl &&
            (identical(other.selectedButton, selectedButton) ||
                other.selectedButton == selectedButton));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedButton);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NavbarAppStateImplCopyWith<_$NavbarAppStateImpl> get copyWith =>
      __$$NavbarAppStateImplCopyWithImpl<_$NavbarAppStateImpl>(
          this, _$identity);
}

abstract class _NavbarAppState implements NavbarAppState {
  const factory _NavbarAppState({final String selectedButton}) =
      _$NavbarAppStateImpl;

  @override
  String get selectedButton;
  @override
  @JsonKey(ignore: true)
  _$$NavbarAppStateImplCopyWith<_$NavbarAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
