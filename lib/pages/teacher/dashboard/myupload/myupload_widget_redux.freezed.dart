// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'myupload_widget_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyUploadWidgetAppState {
  List<LatestAssignmentCardModel> get myUploadData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyUploadWidgetAppStateCopyWith<MyUploadWidgetAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyUploadWidgetAppStateCopyWith<$Res> {
  factory $MyUploadWidgetAppStateCopyWith(MyUploadWidgetAppState value,
          $Res Function(MyUploadWidgetAppState) then) =
      _$MyUploadWidgetAppStateCopyWithImpl<$Res, MyUploadWidgetAppState>;
  @useResult
  $Res call({List<LatestAssignmentCardModel> myUploadData});
}

/// @nodoc
class _$MyUploadWidgetAppStateCopyWithImpl<$Res,
        $Val extends MyUploadWidgetAppState>
    implements $MyUploadWidgetAppStateCopyWith<$Res> {
  _$MyUploadWidgetAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myUploadData = null,
  }) {
    return _then(_value.copyWith(
      myUploadData: null == myUploadData
          ? _value.myUploadData
          : myUploadData // ignore: cast_nullable_to_non_nullable
              as List<LatestAssignmentCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyUploadWidgetAppStateImplCopyWith<$Res>
    implements $MyUploadWidgetAppStateCopyWith<$Res> {
  factory _$$MyUploadWidgetAppStateImplCopyWith(
          _$MyUploadWidgetAppStateImpl value,
          $Res Function(_$MyUploadWidgetAppStateImpl) then) =
      __$$MyUploadWidgetAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LatestAssignmentCardModel> myUploadData});
}

/// @nodoc
class __$$MyUploadWidgetAppStateImplCopyWithImpl<$Res>
    extends _$MyUploadWidgetAppStateCopyWithImpl<$Res,
        _$MyUploadWidgetAppStateImpl>
    implements _$$MyUploadWidgetAppStateImplCopyWith<$Res> {
  __$$MyUploadWidgetAppStateImplCopyWithImpl(
      _$MyUploadWidgetAppStateImpl _value,
      $Res Function(_$MyUploadWidgetAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myUploadData = null,
  }) {
    return _then(_$MyUploadWidgetAppStateImpl(
      myUploadData: null == myUploadData
          ? _value._myUploadData
          : myUploadData // ignore: cast_nullable_to_non_nullable
              as List<LatestAssignmentCardModel>,
    ));
  }
}

/// @nodoc

class _$MyUploadWidgetAppStateImpl
    with DiagnosticableTreeMixin
    implements _MyUploadWidgetAppState {
  const _$MyUploadWidgetAppStateImpl(
      {final List<LatestAssignmentCardModel> myUploadData = const []})
      : _myUploadData = myUploadData;

  final List<LatestAssignmentCardModel> _myUploadData;
  @override
  @JsonKey()
  List<LatestAssignmentCardModel> get myUploadData {
    if (_myUploadData is EqualUnmodifiableListView) return _myUploadData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myUploadData);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyUploadWidgetAppState(myUploadData: $myUploadData)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyUploadWidgetAppState'))
      ..add(DiagnosticsProperty('myUploadData', myUploadData));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyUploadWidgetAppStateImpl &&
            const DeepCollectionEquality()
                .equals(other._myUploadData, _myUploadData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_myUploadData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyUploadWidgetAppStateImplCopyWith<_$MyUploadWidgetAppStateImpl>
      get copyWith => __$$MyUploadWidgetAppStateImplCopyWithImpl<
          _$MyUploadWidgetAppStateImpl>(this, _$identity);
}

abstract class _MyUploadWidgetAppState implements MyUploadWidgetAppState {
  const factory _MyUploadWidgetAppState(
          {final List<LatestAssignmentCardModel> myUploadData}) =
      _$MyUploadWidgetAppStateImpl;

  @override
  List<LatestAssignmentCardModel> get myUploadData;
  @override
  @JsonKey(ignore: true)
  _$$MyUploadWidgetAppStateImplCopyWith<_$MyUploadWidgetAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
