// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SuggestionAppState {
  int get total => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get totalPages => throw _privateConstructorUsedError;
  List<FeedbackModel> get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SuggestionAppStateCopyWith<SuggestionAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionAppStateCopyWith<$Res> {
  factory $SuggestionAppStateCopyWith(
          SuggestionAppState value, $Res Function(SuggestionAppState) then) =
      _$SuggestionAppStateCopyWithImpl<$Res, SuggestionAppState>;
  @useResult
  $Res call({int total, int page, int totalPages, List<FeedbackModel> data});
}

/// @nodoc
class _$SuggestionAppStateCopyWithImpl<$Res, $Val extends SuggestionAppState>
    implements $SuggestionAppStateCopyWith<$Res> {
  _$SuggestionAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FeedbackModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestionAppStateImplCopyWith<$Res>
    implements $SuggestionAppStateCopyWith<$Res> {
  factory _$$SuggestionAppStateImplCopyWith(_$SuggestionAppStateImpl value,
          $Res Function(_$SuggestionAppStateImpl) then) =
      __$$SuggestionAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int page, int totalPages, List<FeedbackModel> data});
}

/// @nodoc
class __$$SuggestionAppStateImplCopyWithImpl<$Res>
    extends _$SuggestionAppStateCopyWithImpl<$Res, _$SuggestionAppStateImpl>
    implements _$$SuggestionAppStateImplCopyWith<$Res> {
  __$$SuggestionAppStateImplCopyWithImpl(_$SuggestionAppStateImpl _value,
      $Res Function(_$SuggestionAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? page = null,
    Object? totalPages = null,
    Object? data = null,
  }) {
    return _then(_$SuggestionAppStateImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      totalPages: null == totalPages
          ? _value.totalPages
          : totalPages // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FeedbackModel>,
    ));
  }
}

/// @nodoc

class _$SuggestionAppStateImpl
    with DiagnosticableTreeMixin
    implements _SuggestionAppState {
  const _$SuggestionAppStateImpl(
      {this.total = 0,
      this.page = 1,
      this.totalPages = 0,
      final List<FeedbackModel> data = const []})
      : _data = data;

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int totalPages;
  final List<FeedbackModel> _data;
  @override
  @JsonKey()
  List<FeedbackModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SuggestionAppState(total: $total, page: $page, totalPages: $totalPages, data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SuggestionAppState'))
      ..add(DiagnosticsProperty('total', total))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('totalPages', totalPages))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionAppStateImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total, page, totalPages,
      const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionAppStateImplCopyWith<_$SuggestionAppStateImpl> get copyWith =>
      __$$SuggestionAppStateImplCopyWithImpl<_$SuggestionAppStateImpl>(
          this, _$identity);
}

abstract class _SuggestionAppState implements SuggestionAppState {
  const factory _SuggestionAppState(
      {final int total,
      final int page,
      final int totalPages,
      final List<FeedbackModel> data}) = _$SuggestionAppStateImpl;

  @override
  int get total;
  @override
  int get page;
  @override
  int get totalPages;
  @override
  List<FeedbackModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$SuggestionAppStateImplCopyWith<_$SuggestionAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
