// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tpstream_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TPStreamAppState {
  String get streamStatusChangeTo => throw _privateConstructorUsedError;
  VideoResponseModel get videoResponse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TPStreamAppStateCopyWith<TPStreamAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TPStreamAppStateCopyWith<$Res> {
  factory $TPStreamAppStateCopyWith(
          TPStreamAppState value, $Res Function(TPStreamAppState) then) =
      _$TPStreamAppStateCopyWithImpl<$Res, TPStreamAppState>;
  @useResult
  $Res call({String streamStatusChangeTo, VideoResponseModel videoResponse});
}

/// @nodoc
class _$TPStreamAppStateCopyWithImpl<$Res, $Val extends TPStreamAppState>
    implements $TPStreamAppStateCopyWith<$Res> {
  _$TPStreamAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streamStatusChangeTo = null,
    Object? videoResponse = null,
  }) {
    return _then(_value.copyWith(
      streamStatusChangeTo: null == streamStatusChangeTo
          ? _value.streamStatusChangeTo
          : streamStatusChangeTo // ignore: cast_nullable_to_non_nullable
              as String,
      videoResponse: null == videoResponse
          ? _value.videoResponse
          : videoResponse // ignore: cast_nullable_to_non_nullable
              as VideoResponseModel,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TPStreamAppStateImplCopyWith<$Res>
    implements $TPStreamAppStateCopyWith<$Res> {
  factory _$$TPStreamAppStateImplCopyWith(_$TPStreamAppStateImpl value,
          $Res Function(_$TPStreamAppStateImpl) then) =
      __$$TPStreamAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String streamStatusChangeTo, VideoResponseModel videoResponse});
}

/// @nodoc
class __$$TPStreamAppStateImplCopyWithImpl<$Res>
    extends _$TPStreamAppStateCopyWithImpl<$Res, _$TPStreamAppStateImpl>
    implements _$$TPStreamAppStateImplCopyWith<$Res> {
  __$$TPStreamAppStateImplCopyWithImpl(_$TPStreamAppStateImpl _value,
      $Res Function(_$TPStreamAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? streamStatusChangeTo = null,
    Object? videoResponse = null,
  }) {
    return _then(_$TPStreamAppStateImpl(
      streamStatusChangeTo: null == streamStatusChangeTo
          ? _value.streamStatusChangeTo
          : streamStatusChangeTo // ignore: cast_nullable_to_non_nullable
              as String,
      videoResponse: null == videoResponse
          ? _value.videoResponse
          : videoResponse // ignore: cast_nullable_to_non_nullable
              as VideoResponseModel,
    ));
  }
}

/// @nodoc

class _$TPStreamAppStateImpl implements _TPStreamAppState {
  const _$TPStreamAppStateImpl(
      {this.streamStatusChangeTo = '',
      this.videoResponse = const VideoResponseModel()});

  @override
  @JsonKey()
  final String streamStatusChangeTo;
  @override
  @JsonKey()
  final VideoResponseModel videoResponse;

  @override
  String toString() {
    return 'TPStreamAppState(streamStatusChangeTo: $streamStatusChangeTo, videoResponse: $videoResponse)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TPStreamAppStateImpl &&
            (identical(other.streamStatusChangeTo, streamStatusChangeTo) ||
                other.streamStatusChangeTo == streamStatusChangeTo) &&
            (identical(other.videoResponse, videoResponse) ||
                other.videoResponse == videoResponse));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, streamStatusChangeTo, videoResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TPStreamAppStateImplCopyWith<_$TPStreamAppStateImpl> get copyWith =>
      __$$TPStreamAppStateImplCopyWithImpl<_$TPStreamAppStateImpl>(
          this, _$identity);
}

abstract class _TPStreamAppState implements TPStreamAppState {
  const factory _TPStreamAppState(
      {final String streamStatusChangeTo,
      final VideoResponseModel videoResponse}) = _$TPStreamAppStateImpl;

  @override
  String get streamStatusChangeTo;
  @override
  VideoResponseModel get videoResponse;
  @override
  @JsonKey(ignore: true)
  _$$TPStreamAppStateImplCopyWith<_$TPStreamAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
