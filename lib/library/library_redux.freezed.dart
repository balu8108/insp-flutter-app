// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LibraryAppState {
  List<INSPCardModel> get libraryInspCardModels =>
      throw _privateConstructorUsedError;
  INSPCardModel get selectedItem => throw _privateConstructorUsedError;
  List<INSPCardModel> get allTopicsForSelectedSubject =>
      throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  List<INSPCardModel> get filteredTopicsForSelectedSubject =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LibraryAppStateCopyWith<LibraryAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryAppStateCopyWith<$Res> {
  factory $LibraryAppStateCopyWith(
          LibraryAppState value, $Res Function(LibraryAppState) then) =
      _$LibraryAppStateCopyWithImpl<$Res, LibraryAppState>;
  @useResult
  $Res call(
      {List<INSPCardModel> libraryInspCardModels,
      INSPCardModel selectedItem,
      List<INSPCardModel> allTopicsForSelectedSubject,
      String query,
      List<INSPCardModel> filteredTopicsForSelectedSubject});
}

/// @nodoc
class _$LibraryAppStateCopyWithImpl<$Res, $Val extends LibraryAppState>
    implements $LibraryAppStateCopyWith<$Res> {
  _$LibraryAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryInspCardModels = null,
    Object? selectedItem = null,
    Object? allTopicsForSelectedSubject = null,
    Object? query = null,
    Object? filteredTopicsForSelectedSubject = null,
  }) {
    return _then(_value.copyWith(
      libraryInspCardModels: null == libraryInspCardModels
          ? _value.libraryInspCardModels
          : libraryInspCardModels // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allTopicsForSelectedSubject: null == allTopicsForSelectedSubject
          ? _value.allTopicsForSelectedSubject
          : allTopicsForSelectedSubject // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      filteredTopicsForSelectedSubject: null == filteredTopicsForSelectedSubject
          ? _value.filteredTopicsForSelectedSubject
          : filteredTopicsForSelectedSubject // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LibraryAppStateImplCopyWith<$Res>
    implements $LibraryAppStateCopyWith<$Res> {
  factory _$$LibraryAppStateImplCopyWith(_$LibraryAppStateImpl value,
          $Res Function(_$LibraryAppStateImpl) then) =
      __$$LibraryAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<INSPCardModel> libraryInspCardModels,
      INSPCardModel selectedItem,
      List<INSPCardModel> allTopicsForSelectedSubject,
      String query,
      List<INSPCardModel> filteredTopicsForSelectedSubject});
}

/// @nodoc
class __$$LibraryAppStateImplCopyWithImpl<$Res>
    extends _$LibraryAppStateCopyWithImpl<$Res, _$LibraryAppStateImpl>
    implements _$$LibraryAppStateImplCopyWith<$Res> {
  __$$LibraryAppStateImplCopyWithImpl(
      _$LibraryAppStateImpl _value, $Res Function(_$LibraryAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryInspCardModels = null,
    Object? selectedItem = null,
    Object? allTopicsForSelectedSubject = null,
    Object? query = null,
    Object? filteredTopicsForSelectedSubject = null,
  }) {
    return _then(_$LibraryAppStateImpl(
      libraryInspCardModels: null == libraryInspCardModels
          ? _value._libraryInspCardModels
          : libraryInspCardModels // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allTopicsForSelectedSubject: null == allTopicsForSelectedSubject
          ? _value._allTopicsForSelectedSubject
          : allTopicsForSelectedSubject // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      filteredTopicsForSelectedSubject: null == filteredTopicsForSelectedSubject
          ? _value._filteredTopicsForSelectedSubject
          : filteredTopicsForSelectedSubject // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ));
  }
}

/// @nodoc

class _$LibraryAppStateImpl
    with DiagnosticableTreeMixin
    implements _LibraryAppState {
  const _$LibraryAppStateImpl(
      {final List<INSPCardModel> libraryInspCardModels = const [],
      required this.selectedItem,
      final List<INSPCardModel> allTopicsForSelectedSubject = const [],
      this.query = '',
      final List<INSPCardModel> filteredTopicsForSelectedSubject = const []})
      : _libraryInspCardModels = libraryInspCardModels,
        _allTopicsForSelectedSubject = allTopicsForSelectedSubject,
        _filteredTopicsForSelectedSubject = filteredTopicsForSelectedSubject;

  final List<INSPCardModel> _libraryInspCardModels;
  @override
  @JsonKey()
  List<INSPCardModel> get libraryInspCardModels {
    if (_libraryInspCardModels is EqualUnmodifiableListView)
      return _libraryInspCardModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_libraryInspCardModels);
  }

  @override
  final INSPCardModel selectedItem;
  final List<INSPCardModel> _allTopicsForSelectedSubject;
  @override
  @JsonKey()
  List<INSPCardModel> get allTopicsForSelectedSubject {
    if (_allTopicsForSelectedSubject is EqualUnmodifiableListView)
      return _allTopicsForSelectedSubject;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTopicsForSelectedSubject);
  }

  @override
  @JsonKey()
  final String query;
  final List<INSPCardModel> _filteredTopicsForSelectedSubject;
  @override
  @JsonKey()
  List<INSPCardModel> get filteredTopicsForSelectedSubject {
    if (_filteredTopicsForSelectedSubject is EqualUnmodifiableListView)
      return _filteredTopicsForSelectedSubject;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredTopicsForSelectedSubject);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LibraryAppState(libraryInspCardModels: $libraryInspCardModels, selectedItem: $selectedItem, allTopicsForSelectedSubject: $allTopicsForSelectedSubject, query: $query, filteredTopicsForSelectedSubject: $filteredTopicsForSelectedSubject)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LibraryAppState'))
      ..add(DiagnosticsProperty('libraryInspCardModels', libraryInspCardModels))
      ..add(DiagnosticsProperty('selectedItem', selectedItem))
      ..add(DiagnosticsProperty(
          'allTopicsForSelectedSubject', allTopicsForSelectedSubject))
      ..add(DiagnosticsProperty('query', query))
      ..add(DiagnosticsProperty('filteredTopicsForSelectedSubject',
          filteredTopicsForSelectedSubject));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryAppStateImpl &&
            const DeepCollectionEquality()
                .equals(other._libraryInspCardModels, _libraryInspCardModels) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            const DeepCollectionEquality().equals(
                other._allTopicsForSelectedSubject,
                _allTopicsForSelectedSubject) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(
                other._filteredTopicsForSelectedSubject,
                _filteredTopicsForSelectedSubject));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_libraryInspCardModels),
      selectedItem,
      const DeepCollectionEquality().hash(_allTopicsForSelectedSubject),
      query,
      const DeepCollectionEquality().hash(_filteredTopicsForSelectedSubject));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryAppStateImplCopyWith<_$LibraryAppStateImpl> get copyWith =>
      __$$LibraryAppStateImplCopyWithImpl<_$LibraryAppStateImpl>(
          this, _$identity);
}

abstract class _LibraryAppState implements LibraryAppState {
  const factory _LibraryAppState(
          {final List<INSPCardModel> libraryInspCardModels,
          required final INSPCardModel selectedItem,
          final List<INSPCardModel> allTopicsForSelectedSubject,
          final String query,
          final List<INSPCardModel> filteredTopicsForSelectedSubject}) =
      _$LibraryAppStateImpl;

  @override
  List<INSPCardModel> get libraryInspCardModels;
  @override
  INSPCardModel get selectedItem;
  @override
  List<INSPCardModel> get allTopicsForSelectedSubject;
  @override
  String get query;
  @override
  List<INSPCardModel> get filteredTopicsForSelectedSubject;
  @override
  @JsonKey(ignore: true)
  _$$LibraryAppStateImplCopyWith<_$LibraryAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
