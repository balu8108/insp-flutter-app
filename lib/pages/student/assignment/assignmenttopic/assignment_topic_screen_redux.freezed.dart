// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment_topic_screen_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssignmentTopicScreenAppState {
  INSPCardModel get selectedtopic => throw _privateConstructorUsedError;
  List<TopicAssignmentCardModel> get allAssignmentOfTopic =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AssignmentTopicScreenAppStateCopyWith<AssignmentTopicScreenAppState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignmentTopicScreenAppStateCopyWith<$Res> {
  factory $AssignmentTopicScreenAppStateCopyWith(
          AssignmentTopicScreenAppState value,
          $Res Function(AssignmentTopicScreenAppState) then) =
      _$AssignmentTopicScreenAppStateCopyWithImpl<$Res,
          AssignmentTopicScreenAppState>;
  @useResult
  $Res call(
      {INSPCardModel selectedtopic,
      List<TopicAssignmentCardModel> allAssignmentOfTopic});
}

/// @nodoc
class _$AssignmentTopicScreenAppStateCopyWithImpl<$Res,
        $Val extends AssignmentTopicScreenAppState>
    implements $AssignmentTopicScreenAppStateCopyWith<$Res> {
  _$AssignmentTopicScreenAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedtopic = null,
    Object? allAssignmentOfTopic = null,
  }) {
    return _then(_value.copyWith(
      selectedtopic: null == selectedtopic
          ? _value.selectedtopic
          : selectedtopic // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allAssignmentOfTopic: null == allAssignmentOfTopic
          ? _value.allAssignmentOfTopic
          : allAssignmentOfTopic // ignore: cast_nullable_to_non_nullable
              as List<TopicAssignmentCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignmentTopicScreenAppStateImplCopyWith<$Res>
    implements $AssignmentTopicScreenAppStateCopyWith<$Res> {
  factory _$$AssignmentTopicScreenAppStateImplCopyWith(
          _$AssignmentTopicScreenAppStateImpl value,
          $Res Function(_$AssignmentTopicScreenAppStateImpl) then) =
      __$$AssignmentTopicScreenAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {INSPCardModel selectedtopic,
      List<TopicAssignmentCardModel> allAssignmentOfTopic});
}

/// @nodoc
class __$$AssignmentTopicScreenAppStateImplCopyWithImpl<$Res>
    extends _$AssignmentTopicScreenAppStateCopyWithImpl<$Res,
        _$AssignmentTopicScreenAppStateImpl>
    implements _$$AssignmentTopicScreenAppStateImplCopyWith<$Res> {
  __$$AssignmentTopicScreenAppStateImplCopyWithImpl(
      _$AssignmentTopicScreenAppStateImpl _value,
      $Res Function(_$AssignmentTopicScreenAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedtopic = null,
    Object? allAssignmentOfTopic = null,
  }) {
    return _then(_$AssignmentTopicScreenAppStateImpl(
      selectedtopic: null == selectedtopic
          ? _value.selectedtopic
          : selectedtopic // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allAssignmentOfTopic: null == allAssignmentOfTopic
          ? _value._allAssignmentOfTopic
          : allAssignmentOfTopic // ignore: cast_nullable_to_non_nullable
              as List<TopicAssignmentCardModel>,
    ));
  }
}

/// @nodoc

class _$AssignmentTopicScreenAppStateImpl
    with DiagnosticableTreeMixin
    implements _AssignmentTopicScreenAppState {
  const _$AssignmentTopicScreenAppStateImpl(
      {required this.selectedtopic,
      final List<TopicAssignmentCardModel> allAssignmentOfTopic = const []})
      : _allAssignmentOfTopic = allAssignmentOfTopic;

  @override
  final INSPCardModel selectedtopic;
  final List<TopicAssignmentCardModel> _allAssignmentOfTopic;
  @override
  @JsonKey()
  List<TopicAssignmentCardModel> get allAssignmentOfTopic {
    if (_allAssignmentOfTopic is EqualUnmodifiableListView)
      return _allAssignmentOfTopic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allAssignmentOfTopic);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AssignmentTopicScreenAppState(selectedtopic: $selectedtopic, allAssignmentOfTopic: $allAssignmentOfTopic)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AssignmentTopicScreenAppState'))
      ..add(DiagnosticsProperty('selectedtopic', selectedtopic))
      ..add(DiagnosticsProperty('allAssignmentOfTopic', allAssignmentOfTopic));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignmentTopicScreenAppStateImpl &&
            (identical(other.selectedtopic, selectedtopic) ||
                other.selectedtopic == selectedtopic) &&
            const DeepCollectionEquality()
                .equals(other._allAssignmentOfTopic, _allAssignmentOfTopic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedtopic,
      const DeepCollectionEquality().hash(_allAssignmentOfTopic));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignmentTopicScreenAppStateImplCopyWith<
          _$AssignmentTopicScreenAppStateImpl>
      get copyWith => __$$AssignmentTopicScreenAppStateImplCopyWithImpl<
          _$AssignmentTopicScreenAppStateImpl>(this, _$identity);
}

abstract class _AssignmentTopicScreenAppState
    implements AssignmentTopicScreenAppState {
  const factory _AssignmentTopicScreenAppState(
          {required final INSPCardModel selectedtopic,
          final List<TopicAssignmentCardModel> allAssignmentOfTopic}) =
      _$AssignmentTopicScreenAppStateImpl;

  @override
  INSPCardModel get selectedtopic;
  @override
  List<TopicAssignmentCardModel> get allAssignmentOfTopic;
  @override
  @JsonKey(ignore: true)
  _$$AssignmentTopicScreenAppStateImplCopyWith<
          _$AssignmentTopicScreenAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
