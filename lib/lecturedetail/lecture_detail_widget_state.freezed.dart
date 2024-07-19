// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture_detail_widget_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LectureDetailWidgetAppState {
  AllLecturesData get lectureData => throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LectureDetailWidgetAppStateCopyWith<LectureDetailWidgetAppState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LectureDetailWidgetAppStateCopyWith<$Res> {
  factory $LectureDetailWidgetAppStateCopyWith(
          LectureDetailWidgetAppState value,
          $Res Function(LectureDetailWidgetAppState) then) =
      _$LectureDetailWidgetAppStateCopyWithImpl<$Res,
          LectureDetailWidgetAppState>;
  @useResult
  $Res call({AllLecturesData lectureData, String query});
}

/// @nodoc
class _$LectureDetailWidgetAppStateCopyWithImpl<$Res,
        $Val extends LectureDetailWidgetAppState>
    implements $LectureDetailWidgetAppStateCopyWith<$Res> {
  _$LectureDetailWidgetAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lectureData = null,
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      lectureData: null == lectureData
          ? _value.lectureData
          : lectureData // ignore: cast_nullable_to_non_nullable
              as AllLecturesData,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LectureDetailWidgetAppStateImplCopyWith<$Res>
    implements $LectureDetailWidgetAppStateCopyWith<$Res> {
  factory _$$LectureDetailWidgetAppStateImplCopyWith(
          _$LectureDetailWidgetAppStateImpl value,
          $Res Function(_$LectureDetailWidgetAppStateImpl) then) =
      __$$LectureDetailWidgetAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AllLecturesData lectureData, String query});
}

/// @nodoc
class __$$LectureDetailWidgetAppStateImplCopyWithImpl<$Res>
    extends _$LectureDetailWidgetAppStateCopyWithImpl<$Res,
        _$LectureDetailWidgetAppStateImpl>
    implements _$$LectureDetailWidgetAppStateImplCopyWith<$Res> {
  __$$LectureDetailWidgetAppStateImplCopyWithImpl(
      _$LectureDetailWidgetAppStateImpl _value,
      $Res Function(_$LectureDetailWidgetAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lectureData = null,
    Object? query = null,
  }) {
    return _then(_$LectureDetailWidgetAppStateImpl(
      lectureData: null == lectureData
          ? _value.lectureData
          : lectureData // ignore: cast_nullable_to_non_nullable
              as AllLecturesData,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LectureDetailWidgetAppStateImpl
    implements _LectureDetailWidgetAppState {
  const _$LectureDetailWidgetAppStateImpl(
      {this.lectureData = const AllLecturesData(
          questionLogCount: 0,
          liveClassRoom: LecturesDetailResponseModelData()),
      this.query = ''});

  @override
  @JsonKey()
  final AllLecturesData lectureData;
  @override
  @JsonKey()
  final String query;

  @override
  String toString() {
    return 'LectureDetailWidgetAppState(lectureData: $lectureData, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LectureDetailWidgetAppStateImpl &&
            (identical(other.lectureData, lectureData) ||
                other.lectureData == lectureData) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lectureData, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LectureDetailWidgetAppStateImplCopyWith<_$LectureDetailWidgetAppStateImpl>
      get copyWith => __$$LectureDetailWidgetAppStateImplCopyWithImpl<
          _$LectureDetailWidgetAppStateImpl>(this, _$identity);
}

abstract class _LectureDetailWidgetAppState
    implements LectureDetailWidgetAppState {
  const factory _LectureDetailWidgetAppState(
      {final AllLecturesData lectureData,
      final String query}) = _$LectureDetailWidgetAppStateImpl;

  @override
  AllLecturesData get lectureData;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$LectureDetailWidgetAppStateImplCopyWith<_$LectureDetailWidgetAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
