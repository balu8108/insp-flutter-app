// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_lecture_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TopicLectureAppState {
  INSPCardModel get selectedTopic => throw _privateConstructorUsedError;
  List<INSPCardModel> get allTopics => throw _privateConstructorUsedError;
  List<LectureCardModel> get allTopicBasedLecture =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TopicLectureAppStateCopyWith<TopicLectureAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicLectureAppStateCopyWith<$Res> {
  factory $TopicLectureAppStateCopyWith(TopicLectureAppState value,
          $Res Function(TopicLectureAppState) then) =
      _$TopicLectureAppStateCopyWithImpl<$Res, TopicLectureAppState>;
  @useResult
  $Res call(
      {INSPCardModel selectedTopic,
      List<INSPCardModel> allTopics,
      List<LectureCardModel> allTopicBasedLecture});
}

/// @nodoc
class _$TopicLectureAppStateCopyWithImpl<$Res,
        $Val extends TopicLectureAppState>
    implements $TopicLectureAppStateCopyWith<$Res> {
  _$TopicLectureAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTopic = null,
    Object? allTopics = null,
    Object? allTopicBasedLecture = null,
  }) {
    return _then(_value.copyWith(
      selectedTopic: null == selectedTopic
          ? _value.selectedTopic
          : selectedTopic // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allTopics: null == allTopics
          ? _value.allTopics
          : allTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      allTopicBasedLecture: null == allTopicBasedLecture
          ? _value.allTopicBasedLecture
          : allTopicBasedLecture // ignore: cast_nullable_to_non_nullable
              as List<LectureCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopicLectureAppStateImplCopyWith<$Res>
    implements $TopicLectureAppStateCopyWith<$Res> {
  factory _$$TopicLectureAppStateImplCopyWith(_$TopicLectureAppStateImpl value,
          $Res Function(_$TopicLectureAppStateImpl) then) =
      __$$TopicLectureAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {INSPCardModel selectedTopic,
      List<INSPCardModel> allTopics,
      List<LectureCardModel> allTopicBasedLecture});
}

/// @nodoc
class __$$TopicLectureAppStateImplCopyWithImpl<$Res>
    extends _$TopicLectureAppStateCopyWithImpl<$Res, _$TopicLectureAppStateImpl>
    implements _$$TopicLectureAppStateImplCopyWith<$Res> {
  __$$TopicLectureAppStateImplCopyWithImpl(_$TopicLectureAppStateImpl _value,
      $Res Function(_$TopicLectureAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTopic = null,
    Object? allTopics = null,
    Object? allTopicBasedLecture = null,
  }) {
    return _then(_$TopicLectureAppStateImpl(
      selectedTopic: null == selectedTopic
          ? _value.selectedTopic
          : selectedTopic // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allTopics: null == allTopics
          ? _value._allTopics
          : allTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      allTopicBasedLecture: null == allTopicBasedLecture
          ? _value._allTopicBasedLecture
          : allTopicBasedLecture // ignore: cast_nullable_to_non_nullable
              as List<LectureCardModel>,
    ));
  }
}

/// @nodoc

class _$TopicLectureAppStateImpl
    with DiagnosticableTreeMixin
    implements _TopicLectureAppState {
  const _$TopicLectureAppStateImpl(
      {required this.selectedTopic,
      final List<INSPCardModel> allTopics = const [],
      final List<LectureCardModel> allTopicBasedLecture = const []})
      : _allTopics = allTopics,
        _allTopicBasedLecture = allTopicBasedLecture;

  @override
  final INSPCardModel selectedTopic;
  final List<INSPCardModel> _allTopics;
  @override
  @JsonKey()
  List<INSPCardModel> get allTopics {
    if (_allTopics is EqualUnmodifiableListView) return _allTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTopics);
  }

  final List<LectureCardModel> _allTopicBasedLecture;
  @override
  @JsonKey()
  List<LectureCardModel> get allTopicBasedLecture {
    if (_allTopicBasedLecture is EqualUnmodifiableListView)
      return _allTopicBasedLecture;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTopicBasedLecture);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TopicLectureAppState(selectedTopic: $selectedTopic, allTopics: $allTopics, allTopicBasedLecture: $allTopicBasedLecture)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TopicLectureAppState'))
      ..add(DiagnosticsProperty('selectedTopic', selectedTopic))
      ..add(DiagnosticsProperty('allTopics', allTopics))
      ..add(DiagnosticsProperty('allTopicBasedLecture', allTopicBasedLecture));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopicLectureAppStateImpl &&
            (identical(other.selectedTopic, selectedTopic) ||
                other.selectedTopic == selectedTopic) &&
            const DeepCollectionEquality()
                .equals(other._allTopics, _allTopics) &&
            const DeepCollectionEquality()
                .equals(other._allTopicBasedLecture, _allTopicBasedLecture));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedTopic,
      const DeepCollectionEquality().hash(_allTopics),
      const DeepCollectionEquality().hash(_allTopicBasedLecture));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TopicLectureAppStateImplCopyWith<_$TopicLectureAppStateImpl>
      get copyWith =>
          __$$TopicLectureAppStateImplCopyWithImpl<_$TopicLectureAppStateImpl>(
              this, _$identity);
}

abstract class _TopicLectureAppState implements TopicLectureAppState {
  const factory _TopicLectureAppState(
          {required final INSPCardModel selectedTopic,
          final List<INSPCardModel> allTopics,
          final List<LectureCardModel> allTopicBasedLecture}) =
      _$TopicLectureAppStateImpl;

  @override
  INSPCardModel get selectedTopic;
  @override
  List<INSPCardModel> get allTopics;
  @override
  List<LectureCardModel> get allTopicBasedLecture;
  @override
  @JsonKey(ignore: true)
  _$$TopicLectureAppStateImplCopyWith<_$TopicLectureAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
