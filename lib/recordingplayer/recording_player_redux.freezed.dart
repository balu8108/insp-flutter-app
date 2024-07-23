// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_player_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordingPlayerAppState {
  RecordingPlayerCard get selectedItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordingPlayerAppStateCopyWith<RecordingPlayerAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordingPlayerAppStateCopyWith<$Res> {
  factory $RecordingPlayerAppStateCopyWith(RecordingPlayerAppState value,
          $Res Function(RecordingPlayerAppState) then) =
      _$RecordingPlayerAppStateCopyWithImpl<$Res, RecordingPlayerAppState>;
  @useResult
  $Res call({RecordingPlayerCard selectedItem});
}

/// @nodoc
class _$RecordingPlayerAppStateCopyWithImpl<$Res,
        $Val extends RecordingPlayerAppState>
    implements $RecordingPlayerAppStateCopyWith<$Res> {
  _$RecordingPlayerAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
  }) {
    return _then(_value.copyWith(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as RecordingPlayerCard,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordingPlayerAppStateImplCopyWith<$Res>
    implements $RecordingPlayerAppStateCopyWith<$Res> {
  factory _$$RecordingPlayerAppStateImplCopyWith(
          _$RecordingPlayerAppStateImpl value,
          $Res Function(_$RecordingPlayerAppStateImpl) then) =
      __$$RecordingPlayerAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RecordingPlayerCard selectedItem});
}

/// @nodoc
class __$$RecordingPlayerAppStateImplCopyWithImpl<$Res>
    extends _$RecordingPlayerAppStateCopyWithImpl<$Res,
        _$RecordingPlayerAppStateImpl>
    implements _$$RecordingPlayerAppStateImplCopyWith<$Res> {
  __$$RecordingPlayerAppStateImplCopyWithImpl(
      _$RecordingPlayerAppStateImpl _value,
      $Res Function(_$RecordingPlayerAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
  }) {
    return _then(_$RecordingPlayerAppStateImpl(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as RecordingPlayerCard,
    ));
  }
}

/// @nodoc

class _$RecordingPlayerAppStateImpl
    with DiagnosticableTreeMixin
    implements _RecordingPlayerAppState {
  const _$RecordingPlayerAppStateImpl({required this.selectedItem});

  @override
  final RecordingPlayerCard selectedItem;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecordingPlayerAppState(selectedItem: $selectedItem)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecordingPlayerAppState'))
      ..add(DiagnosticsProperty('selectedItem', selectedItem));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingPlayerAppStateImpl &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingPlayerAppStateImplCopyWith<_$RecordingPlayerAppStateImpl>
      get copyWith => __$$RecordingPlayerAppStateImplCopyWithImpl<
          _$RecordingPlayerAppStateImpl>(this, _$identity);
}

abstract class _RecordingPlayerAppState implements RecordingPlayerAppState {
  const factory _RecordingPlayerAppState(
          {required final RecordingPlayerCard selectedItem}) =
      _$RecordingPlayerAppStateImpl;

  @override
  RecordingPlayerCard get selectedItem;
  @override
  @JsonKey(ignore: true)
  _$$RecordingPlayerAppStateImplCopyWith<_$RecordingPlayerAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
