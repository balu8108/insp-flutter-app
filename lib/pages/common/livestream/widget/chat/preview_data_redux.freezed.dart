// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preview_data_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PreviewDataAppState {
  LecturesDetailResponseModelData get previewData =>
      throw _privateConstructorUsedError;
  List<LiveClassRoomFile> get previewDataFiles =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PreviewDataAppStateCopyWith<PreviewDataAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviewDataAppStateCopyWith<$Res> {
  factory $PreviewDataAppStateCopyWith(
          PreviewDataAppState value, $Res Function(PreviewDataAppState) then) =
      _$PreviewDataAppStateCopyWithImpl<$Res, PreviewDataAppState>;
  @useResult
  $Res call(
      {LecturesDetailResponseModelData previewData,
      List<LiveClassRoomFile> previewDataFiles});
}

/// @nodoc
class _$PreviewDataAppStateCopyWithImpl<$Res, $Val extends PreviewDataAppState>
    implements $PreviewDataAppStateCopyWith<$Res> {
  _$PreviewDataAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previewData = null,
    Object? previewDataFiles = null,
  }) {
    return _then(_value.copyWith(
      previewData: null == previewData
          ? _value.previewData
          : previewData // ignore: cast_nullable_to_non_nullable
              as LecturesDetailResponseModelData,
      previewDataFiles: null == previewDataFiles
          ? _value.previewDataFiles
          : previewDataFiles // ignore: cast_nullable_to_non_nullable
              as List<LiveClassRoomFile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreviewDataAppStateImplCopyWith<$Res>
    implements $PreviewDataAppStateCopyWith<$Res> {
  factory _$$PreviewDataAppStateImplCopyWith(_$PreviewDataAppStateImpl value,
          $Res Function(_$PreviewDataAppStateImpl) then) =
      __$$PreviewDataAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LecturesDetailResponseModelData previewData,
      List<LiveClassRoomFile> previewDataFiles});
}

/// @nodoc
class __$$PreviewDataAppStateImplCopyWithImpl<$Res>
    extends _$PreviewDataAppStateCopyWithImpl<$Res, _$PreviewDataAppStateImpl>
    implements _$$PreviewDataAppStateImplCopyWith<$Res> {
  __$$PreviewDataAppStateImplCopyWithImpl(_$PreviewDataAppStateImpl _value,
      $Res Function(_$PreviewDataAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? previewData = null,
    Object? previewDataFiles = null,
  }) {
    return _then(_$PreviewDataAppStateImpl(
      previewData: null == previewData
          ? _value.previewData
          : previewData // ignore: cast_nullable_to_non_nullable
              as LecturesDetailResponseModelData,
      previewDataFiles: null == previewDataFiles
          ? _value._previewDataFiles
          : previewDataFiles // ignore: cast_nullable_to_non_nullable
              as List<LiveClassRoomFile>,
    ));
  }
}

/// @nodoc

class _$PreviewDataAppStateImpl implements _PreviewDataAppState {
  const _$PreviewDataAppStateImpl(
      {this.previewData = const LecturesDetailResponseModelData(),
      final List<LiveClassRoomFile> previewDataFiles = const []})
      : _previewDataFiles = previewDataFiles;

  @override
  @JsonKey()
  final LecturesDetailResponseModelData previewData;
  final List<LiveClassRoomFile> _previewDataFiles;
  @override
  @JsonKey()
  List<LiveClassRoomFile> get previewDataFiles {
    if (_previewDataFiles is EqualUnmodifiableListView)
      return _previewDataFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previewDataFiles);
  }

  @override
  String toString() {
    return 'PreviewDataAppState(previewData: $previewData, previewDataFiles: $previewDataFiles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviewDataAppStateImpl &&
            (identical(other.previewData, previewData) ||
                other.previewData == previewData) &&
            const DeepCollectionEquality()
                .equals(other._previewDataFiles, _previewDataFiles));
  }

  @override
  int get hashCode => Object.hash(runtimeType, previewData,
      const DeepCollectionEquality().hash(_previewDataFiles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PreviewDataAppStateImplCopyWith<_$PreviewDataAppStateImpl> get copyWith =>
      __$$PreviewDataAppStateImplCopyWithImpl<_$PreviewDataAppStateImpl>(
          this, _$identity);
}

abstract class _PreviewDataAppState implements PreviewDataAppState {
  const factory _PreviewDataAppState(
          {final LecturesDetailResponseModelData previewData,
          final List<LiveClassRoomFile> previewDataFiles}) =
      _$PreviewDataAppStateImpl;

  @override
  LecturesDetailResponseModelData get previewData;
  @override
  List<LiveClassRoomFile> get previewDataFiles;
  @override
  @JsonKey(ignore: true)
  _$$PreviewDataAppStateImplCopyWith<_$PreviewDataAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
