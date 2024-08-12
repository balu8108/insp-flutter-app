// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_topics_widget_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AllTopicsWidgetAppState {
  List<INSPCardModel> get allSubjectTopics =>
      throw _privateConstructorUsedError;
  List<INSPCardModel> get filterSubjectTopics =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AllTopicsWidgetAppStateCopyWith<AllTopicsWidgetAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllTopicsWidgetAppStateCopyWith<$Res> {
  factory $AllTopicsWidgetAppStateCopyWith(AllTopicsWidgetAppState value,
          $Res Function(AllTopicsWidgetAppState) then) =
      _$AllTopicsWidgetAppStateCopyWithImpl<$Res, AllTopicsWidgetAppState>;
  @useResult
  $Res call(
      {List<INSPCardModel> allSubjectTopics,
      List<INSPCardModel> filterSubjectTopics});
}

/// @nodoc
class _$AllTopicsWidgetAppStateCopyWithImpl<$Res,
        $Val extends AllTopicsWidgetAppState>
    implements $AllTopicsWidgetAppStateCopyWith<$Res> {
  _$AllTopicsWidgetAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSubjectTopics = null,
    Object? filterSubjectTopics = null,
  }) {
    return _then(_value.copyWith(
      allSubjectTopics: null == allSubjectTopics
          ? _value.allSubjectTopics
          : allSubjectTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      filterSubjectTopics: null == filterSubjectTopics
          ? _value.filterSubjectTopics
          : filterSubjectTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AllTopicsWidgetAppStateImplCopyWith<$Res>
    implements $AllTopicsWidgetAppStateCopyWith<$Res> {
  factory _$$AllTopicsWidgetAppStateImplCopyWith(
          _$AllTopicsWidgetAppStateImpl value,
          $Res Function(_$AllTopicsWidgetAppStateImpl) then) =
      __$$AllTopicsWidgetAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<INSPCardModel> allSubjectTopics,
      List<INSPCardModel> filterSubjectTopics});
}

/// @nodoc
class __$$AllTopicsWidgetAppStateImplCopyWithImpl<$Res>
    extends _$AllTopicsWidgetAppStateCopyWithImpl<$Res,
        _$AllTopicsWidgetAppStateImpl>
    implements _$$AllTopicsWidgetAppStateImplCopyWith<$Res> {
  __$$AllTopicsWidgetAppStateImplCopyWithImpl(
      _$AllTopicsWidgetAppStateImpl _value,
      $Res Function(_$AllTopicsWidgetAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allSubjectTopics = null,
    Object? filterSubjectTopics = null,
  }) {
    return _then(_$AllTopicsWidgetAppStateImpl(
      allSubjectTopics: null == allSubjectTopics
          ? _value._allSubjectTopics
          : allSubjectTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      filterSubjectTopics: null == filterSubjectTopics
          ? _value._filterSubjectTopics
          : filterSubjectTopics // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ));
  }
}

/// @nodoc

class _$AllTopicsWidgetAppStateImpl
    with DiagnosticableTreeMixin
    implements _AllTopicsWidgetAppState {
  const _$AllTopicsWidgetAppStateImpl(
      {final List<INSPCardModel> allSubjectTopics = const [],
      final List<INSPCardModel> filterSubjectTopics = const []})
      : _allSubjectTopics = allSubjectTopics,
        _filterSubjectTopics = filterSubjectTopics;

  final List<INSPCardModel> _allSubjectTopics;
  @override
  @JsonKey()
  List<INSPCardModel> get allSubjectTopics {
    if (_allSubjectTopics is EqualUnmodifiableListView)
      return _allSubjectTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allSubjectTopics);
  }

  final List<INSPCardModel> _filterSubjectTopics;
  @override
  @JsonKey()
  List<INSPCardModel> get filterSubjectTopics {
    if (_filterSubjectTopics is EqualUnmodifiableListView)
      return _filterSubjectTopics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterSubjectTopics);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AllTopicsWidgetAppState(allSubjectTopics: $allSubjectTopics, filterSubjectTopics: $filterSubjectTopics)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AllTopicsWidgetAppState'))
      ..add(DiagnosticsProperty('allSubjectTopics', allSubjectTopics))
      ..add(DiagnosticsProperty('filterSubjectTopics', filterSubjectTopics));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllTopicsWidgetAppStateImpl &&
            const DeepCollectionEquality()
                .equals(other._allSubjectTopics, _allSubjectTopics) &&
            const DeepCollectionEquality()
                .equals(other._filterSubjectTopics, _filterSubjectTopics));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allSubjectTopics),
      const DeepCollectionEquality().hash(_filterSubjectTopics));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AllTopicsWidgetAppStateImplCopyWith<_$AllTopicsWidgetAppStateImpl>
      get copyWith => __$$AllTopicsWidgetAppStateImplCopyWithImpl<
          _$AllTopicsWidgetAppStateImpl>(this, _$identity);
}

abstract class _AllTopicsWidgetAppState implements AllTopicsWidgetAppState {
  const factory _AllTopicsWidgetAppState(
          {final List<INSPCardModel> allSubjectTopics,
          final List<INSPCardModel> filterSubjectTopics}) =
      _$AllTopicsWidgetAppStateImpl;

  @override
  List<INSPCardModel> get allSubjectTopics;
  @override
  List<INSPCardModel> get filterSubjectTopics;
  @override
  @JsonKey(ignore: true)
  _$$AllTopicsWidgetAppStateImplCopyWith<_$AllTopicsWidgetAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
