// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_courses_widget_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyCoursesWidgetAppState {
  List<INSPCardModel> get myCoursesInspCardModels =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyCoursesWidgetAppStateCopyWith<MyCoursesWidgetAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyCoursesWidgetAppStateCopyWith<$Res> {
  factory $MyCoursesWidgetAppStateCopyWith(MyCoursesWidgetAppState value,
          $Res Function(MyCoursesWidgetAppState) then) =
      _$MyCoursesWidgetAppStateCopyWithImpl<$Res, MyCoursesWidgetAppState>;
  @useResult
  $Res call({List<INSPCardModel> myCoursesInspCardModels});
}

/// @nodoc
class _$MyCoursesWidgetAppStateCopyWithImpl<$Res,
        $Val extends MyCoursesWidgetAppState>
    implements $MyCoursesWidgetAppStateCopyWith<$Res> {
  _$MyCoursesWidgetAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myCoursesInspCardModels = null,
  }) {
    return _then(_value.copyWith(
      myCoursesInspCardModels: null == myCoursesInspCardModels
          ? _value.myCoursesInspCardModels
          : myCoursesInspCardModels // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MyCoursesWidgetAppStateImplCopyWith<$Res>
    implements $MyCoursesWidgetAppStateCopyWith<$Res> {
  factory _$$MyCoursesWidgetAppStateImplCopyWith(
          _$MyCoursesWidgetAppStateImpl value,
          $Res Function(_$MyCoursesWidgetAppStateImpl) then) =
      __$$MyCoursesWidgetAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<INSPCardModel> myCoursesInspCardModels});
}

/// @nodoc
class __$$MyCoursesWidgetAppStateImplCopyWithImpl<$Res>
    extends _$MyCoursesWidgetAppStateCopyWithImpl<$Res,
        _$MyCoursesWidgetAppStateImpl>
    implements _$$MyCoursesWidgetAppStateImplCopyWith<$Res> {
  __$$MyCoursesWidgetAppStateImplCopyWithImpl(
      _$MyCoursesWidgetAppStateImpl _value,
      $Res Function(_$MyCoursesWidgetAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? myCoursesInspCardModels = null,
  }) {
    return _then(_$MyCoursesWidgetAppStateImpl(
      null == myCoursesInspCardModels
          ? _value._myCoursesInspCardModels
          : myCoursesInspCardModels // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ));
  }
}

/// @nodoc

class _$MyCoursesWidgetAppStateImpl
    with DiagnosticableTreeMixin
    implements _MyCoursesWidgetAppState {
  const _$MyCoursesWidgetAppStateImpl(
      [final List<INSPCardModel> myCoursesInspCardModels = const []])
      : _myCoursesInspCardModels = myCoursesInspCardModels;

  final List<INSPCardModel> _myCoursesInspCardModels;
  @override
  @JsonKey()
  List<INSPCardModel> get myCoursesInspCardModels {
    if (_myCoursesInspCardModels is EqualUnmodifiableListView)
      return _myCoursesInspCardModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_myCoursesInspCardModels);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MyCoursesWidgetAppState(myCoursesInspCardModels: $myCoursesInspCardModels)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MyCoursesWidgetAppState'))
      ..add(DiagnosticsProperty(
          'myCoursesInspCardModels', myCoursesInspCardModels));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyCoursesWidgetAppStateImpl &&
            const DeepCollectionEquality().equals(
                other._myCoursesInspCardModels, _myCoursesInspCardModels));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_myCoursesInspCardModels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyCoursesWidgetAppStateImplCopyWith<_$MyCoursesWidgetAppStateImpl>
      get copyWith => __$$MyCoursesWidgetAppStateImplCopyWithImpl<
          _$MyCoursesWidgetAppStateImpl>(this, _$identity);
}

abstract class _MyCoursesWidgetAppState implements MyCoursesWidgetAppState {
  const factory _MyCoursesWidgetAppState(
          [final List<INSPCardModel> myCoursesInspCardModels]) =
      _$MyCoursesWidgetAppStateImpl;

  @override
  List<INSPCardModel> get myCoursesInspCardModels;
  @override
  @JsonKey(ignore: true)
  _$$MyCoursesWidgetAppStateImplCopyWith<_$MyCoursesWidgetAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
