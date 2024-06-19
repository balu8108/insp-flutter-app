// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_or_lecture_widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LecturesWidgetAppState {
  List<INSPCardModel> get allTopicsForSelectedCourse =>
      throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;
  List<INSPCardModel> get filteredTopicsForSelectedCourse =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LecturesWidgetAppStateCopyWith<LecturesWidgetAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LecturesWidgetAppStateCopyWith<$Res> {
  factory $LecturesWidgetAppStateCopyWith(LecturesWidgetAppState value,
          $Res Function(LecturesWidgetAppState) then) =
      _$LecturesWidgetAppStateCopyWithImpl<$Res, LecturesWidgetAppState>;
  @useResult
  $Res call(
      {List<INSPCardModel> allTopicsForSelectedCourse,
      String query,
      List<INSPCardModel> filteredTopicsForSelectedCourse});
}

/// @nodoc
class _$LecturesWidgetAppStateCopyWithImpl<$Res,
        $Val extends LecturesWidgetAppState>
    implements $LecturesWidgetAppStateCopyWith<$Res> {
  _$LecturesWidgetAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTopicsForSelectedCourse = null,
    Object? query = null,
    Object? filteredTopicsForSelectedCourse = null,
  }) {
    return _then(_value.copyWith(
      allTopicsForSelectedCourse: null == allTopicsForSelectedCourse
          ? _value.allTopicsForSelectedCourse
          : allTopicsForSelectedCourse // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      filteredTopicsForSelectedCourse: null == filteredTopicsForSelectedCourse
          ? _value.filteredTopicsForSelectedCourse
          : filteredTopicsForSelectedCourse // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LecturesWidgetAppStateImplCopyWith<$Res>
    implements $LecturesWidgetAppStateCopyWith<$Res> {
  factory _$$LecturesWidgetAppStateImplCopyWith(
          _$LecturesWidgetAppStateImpl value,
          $Res Function(_$LecturesWidgetAppStateImpl) then) =
      __$$LecturesWidgetAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<INSPCardModel> allTopicsForSelectedCourse,
      String query,
      List<INSPCardModel> filteredTopicsForSelectedCourse});
}

/// @nodoc
class __$$LecturesWidgetAppStateImplCopyWithImpl<$Res>
    extends _$LecturesWidgetAppStateCopyWithImpl<$Res,
        _$LecturesWidgetAppStateImpl>
    implements _$$LecturesWidgetAppStateImplCopyWith<$Res> {
  __$$LecturesWidgetAppStateImplCopyWithImpl(
      _$LecturesWidgetAppStateImpl _value,
      $Res Function(_$LecturesWidgetAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allTopicsForSelectedCourse = null,
    Object? query = null,
    Object? filteredTopicsForSelectedCourse = null,
  }) {
    return _then(_$LecturesWidgetAppStateImpl(
      allTopicsForSelectedCourse: null == allTopicsForSelectedCourse
          ? _value._allTopicsForSelectedCourse
          : allTopicsForSelectedCourse // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
      filteredTopicsForSelectedCourse: null == filteredTopicsForSelectedCourse
          ? _value._filteredTopicsForSelectedCourse
          : filteredTopicsForSelectedCourse // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ));
  }
}

/// @nodoc

class _$LecturesWidgetAppStateImpl implements _LecturesWidgetAppState {
  const _$LecturesWidgetAppStateImpl(
      {final List<INSPCardModel> allTopicsForSelectedCourse = const [],
      this.query = '',
      final List<INSPCardModel> filteredTopicsForSelectedCourse = const []})
      : _allTopicsForSelectedCourse = allTopicsForSelectedCourse,
        _filteredTopicsForSelectedCourse = filteredTopicsForSelectedCourse;

  final List<INSPCardModel> _allTopicsForSelectedCourse;
  @override
  @JsonKey()
  List<INSPCardModel> get allTopicsForSelectedCourse {
    if (_allTopicsForSelectedCourse is EqualUnmodifiableListView)
      return _allTopicsForSelectedCourse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTopicsForSelectedCourse);
  }

  @override
  @JsonKey()
  final String query;
  final List<INSPCardModel> _filteredTopicsForSelectedCourse;
  @override
  @JsonKey()
  List<INSPCardModel> get filteredTopicsForSelectedCourse {
    if (_filteredTopicsForSelectedCourse is EqualUnmodifiableListView)
      return _filteredTopicsForSelectedCourse;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredTopicsForSelectedCourse);
  }

  @override
  String toString() {
    return 'LecturesWidgetAppState(allTopicsForSelectedCourse: $allTopicsForSelectedCourse, query: $query, filteredTopicsForSelectedCourse: $filteredTopicsForSelectedCourse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LecturesWidgetAppStateImpl &&
            const DeepCollectionEquality().equals(
                other._allTopicsForSelectedCourse,
                _allTopicsForSelectedCourse) &&
            (identical(other.query, query) || other.query == query) &&
            const DeepCollectionEquality().equals(
                other._filteredTopicsForSelectedCourse,
                _filteredTopicsForSelectedCourse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allTopicsForSelectedCourse),
      query,
      const DeepCollectionEquality().hash(_filteredTopicsForSelectedCourse));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LecturesWidgetAppStateImplCopyWith<_$LecturesWidgetAppStateImpl>
      get copyWith => __$$LecturesWidgetAppStateImplCopyWithImpl<
          _$LecturesWidgetAppStateImpl>(this, _$identity);
}

abstract class _LecturesWidgetAppState implements LecturesWidgetAppState {
  const factory _LecturesWidgetAppState(
          {final List<INSPCardModel> allTopicsForSelectedCourse,
          final String query,
          final List<INSPCardModel> filteredTopicsForSelectedCourse}) =
      _$LecturesWidgetAppStateImpl;

  @override
  List<INSPCardModel> get allTopicsForSelectedCourse;
  @override
  String get query;
  @override
  List<INSPCardModel> get filteredTopicsForSelectedCourse;
  @override
  @JsonKey(ignore: true)
  _$$LecturesWidgetAppStateImplCopyWith<_$LecturesWidgetAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
