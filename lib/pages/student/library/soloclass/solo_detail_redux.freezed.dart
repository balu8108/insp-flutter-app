// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'solo_detail_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SoloDetailAppState {
  LectureCardModel get selectedItem => throw _privateConstructorUsedError;
  SoloClassDetail get sololectureData => throw _privateConstructorUsedError;
  List<LectureCardModel> get allSoloLecture =>
      throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SoloDetailAppStateCopyWith<SoloDetailAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoloDetailAppStateCopyWith<$Res> {
  factory $SoloDetailAppStateCopyWith(
          SoloDetailAppState value, $Res Function(SoloDetailAppState) then) =
      _$SoloDetailAppStateCopyWithImpl<$Res, SoloDetailAppState>;
  @useResult
  $Res call(
      {LectureCardModel selectedItem,
      SoloClassDetail sololectureData,
      List<LectureCardModel> allSoloLecture,
      String query});
}

/// @nodoc
class _$SoloDetailAppStateCopyWithImpl<$Res, $Val extends SoloDetailAppState>
    implements $SoloDetailAppStateCopyWith<$Res> {
  _$SoloDetailAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
    Object? sololectureData = null,
    Object? allSoloLecture = null,
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as LectureCardModel,
      sololectureData: null == sololectureData
          ? _value.sololectureData
          : sololectureData // ignore: cast_nullable_to_non_nullable
              as SoloClassDetail,
      allSoloLecture: null == allSoloLecture
          ? _value.allSoloLecture
          : allSoloLecture // ignore: cast_nullable_to_non_nullable
              as List<LectureCardModel>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoloDetailAppStateImplCopyWith<$Res>
    implements $SoloDetailAppStateCopyWith<$Res> {
  factory _$$SoloDetailAppStateImplCopyWith(_$SoloDetailAppStateImpl value,
          $Res Function(_$SoloDetailAppStateImpl) then) =
      __$$SoloDetailAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LectureCardModel selectedItem,
      SoloClassDetail sololectureData,
      List<LectureCardModel> allSoloLecture,
      String query});
}

/// @nodoc
class __$$SoloDetailAppStateImplCopyWithImpl<$Res>
    extends _$SoloDetailAppStateCopyWithImpl<$Res, _$SoloDetailAppStateImpl>
    implements _$$SoloDetailAppStateImplCopyWith<$Res> {
  __$$SoloDetailAppStateImplCopyWithImpl(_$SoloDetailAppStateImpl _value,
      $Res Function(_$SoloDetailAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
    Object? sololectureData = null,
    Object? allSoloLecture = null,
    Object? query = null,
  }) {
    return _then(_$SoloDetailAppStateImpl(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as LectureCardModel,
      sololectureData: null == sololectureData
          ? _value.sololectureData
          : sololectureData // ignore: cast_nullable_to_non_nullable
              as SoloClassDetail,
      allSoloLecture: null == allSoloLecture
          ? _value._allSoloLecture
          : allSoloLecture // ignore: cast_nullable_to_non_nullable
              as List<LectureCardModel>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SoloDetailAppStateImpl
    with DiagnosticableTreeMixin
    implements _SoloDetailAppState {
  const _$SoloDetailAppStateImpl(
      {required this.selectedItem,
      this.sololectureData = const SoloClassDetail(),
      final List<LectureCardModel> allSoloLecture = const [],
      this.query = ''})
      : _allSoloLecture = allSoloLecture;

  @override
  final LectureCardModel selectedItem;
  @override
  @JsonKey()
  final SoloClassDetail sololectureData;
  final List<LectureCardModel> _allSoloLecture;
  @override
  @JsonKey()
  List<LectureCardModel> get allSoloLecture {
    if (_allSoloLecture is EqualUnmodifiableListView) return _allSoloLecture;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allSoloLecture);
  }

  @override
  @JsonKey()
  final String query;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SoloDetailAppState(selectedItem: $selectedItem, sololectureData: $sololectureData, allSoloLecture: $allSoloLecture, query: $query)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SoloDetailAppState'))
      ..add(DiagnosticsProperty('selectedItem', selectedItem))
      ..add(DiagnosticsProperty('sololectureData', sololectureData))
      ..add(DiagnosticsProperty('allSoloLecture', allSoloLecture))
      ..add(DiagnosticsProperty('query', query));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoloDetailAppStateImpl &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            (identical(other.sololectureData, sololectureData) ||
                other.sololectureData == sololectureData) &&
            const DeepCollectionEquality()
                .equals(other._allSoloLecture, _allSoloLecture) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedItem, sololectureData,
      const DeepCollectionEquality().hash(_allSoloLecture), query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SoloDetailAppStateImplCopyWith<_$SoloDetailAppStateImpl> get copyWith =>
      __$$SoloDetailAppStateImplCopyWithImpl<_$SoloDetailAppStateImpl>(
          this, _$identity);
}

abstract class _SoloDetailAppState implements SoloDetailAppState {
  const factory _SoloDetailAppState(
      {required final LectureCardModel selectedItem,
      final SoloClassDetail sololectureData,
      final List<LectureCardModel> allSoloLecture,
      final String query}) = _$SoloDetailAppStateImpl;

  @override
  LectureCardModel get selectedItem;
  @override
  SoloClassDetail get sololectureData;
  @override
  List<LectureCardModel> get allSoloLecture;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$SoloDetailAppStateImplCopyWith<_$SoloDetailAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
