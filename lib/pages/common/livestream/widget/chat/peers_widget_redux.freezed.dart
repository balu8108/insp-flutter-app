// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peers_widget_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PeersWidgetAppState {
  List<PeersDataModel> get allPeers => throw _privateConstructorUsedError;
  String get searchKeyword => throw _privateConstructorUsedError;
  List<PeersDataModel> get filteredPeers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PeersWidgetAppStateCopyWith<PeersWidgetAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeersWidgetAppStateCopyWith<$Res> {
  factory $PeersWidgetAppStateCopyWith(
          PeersWidgetAppState value, $Res Function(PeersWidgetAppState) then) =
      _$PeersWidgetAppStateCopyWithImpl<$Res, PeersWidgetAppState>;
  @useResult
  $Res call(
      {List<PeersDataModel> allPeers,
      String searchKeyword,
      List<PeersDataModel> filteredPeers});
}

/// @nodoc
class _$PeersWidgetAppStateCopyWithImpl<$Res, $Val extends PeersWidgetAppState>
    implements $PeersWidgetAppStateCopyWith<$Res> {
  _$PeersWidgetAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allPeers = null,
    Object? searchKeyword = null,
    Object? filteredPeers = null,
  }) {
    return _then(_value.copyWith(
      allPeers: null == allPeers
          ? _value.allPeers
          : allPeers // ignore: cast_nullable_to_non_nullable
              as List<PeersDataModel>,
      searchKeyword: null == searchKeyword
          ? _value.searchKeyword
          : searchKeyword // ignore: cast_nullable_to_non_nullable
              as String,
      filteredPeers: null == filteredPeers
          ? _value.filteredPeers
          : filteredPeers // ignore: cast_nullable_to_non_nullable
              as List<PeersDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeersWidgetAppStateImplCopyWith<$Res>
    implements $PeersWidgetAppStateCopyWith<$Res> {
  factory _$$PeersWidgetAppStateImplCopyWith(_$PeersWidgetAppStateImpl value,
          $Res Function(_$PeersWidgetAppStateImpl) then) =
      __$$PeersWidgetAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PeersDataModel> allPeers,
      String searchKeyword,
      List<PeersDataModel> filteredPeers});
}

/// @nodoc
class __$$PeersWidgetAppStateImplCopyWithImpl<$Res>
    extends _$PeersWidgetAppStateCopyWithImpl<$Res, _$PeersWidgetAppStateImpl>
    implements _$$PeersWidgetAppStateImplCopyWith<$Res> {
  __$$PeersWidgetAppStateImplCopyWithImpl(_$PeersWidgetAppStateImpl _value,
      $Res Function(_$PeersWidgetAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allPeers = null,
    Object? searchKeyword = null,
    Object? filteredPeers = null,
  }) {
    return _then(_$PeersWidgetAppStateImpl(
      allPeers: null == allPeers
          ? _value._allPeers
          : allPeers // ignore: cast_nullable_to_non_nullable
              as List<PeersDataModel>,
      searchKeyword: null == searchKeyword
          ? _value.searchKeyword
          : searchKeyword // ignore: cast_nullable_to_non_nullable
              as String,
      filteredPeers: null == filteredPeers
          ? _value._filteredPeers
          : filteredPeers // ignore: cast_nullable_to_non_nullable
              as List<PeersDataModel>,
    ));
  }
}

/// @nodoc

class _$PeersWidgetAppStateImpl implements _PeersWidgetAppState {
  const _$PeersWidgetAppStateImpl(
      {final List<PeersDataModel> allPeers = const [],
      this.searchKeyword = '',
      final List<PeersDataModel> filteredPeers = const []})
      : _allPeers = allPeers,
        _filteredPeers = filteredPeers;

  final List<PeersDataModel> _allPeers;
  @override
  @JsonKey()
  List<PeersDataModel> get allPeers {
    if (_allPeers is EqualUnmodifiableListView) return _allPeers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allPeers);
  }

  @override
  @JsonKey()
  final String searchKeyword;
  final List<PeersDataModel> _filteredPeers;
  @override
  @JsonKey()
  List<PeersDataModel> get filteredPeers {
    if (_filteredPeers is EqualUnmodifiableListView) return _filteredPeers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredPeers);
  }

  @override
  String toString() {
    return 'PeersWidgetAppState(allPeers: $allPeers, searchKeyword: $searchKeyword, filteredPeers: $filteredPeers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeersWidgetAppStateImpl &&
            const DeepCollectionEquality().equals(other._allPeers, _allPeers) &&
            (identical(other.searchKeyword, searchKeyword) ||
                other.searchKeyword == searchKeyword) &&
            const DeepCollectionEquality()
                .equals(other._filteredPeers, _filteredPeers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allPeers),
      searchKeyword,
      const DeepCollectionEquality().hash(_filteredPeers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PeersWidgetAppStateImplCopyWith<_$PeersWidgetAppStateImpl> get copyWith =>
      __$$PeersWidgetAppStateImplCopyWithImpl<_$PeersWidgetAppStateImpl>(
          this, _$identity);
}

abstract class _PeersWidgetAppState implements PeersWidgetAppState {
  const factory _PeersWidgetAppState(
      {final List<PeersDataModel> allPeers,
      final String searchKeyword,
      final List<PeersDataModel> filteredPeers}) = _$PeersWidgetAppStateImpl;

  @override
  List<PeersDataModel> get allPeers;
  @override
  String get searchKeyword;
  @override
  List<PeersDataModel> get filteredPeers;
  @override
  @JsonKey(ignore: true)
  _$$PeersWidgetAppStateImplCopyWith<_$PeersWidgetAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
