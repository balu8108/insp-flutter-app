// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter_detail_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChapterDetailAppState {
  INSPCardModel get selectedchapter => throw _privateConstructorUsedError;
  List<INSPCardModel> get allChapter => throw _privateConstructorUsedError;
  List<INSPCardModel> get allTopics => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChapterDetailAppStateCopyWith<ChapterDetailAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChapterDetailAppStateCopyWith<$Res> {
  factory $ChapterDetailAppStateCopyWith(ChapterDetailAppState value,
          $Res Function(ChapterDetailAppState) then) =
      _$ChapterDetailAppStateCopyWithImpl<$Res, ChapterDetailAppState>;
  @useResult
  $Res call(
      {INSPCardModel selectedchapter,
      List<INSPCardModel> allChapter,
      List<INSPCardModel> allTopics});
}

/// @nodoc
class _$ChapterDetailAppStateCopyWithImpl<$Res,
        $Val extends ChapterDetailAppState>
    implements $ChapterDetailAppStateCopyWith<$Res> {
  _$ChapterDetailAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedchapter = null,
    Object? allChapter = null,
    Object? allTopics = null,
  }) {
    return _then(_value.copyWith(
      selectedchapter: null == selectedchapter
          ? _value.selectedchapter
          : selectedchapter // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allChapter: null == allChapter
          ? _value.allChapter
          : allChapter // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      allTopics: null == allTopics
          ? _value.allTopics
          : allTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChapterDetailAppStateImplCopyWith<$Res>
    implements $ChapterDetailAppStateCopyWith<$Res> {
  factory _$$ChapterDetailAppStateImplCopyWith(
          _$ChapterDetailAppStateImpl value,
          $Res Function(_$ChapterDetailAppStateImpl) then) =
      __$$ChapterDetailAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {INSPCardModel selectedchapter,
      List<INSPCardModel> allChapter,
      List<INSPCardModel> allTopics});
}

/// @nodoc
class __$$ChapterDetailAppStateImplCopyWithImpl<$Res>
    extends _$ChapterDetailAppStateCopyWithImpl<$Res,
        _$ChapterDetailAppStateImpl>
    implements _$$ChapterDetailAppStateImplCopyWith<$Res> {
  __$$ChapterDetailAppStateImplCopyWithImpl(_$ChapterDetailAppStateImpl _value,
      $Res Function(_$ChapterDetailAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedchapter = null,
    Object? allChapter = null,
    Object? allTopics = null,
  }) {
    return _then(_$ChapterDetailAppStateImpl(
      selectedchapter: null == selectedchapter
          ? _value.selectedchapter
          : selectedchapter // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allChapter: null == allChapter
          ? _value._allChapter
          : allChapter // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      allTopics: null == allTopics
          ? _value._allTopics
          : allTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ));
  }
}

/// @nodoc

class _$ChapterDetailAppStateImpl
    with DiagnosticableTreeMixin
    implements _ChapterDetailAppState {
  const _$ChapterDetailAppStateImpl(
      {required this.selectedchapter,
      final List<INSPCardModel> allChapter = const [],
      final List<INSPCardModel> allTopics = const []})
      : _allChapter = allChapter,
        _allTopics = allTopics;

  @override
  final INSPCardModel selectedchapter;
  final List<INSPCardModel> _allChapter;
  @override
  @JsonKey()
  List<INSPCardModel> get allChapter {
    if (_allChapter is EqualUnmodifiableListView) return _allChapter;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allChapter);
  }

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
    return 'ChapterDetailAppState(selectedchapter: $selectedchapter, allChapter: $allChapter, allTopics: $allTopics)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChapterDetailAppState'))
      ..add(DiagnosticsProperty('selectedchapter', selectedchapter))
      ..add(DiagnosticsProperty('allChapter', allChapter))
      ..add(DiagnosticsProperty('allTopics', allTopics));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChapterDetailAppStateImpl &&
            (identical(other.selectedchapter, selectedchapter) ||
                other.selectedchapter == selectedchapter) &&
            const DeepCollectionEquality()
                .equals(other._allChapter, _allChapter) &&
            const DeepCollectionEquality()
                .equals(other._allTopics, _allTopics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedchapter,
      const DeepCollectionEquality().hash(_allChapter),
      const DeepCollectionEquality().hash(_allTopics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChapterDetailAppStateImplCopyWith<_$ChapterDetailAppStateImpl>
      get copyWith => __$$ChapterDetailAppStateImplCopyWithImpl<
          _$ChapterDetailAppStateImpl>(this, _$identity);
}

abstract class _ChapterDetailAppState implements ChapterDetailAppState {
  const factory _ChapterDetailAppState(
      {required final INSPCardModel selectedchapter,
      final List<INSPCardModel> allChapter,
      final List<INSPCardModel> allTopics}) = _$ChapterDetailAppStateImpl;

  @override
  INSPCardModel get selectedchapter;
  @override
  List<INSPCardModel> get allChapter;
  @override
  List<INSPCardModel> get allTopics;
  @override
  @JsonKey(ignore: true)
  _$$ChapterDetailAppStateImplCopyWith<_$ChapterDetailAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
