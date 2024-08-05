// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soloclass_topic_detail_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SoloclassTopicDetailReduxAppState {
  INSPCardModel get selectedTopic => throw _privateConstructorUsedError;
  List<INSPCardModel> get allTopics => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SoloclassTopicDetailReduxAppStateCopyWith<SoloclassTopicDetailReduxAppState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoloclassTopicDetailReduxAppStateCopyWith<$Res> {
  factory $SoloclassTopicDetailReduxAppStateCopyWith(
          SoloclassTopicDetailReduxAppState value,
          $Res Function(SoloclassTopicDetailReduxAppState) then) =
      _$SoloclassTopicDetailReduxAppStateCopyWithImpl<$Res,
          SoloclassTopicDetailReduxAppState>;
  @useResult
  $Res call({INSPCardModel selectedTopic, List<INSPCardModel> allTopics});
}

/// @nodoc
class _$SoloclassTopicDetailReduxAppStateCopyWithImpl<$Res,
        $Val extends SoloclassTopicDetailReduxAppState>
    implements $SoloclassTopicDetailReduxAppStateCopyWith<$Res> {
  _$SoloclassTopicDetailReduxAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTopic = freezed,
    Object? allTopics = null,
  }) {
    return _then(_value.copyWith(
      selectedTopic: freezed == selectedTopic
          ? _value.selectedTopic
          : selectedTopic // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allTopics: null == allTopics
          ? _value.allTopics
          : allTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoloclassTopicDetailReduxAppStateImplCopyWith<$Res>
    implements $SoloclassTopicDetailReduxAppStateCopyWith<$Res> {
  factory _$$SoloclassTopicDetailReduxAppStateImplCopyWith(
          _$SoloclassTopicDetailReduxAppStateImpl value,
          $Res Function(_$SoloclassTopicDetailReduxAppStateImpl) then) =
      __$$SoloclassTopicDetailReduxAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({INSPCardModel selectedTopic, List<INSPCardModel> allTopics});
}

/// @nodoc
class __$$SoloclassTopicDetailReduxAppStateImplCopyWithImpl<$Res>
    extends _$SoloclassTopicDetailReduxAppStateCopyWithImpl<$Res,
        _$SoloclassTopicDetailReduxAppStateImpl>
    implements _$$SoloclassTopicDetailReduxAppStateImplCopyWith<$Res> {
  __$$SoloclassTopicDetailReduxAppStateImplCopyWithImpl(
      _$SoloclassTopicDetailReduxAppStateImpl _value,
      $Res Function(_$SoloclassTopicDetailReduxAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTopic = freezed,
    Object? allTopics = null,
  }) {
    return _then(_$SoloclassTopicDetailReduxAppStateImpl(
      selectedTopic: freezed == selectedTopic
          ? _value.selectedTopic
          : selectedTopic // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allTopics: null == allTopics
          ? _value._allTopics
          : allTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ));
  }
}

/// @nodoc

class _$SoloclassTopicDetailReduxAppStateImpl
    with DiagnosticableTreeMixin
    implements _SoloclassTopicDetailReduxAppState {
  const _$SoloclassTopicDetailReduxAppStateImpl(
      {required this.selectedTopic,
      final List<INSPCardModel> allTopics = const []})
      : _allTopics = allTopics;

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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SoloclassTopicDetailReduxAppState(selectedTopic: $selectedTopic, allTopics: $allTopics)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SoloclassTopicDetailReduxAppState'))
      ..add(DiagnosticsProperty('selectedTopic', selectedTopic))
      ..add(DiagnosticsProperty('allTopics', allTopics));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoloclassTopicDetailReduxAppStateImpl &&
            const DeepCollectionEquality()
                .equals(other.selectedTopic, selectedTopic) &&
            const DeepCollectionEquality()
                .equals(other._allTopics, _allTopics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedTopic),
      const DeepCollectionEquality().hash(_allTopics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SoloclassTopicDetailReduxAppStateImplCopyWith<
          _$SoloclassTopicDetailReduxAppStateImpl>
      get copyWith => __$$SoloclassTopicDetailReduxAppStateImplCopyWithImpl<
          _$SoloclassTopicDetailReduxAppStateImpl>(this, _$identity);
}

abstract class _SoloclassTopicDetailReduxAppState
    implements SoloclassTopicDetailReduxAppState {
  const factory _SoloclassTopicDetailReduxAppState(
          {required final INSPCardModel selectedTopic,
          final List<INSPCardModel> allTopics}) =
      _$SoloclassTopicDetailReduxAppStateImpl;

  @override
  INSPCardModel get selectedTopic;
  @override
  List<INSPCardModel> get allTopics;
  @override
  @JsonKey(ignore: true)
  _$$SoloclassTopicDetailReduxAppStateImplCopyWith<
          _$SoloclassTopicDetailReduxAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
