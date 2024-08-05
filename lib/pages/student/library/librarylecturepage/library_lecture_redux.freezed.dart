// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_lecture_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LibraryLectureReduxAppState {
  INSPCardModel get selectedtopic => throw _privateConstructorUsedError;
  List<LectureCardModel> get allLecturesOfTopic =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LibraryLectureReduxAppStateCopyWith<LibraryLectureReduxAppState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryLectureReduxAppStateCopyWith<$Res> {
  factory $LibraryLectureReduxAppStateCopyWith(
          LibraryLectureReduxAppState value,
          $Res Function(LibraryLectureReduxAppState) then) =
      _$LibraryLectureReduxAppStateCopyWithImpl<$Res,
          LibraryLectureReduxAppState>;
  @useResult
  $Res call(
      {INSPCardModel selectedtopic, List<LectureCardModel> allLecturesOfTopic});
}

/// @nodoc
class _$LibraryLectureReduxAppStateCopyWithImpl<$Res,
        $Val extends LibraryLectureReduxAppState>
    implements $LibraryLectureReduxAppStateCopyWith<$Res> {
  _$LibraryLectureReduxAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedtopic = null,
    Object? allLecturesOfTopic = null,
  }) {
    return _then(_value.copyWith(
      selectedtopic: null == selectedtopic
          ? _value.selectedtopic
          : selectedtopic // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allLecturesOfTopic: null == allLecturesOfTopic
          ? _value.allLecturesOfTopic
          : allLecturesOfTopic // ignore: cast_nullable_to_non_nullable
              as List<LectureCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LibraryLectureReduxAppStateImplCopyWith<$Res>
    implements $LibraryLectureReduxAppStateCopyWith<$Res> {
  factory _$$LibraryLectureReduxAppStateImplCopyWith(
          _$LibraryLectureReduxAppStateImpl value,
          $Res Function(_$LibraryLectureReduxAppStateImpl) then) =
      __$$LibraryLectureReduxAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {INSPCardModel selectedtopic, List<LectureCardModel> allLecturesOfTopic});
}

/// @nodoc
class __$$LibraryLectureReduxAppStateImplCopyWithImpl<$Res>
    extends _$LibraryLectureReduxAppStateCopyWithImpl<$Res,
        _$LibraryLectureReduxAppStateImpl>
    implements _$$LibraryLectureReduxAppStateImplCopyWith<$Res> {
  __$$LibraryLectureReduxAppStateImplCopyWithImpl(
      _$LibraryLectureReduxAppStateImpl _value,
      $Res Function(_$LibraryLectureReduxAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedtopic = null,
    Object? allLecturesOfTopic = null,
  }) {
    return _then(_$LibraryLectureReduxAppStateImpl(
      selectedtopic: null == selectedtopic
          ? _value.selectedtopic
          : selectedtopic // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allLecturesOfTopic: null == allLecturesOfTopic
          ? _value._allLecturesOfTopic
          : allLecturesOfTopic // ignore: cast_nullable_to_non_nullable
              as List<LectureCardModel>,
    ));
  }
}

/// @nodoc

class _$LibraryLectureReduxAppStateImpl
    with DiagnosticableTreeMixin
    implements _LibraryLectureReduxAppState {
  const _$LibraryLectureReduxAppStateImpl(
      {required this.selectedtopic,
      final List<LectureCardModel> allLecturesOfTopic = const []})
      : _allLecturesOfTopic = allLecturesOfTopic;

  @override
  final INSPCardModel selectedtopic;
  final List<LectureCardModel> _allLecturesOfTopic;
  @override
  @JsonKey()
  List<LectureCardModel> get allLecturesOfTopic {
    if (_allLecturesOfTopic is EqualUnmodifiableListView)
      return _allLecturesOfTopic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allLecturesOfTopic);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LibraryLectureReduxAppState(selectedtopic: $selectedtopic, allLecturesOfTopic: $allLecturesOfTopic)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LibraryLectureReduxAppState'))
      ..add(DiagnosticsProperty('selectedtopic', selectedtopic))
      ..add(DiagnosticsProperty('allLecturesOfTopic', allLecturesOfTopic));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryLectureReduxAppStateImpl &&
            (identical(other.selectedtopic, selectedtopic) ||
                other.selectedtopic == selectedtopic) &&
            const DeepCollectionEquality()
                .equals(other._allLecturesOfTopic, _allLecturesOfTopic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedtopic,
      const DeepCollectionEquality().hash(_allLecturesOfTopic));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryLectureReduxAppStateImplCopyWith<_$LibraryLectureReduxAppStateImpl>
      get copyWith => __$$LibraryLectureReduxAppStateImplCopyWithImpl<
          _$LibraryLectureReduxAppStateImpl>(this, _$identity);
}

abstract class _LibraryLectureReduxAppState
    implements LibraryLectureReduxAppState {
  const factory _LibraryLectureReduxAppState(
          {required final INSPCardModel selectedtopic,
          final List<LectureCardModel> allLecturesOfTopic}) =
      _$LibraryLectureReduxAppStateImpl;

  @override
  INSPCardModel get selectedtopic;
  @override
  List<LectureCardModel> get allLecturesOfTopic;
  @override
  @JsonKey(ignore: true)
  _$$LibraryLectureReduxAppStateImplCopyWith<_$LibraryLectureReduxAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
