// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_assignment_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DeleteAssignmentAppState {
  int get assignmentId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeleteAssignmentAppStateCopyWith<DeleteAssignmentAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteAssignmentAppStateCopyWith<$Res> {
  factory $DeleteAssignmentAppStateCopyWith(DeleteAssignmentAppState value,
          $Res Function(DeleteAssignmentAppState) then) =
      _$DeleteAssignmentAppStateCopyWithImpl<$Res, DeleteAssignmentAppState>;
  @useResult
  $Res call({int assignmentId});
}

/// @nodoc
class _$DeleteAssignmentAppStateCopyWithImpl<$Res,
        $Val extends DeleteAssignmentAppState>
    implements $DeleteAssignmentAppStateCopyWith<$Res> {
  _$DeleteAssignmentAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignmentId = null,
  }) {
    return _then(_value.copyWith(
      assignmentId: null == assignmentId
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeleteAssignmentAppStateImplCopyWith<$Res>
    implements $DeleteAssignmentAppStateCopyWith<$Res> {
  factory _$$DeleteAssignmentAppStateImplCopyWith(
          _$DeleteAssignmentAppStateImpl value,
          $Res Function(_$DeleteAssignmentAppStateImpl) then) =
      __$$DeleteAssignmentAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int assignmentId});
}

/// @nodoc
class __$$DeleteAssignmentAppStateImplCopyWithImpl<$Res>
    extends _$DeleteAssignmentAppStateCopyWithImpl<$Res,
        _$DeleteAssignmentAppStateImpl>
    implements _$$DeleteAssignmentAppStateImplCopyWith<$Res> {
  __$$DeleteAssignmentAppStateImplCopyWithImpl(
      _$DeleteAssignmentAppStateImpl _value,
      $Res Function(_$DeleteAssignmentAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? assignmentId = null,
  }) {
    return _then(_$DeleteAssignmentAppStateImpl(
      assignmentId: null == assignmentId
          ? _value.assignmentId
          : assignmentId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteAssignmentAppStateImpl
    with DiagnosticableTreeMixin
    implements _DeleteAssignmentAppState {
  const _$DeleteAssignmentAppStateImpl({required this.assignmentId});

  @override
  final int assignmentId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'DeleteAssignmentAppState(assignmentId: $assignmentId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DeleteAssignmentAppState'))
      ..add(DiagnosticsProperty('assignmentId', assignmentId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAssignmentAppStateImpl &&
            (identical(other.assignmentId, assignmentId) ||
                other.assignmentId == assignmentId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, assignmentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAssignmentAppStateImplCopyWith<_$DeleteAssignmentAppStateImpl>
      get copyWith => __$$DeleteAssignmentAppStateImplCopyWithImpl<
          _$DeleteAssignmentAppStateImpl>(this, _$identity);
}

abstract class _DeleteAssignmentAppState implements DeleteAssignmentAppState {
  const factory _DeleteAssignmentAppState({required final int assignmentId}) =
      _$DeleteAssignmentAppStateImpl;

  @override
  int get assignmentId;
  @override
  @JsonKey(ignore: true)
  _$$DeleteAssignmentAppStateImplCopyWith<_$DeleteAssignmentAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
