// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment_courses_widget_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssignmentCoursesWidgetAppState {
  List<INSPCardModel> get assignmentCoursesInspCardModels =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AssignmentCoursesWidgetAppStateCopyWith<AssignmentCoursesWidgetAppState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignmentCoursesWidgetAppStateCopyWith<$Res> {
  factory $AssignmentCoursesWidgetAppStateCopyWith(
          AssignmentCoursesWidgetAppState value,
          $Res Function(AssignmentCoursesWidgetAppState) then) =
      _$AssignmentCoursesWidgetAppStateCopyWithImpl<$Res,
          AssignmentCoursesWidgetAppState>;
  @useResult
  $Res call({List<INSPCardModel> assignmentCoursesInspCardModels});
}

/// @nodoc
class _$AssignmentCoursesWidgetAppStateCopyWithImpl<$Res,
        $Val extends AssignmentCoursesWidgetAppState>
    implements $AssignmentCoursesWidgetAppStateCopyWith<$Res> {
  _$AssignmentCoursesWidgetAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignmentCoursesInspCardModels = null,
  }) {
    return _then(_value.copyWith(
      assignmentCoursesInspCardModels: null == assignmentCoursesInspCardModels
          ? _value.assignmentCoursesInspCardModels
          : assignmentCoursesInspCardModels // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignmentCoursesWidgetAppStateImplCopyWith<$Res>
    implements $AssignmentCoursesWidgetAppStateCopyWith<$Res> {
  factory _$$AssignmentCoursesWidgetAppStateImplCopyWith(
          _$AssignmentCoursesWidgetAppStateImpl value,
          $Res Function(_$AssignmentCoursesWidgetAppStateImpl) then) =
      __$$AssignmentCoursesWidgetAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<INSPCardModel> assignmentCoursesInspCardModels});
}

/// @nodoc
class __$$AssignmentCoursesWidgetAppStateImplCopyWithImpl<$Res>
    extends _$AssignmentCoursesWidgetAppStateCopyWithImpl<$Res,
        _$AssignmentCoursesWidgetAppStateImpl>
    implements _$$AssignmentCoursesWidgetAppStateImplCopyWith<$Res> {
  __$$AssignmentCoursesWidgetAppStateImplCopyWithImpl(
      _$AssignmentCoursesWidgetAppStateImpl _value,
      $Res Function(_$AssignmentCoursesWidgetAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignmentCoursesInspCardModels = null,
  }) {
    return _then(_$AssignmentCoursesWidgetAppStateImpl(
      null == assignmentCoursesInspCardModels
          ? _value._assignmentCoursesInspCardModels
          : assignmentCoursesInspCardModels // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ));
  }
}

/// @nodoc

class _$AssignmentCoursesWidgetAppStateImpl
    implements _AssignmentCoursesWidgetAppState {
  const _$AssignmentCoursesWidgetAppStateImpl(
      [final List<INSPCardModel> assignmentCoursesInspCardModels = const []])
      : _assignmentCoursesInspCardModels = assignmentCoursesInspCardModels;

  final List<INSPCardModel> _assignmentCoursesInspCardModels;
  @override
  @JsonKey()
  List<INSPCardModel> get assignmentCoursesInspCardModels {
    if (_assignmentCoursesInspCardModels is EqualUnmodifiableListView)
      return _assignmentCoursesInspCardModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignmentCoursesInspCardModels);
  }

  @override
  String toString() {
    return 'AssignmentCoursesWidgetAppState(assignmentCoursesInspCardModels: $assignmentCoursesInspCardModels)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignmentCoursesWidgetAppStateImpl &&
            const DeepCollectionEquality().equals(
                other._assignmentCoursesInspCardModels,
                _assignmentCoursesInspCardModels));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_assignmentCoursesInspCardModels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignmentCoursesWidgetAppStateImplCopyWith<
          _$AssignmentCoursesWidgetAppStateImpl>
      get copyWith => __$$AssignmentCoursesWidgetAppStateImplCopyWithImpl<
          _$AssignmentCoursesWidgetAppStateImpl>(this, _$identity);
}

abstract class _AssignmentCoursesWidgetAppState
    implements AssignmentCoursesWidgetAppState {
  const factory _AssignmentCoursesWidgetAppState(
          [final List<INSPCardModel> assignmentCoursesInspCardModels]) =
      _$AssignmentCoursesWidgetAppStateImpl;

  @override
  List<INSPCardModel> get assignmentCoursesInspCardModels;
  @override
  @JsonKey(ignore: true)
  _$$AssignmentCoursesWidgetAppStateImplCopyWith<
          _$AssignmentCoursesWidgetAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
