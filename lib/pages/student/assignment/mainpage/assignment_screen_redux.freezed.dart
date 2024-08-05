// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'assignment_screen_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AssignmentScreenAppState {
  INSPCardModel get selectedItem => throw _privateConstructorUsedError;
  List<INSPCardModel> get allSubjectTopics =>
      throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AssignmentScreenAppStateCopyWith<AssignmentScreenAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssignmentScreenAppStateCopyWith<$Res> {
  factory $AssignmentScreenAppStateCopyWith(AssignmentScreenAppState value,
          $Res Function(AssignmentScreenAppState) then) =
      _$AssignmentScreenAppStateCopyWithImpl<$Res, AssignmentScreenAppState>;
  @useResult
  $Res call(
      {INSPCardModel selectedItem,
      List<INSPCardModel> allSubjectTopics,
      String query});
}

/// @nodoc
class _$AssignmentScreenAppStateCopyWithImpl<$Res,
        $Val extends AssignmentScreenAppState>
    implements $AssignmentScreenAppStateCopyWith<$Res> {
  _$AssignmentScreenAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
    Object? allSubjectTopics = null,
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allSubjectTopics: null == allSubjectTopics
          ? _value.allSubjectTopics
          : allSubjectTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssignmentScreenAppStateImplCopyWith<$Res>
    implements $AssignmentScreenAppStateCopyWith<$Res> {
  factory _$$AssignmentScreenAppStateImplCopyWith(
          _$AssignmentScreenAppStateImpl value,
          $Res Function(_$AssignmentScreenAppStateImpl) then) =
      __$$AssignmentScreenAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {INSPCardModel selectedItem,
      List<INSPCardModel> allSubjectTopics,
      String query});
}

/// @nodoc
class __$$AssignmentScreenAppStateImplCopyWithImpl<$Res>
    extends _$AssignmentScreenAppStateCopyWithImpl<$Res,
        _$AssignmentScreenAppStateImpl>
    implements _$$AssignmentScreenAppStateImplCopyWith<$Res> {
  __$$AssignmentScreenAppStateImplCopyWithImpl(
      _$AssignmentScreenAppStateImpl _value,
      $Res Function(_$AssignmentScreenAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
    Object? allSubjectTopics = null,
    Object? query = null,
  }) {
    return _then(_$AssignmentScreenAppStateImpl(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allSubjectTopics: null == allSubjectTopics
          ? _value._allSubjectTopics
          : allSubjectTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AssignmentScreenAppStateImpl
    with DiagnosticableTreeMixin
    implements _AssignmentScreenAppState {
  const _$AssignmentScreenAppStateImpl(
      {required this.selectedItem,
      final List<INSPCardModel> allSubjectTopics = const [],
      this.query = ''})
      : _allSubjectTopics = allSubjectTopics;

  @override
  final INSPCardModel selectedItem;
  final List<INSPCardModel> _allSubjectTopics;
  @override
  @JsonKey()
  List<INSPCardModel> get allSubjectTopics {
    if (_allSubjectTopics is EqualUnmodifiableListView)
      return _allSubjectTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allSubjectTopics);
  }

  @override
  @JsonKey()
  final String query;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AssignmentScreenAppState(selectedItem: $selectedItem, allSubjectTopics: $allSubjectTopics, query: $query)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AssignmentScreenAppState'))
      ..add(DiagnosticsProperty('selectedItem', selectedItem))
      ..add(DiagnosticsProperty('allSubjectTopics', allSubjectTopics))
      ..add(DiagnosticsProperty('query', query));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssignmentScreenAppStateImpl &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            const DeepCollectionEquality()
                .equals(other._allSubjectTopics, _allSubjectTopics) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedItem,
      const DeepCollectionEquality().hash(_allSubjectTopics), query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssignmentScreenAppStateImplCopyWith<_$AssignmentScreenAppStateImpl>
      get copyWith => __$$AssignmentScreenAppStateImplCopyWithImpl<
          _$AssignmentScreenAppStateImpl>(this, _$identity);
}

abstract class _AssignmentScreenAppState implements AssignmentScreenAppState {
  const factory _AssignmentScreenAppState(
      {required final INSPCardModel selectedItem,
      final List<INSPCardModel> allSubjectTopics,
      final String query}) = _$AssignmentScreenAppStateImpl;

  @override
  INSPCardModel get selectedItem;
  @override
  List<INSPCardModel> get allSubjectTopics;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$AssignmentScreenAppStateImplCopyWith<_$AssignmentScreenAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
