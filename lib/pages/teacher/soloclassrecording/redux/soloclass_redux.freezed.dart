// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'soloclass_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SoloClassDetailDataAppState {
  SoloClassDetail get soloData => throw _privateConstructorUsedError;
  String get accestId => throw _privateConstructorUsedError;
  VideoResponseModel get videoResponse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SoloClassDetailDataAppStateCopyWith<SoloClassDetailDataAppState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoloClassDetailDataAppStateCopyWith<$Res> {
  factory $SoloClassDetailDataAppStateCopyWith(
          SoloClassDetailDataAppState value,
          $Res Function(SoloClassDetailDataAppState) then) =
      _$SoloClassDetailDataAppStateCopyWithImpl<$Res,
          SoloClassDetailDataAppState>;
  @useResult
  $Res call(
      {SoloClassDetail soloData,
      String accestId,
      VideoResponseModel videoResponse});
}

/// @nodoc
class _$SoloClassDetailDataAppStateCopyWithImpl<$Res,
        $Val extends SoloClassDetailDataAppState>
    implements $SoloClassDetailDataAppStateCopyWith<$Res> {
  _$SoloClassDetailDataAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soloData = null,
    Object? accestId = null,
    Object? videoResponse = null,
  }) {
    return _then(_value.copyWith(
      soloData: null == soloData
          ? _value.soloData
          : soloData // ignore: cast_nullable_to_non_nullable
              as SoloClassDetail,
      accestId: null == accestId
          ? _value.accestId
          : accestId // ignore: cast_nullable_to_non_nullable
              as String,
      videoResponse: null == videoResponse
          ? _value.videoResponse
          : videoResponse // ignore: cast_nullable_to_non_nullable
              as VideoResponseModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SoloClassDetailDataAppStateImplCopyWith<$Res>
    implements $SoloClassDetailDataAppStateCopyWith<$Res> {
  factory _$$SoloClassDetailDataAppStateImplCopyWith(
          _$SoloClassDetailDataAppStateImpl value,
          $Res Function(_$SoloClassDetailDataAppStateImpl) then) =
      __$$SoloClassDetailDataAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SoloClassDetail soloData,
      String accestId,
      VideoResponseModel videoResponse});
}

/// @nodoc
class __$$SoloClassDetailDataAppStateImplCopyWithImpl<$Res>
    extends _$SoloClassDetailDataAppStateCopyWithImpl<$Res,
        _$SoloClassDetailDataAppStateImpl>
    implements _$$SoloClassDetailDataAppStateImplCopyWith<$Res> {
  __$$SoloClassDetailDataAppStateImplCopyWithImpl(
      _$SoloClassDetailDataAppStateImpl _value,
      $Res Function(_$SoloClassDetailDataAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? soloData = null,
    Object? accestId = null,
    Object? videoResponse = null,
  }) {
    return _then(_$SoloClassDetailDataAppStateImpl(
      soloData: null == soloData
          ? _value.soloData
          : soloData // ignore: cast_nullable_to_non_nullable
              as SoloClassDetail,
      accestId: null == accestId
          ? _value.accestId
          : accestId // ignore: cast_nullable_to_non_nullable
              as String,
      videoResponse: null == videoResponse
          ? _value.videoResponse
          : videoResponse // ignore: cast_nullable_to_non_nullable
              as VideoResponseModel,
    ));
  }
}

/// @nodoc

class _$SoloClassDetailDataAppStateImpl
    implements _SoloClassDetailDataAppState {
  const _$SoloClassDetailDataAppStateImpl(
      {this.soloData = const SoloClassDetail(),
      this.accestId = '',
      this.videoResponse = const VideoResponseModel()});

  @override
  @JsonKey()
  final SoloClassDetail soloData;
  @override
  @JsonKey()
  final String accestId;
  @override
  @JsonKey()
  final VideoResponseModel videoResponse;

  @override
  String toString() {
    return 'SoloClassDetailDataAppState(soloData: $soloData, accestId: $accestId, videoResponse: $videoResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SoloClassDetailDataAppStateImpl &&
            (identical(other.soloData, soloData) ||
                other.soloData == soloData) &&
            (identical(other.accestId, accestId) ||
                other.accestId == accestId) &&
            (identical(other.videoResponse, videoResponse) ||
                other.videoResponse == videoResponse));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, soloData, accestId, videoResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SoloClassDetailDataAppStateImplCopyWith<_$SoloClassDetailDataAppStateImpl>
      get copyWith => __$$SoloClassDetailDataAppStateImplCopyWithImpl<
          _$SoloClassDetailDataAppStateImpl>(this, _$identity);
}

abstract class _SoloClassDetailDataAppState
    implements SoloClassDetailDataAppState {
  const factory _SoloClassDetailDataAppState(
          {final SoloClassDetail soloData,
          final String accestId,
          final VideoResponseModel videoResponse}) =
      _$SoloClassDetailDataAppStateImpl;

  @override
  SoloClassDetail get soloData;
  @override
  String get accestId;
  @override
  VideoResponseModel get videoResponse;
  @override
  @JsonKey(ignore: true)
  _$$SoloClassDetailDataAppStateImplCopyWith<_$SoloClassDetailDataAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
