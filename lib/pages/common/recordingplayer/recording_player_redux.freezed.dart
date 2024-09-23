// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recording_player_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecordingPlayerAppState {
  RecordVideoResponseModelData get recordedVideoData =>
      throw _privateConstructorUsedError;
  RecordingPlayerCard get selectedItem => throw _privateConstructorUsedError;
  String get accestId => throw _privateConstructorUsedError;
  VideoResponseModel get videoResponse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RecordingPlayerAppStateCopyWith<RecordingPlayerAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordingPlayerAppStateCopyWith<$Res> {
  factory $RecordingPlayerAppStateCopyWith(RecordingPlayerAppState value,
          $Res Function(RecordingPlayerAppState) then) =
      _$RecordingPlayerAppStateCopyWithImpl<$Res, RecordingPlayerAppState>;
  @useResult
  $Res call(
      {RecordVideoResponseModelData recordedVideoData,
      RecordingPlayerCard selectedItem,
      String accestId,
      VideoResponseModel videoResponse});
}

/// @nodoc
class _$RecordingPlayerAppStateCopyWithImpl<$Res,
        $Val extends RecordingPlayerAppState>
    implements $RecordingPlayerAppStateCopyWith<$Res> {
  _$RecordingPlayerAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordedVideoData = null,
    Object? selectedItem = null,
    Object? accestId = null,
    Object? videoResponse = null,
  }) {
    return _then(_value.copyWith(
      recordedVideoData: null == recordedVideoData
          ? _value.recordedVideoData
          : recordedVideoData // ignore: cast_nullable_to_non_nullable
              as RecordVideoResponseModelData,
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as RecordingPlayerCard,
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
abstract class _$$RecordingPlayerAppStateImplCopyWith<$Res>
    implements $RecordingPlayerAppStateCopyWith<$Res> {
  factory _$$RecordingPlayerAppStateImplCopyWith(
          _$RecordingPlayerAppStateImpl value,
          $Res Function(_$RecordingPlayerAppStateImpl) then) =
      __$$RecordingPlayerAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RecordVideoResponseModelData recordedVideoData,
      RecordingPlayerCard selectedItem,
      String accestId,
      VideoResponseModel videoResponse});
}

/// @nodoc
class __$$RecordingPlayerAppStateImplCopyWithImpl<$Res>
    extends _$RecordingPlayerAppStateCopyWithImpl<$Res,
        _$RecordingPlayerAppStateImpl>
    implements _$$RecordingPlayerAppStateImplCopyWith<$Res> {
  __$$RecordingPlayerAppStateImplCopyWithImpl(
      _$RecordingPlayerAppStateImpl _value,
      $Res Function(_$RecordingPlayerAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recordedVideoData = null,
    Object? selectedItem = null,
    Object? accestId = null,
    Object? videoResponse = null,
  }) {
    return _then(_$RecordingPlayerAppStateImpl(
      recordedVideoData: null == recordedVideoData
          ? _value.recordedVideoData
          : recordedVideoData // ignore: cast_nullable_to_non_nullable
              as RecordVideoResponseModelData,
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as RecordingPlayerCard,
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

class _$RecordingPlayerAppStateImpl
    with DiagnosticableTreeMixin
    implements _RecordingPlayerAppState {
  const _$RecordingPlayerAppStateImpl(
      {this.recordedVideoData = const RecordVideoResponseModelData(),
      this.selectedItem = const RecordingPlayerCard('', '', '', [], [], ''),
      this.accestId = '',
      this.videoResponse = const VideoResponseModel()});

  @override
  @JsonKey()
  final RecordVideoResponseModelData recordedVideoData;
  @override
  @JsonKey()
  final RecordingPlayerCard selectedItem;
  @override
  @JsonKey()
  final String accestId;
  @override
  @JsonKey()
  final VideoResponseModel videoResponse;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RecordingPlayerAppState(recordedVideoData: $recordedVideoData, selectedItem: $selectedItem, accestId: $accestId, videoResponse: $videoResponse)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RecordingPlayerAppState'))
      ..add(DiagnosticsProperty('recordedVideoData', recordedVideoData))
      ..add(DiagnosticsProperty('selectedItem', selectedItem))
      ..add(DiagnosticsProperty('accestId', accestId))
      ..add(DiagnosticsProperty('videoResponse', videoResponse));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordingPlayerAppStateImpl &&
            (identical(other.recordedVideoData, recordedVideoData) ||
                other.recordedVideoData == recordedVideoData) &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            (identical(other.accestId, accestId) ||
                other.accestId == accestId) &&
            (identical(other.videoResponse, videoResponse) ||
                other.videoResponse == videoResponse));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, recordedVideoData, selectedItem, accestId, videoResponse);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordingPlayerAppStateImplCopyWith<_$RecordingPlayerAppStateImpl>
      get copyWith => __$$RecordingPlayerAppStateImplCopyWithImpl<
          _$RecordingPlayerAppStateImpl>(this, _$identity);
}

abstract class _RecordingPlayerAppState implements RecordingPlayerAppState {
  const factory _RecordingPlayerAppState(
      {final RecordVideoResponseModelData recordedVideoData,
      final RecordingPlayerCard selectedItem,
      final String accestId,
      final VideoResponseModel videoResponse}) = _$RecordingPlayerAppStateImpl;

  @override
  RecordVideoResponseModelData get recordedVideoData;
  @override
  RecordingPlayerCard get selectedItem;
  @override
  String get accestId;
  @override
  VideoResponseModel get videoResponse;
  @override
  @JsonKey(ignore: true)
  _$$RecordingPlayerAppStateImplCopyWith<_$RecordingPlayerAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
