// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_liveclass_file_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UploadLiveclassFileAppState {
  String get pickedFilesName => throw _privateConstructorUsedError;
  List<PlatformFile> get pickedFiles => throw _privateConstructorUsedError;
  bool get isPopupOpen => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadLiveclassFileAppStateCopyWith<UploadLiveclassFileAppState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadLiveclassFileAppStateCopyWith<$Res> {
  factory $UploadLiveclassFileAppStateCopyWith(
          UploadLiveclassFileAppState value,
          $Res Function(UploadLiveclassFileAppState) then) =
      _$UploadLiveclassFileAppStateCopyWithImpl<$Res,
          UploadLiveclassFileAppState>;
  @useResult
  $Res call(
      {String pickedFilesName,
      List<PlatformFile> pickedFiles,
      bool isPopupOpen});
}

/// @nodoc
class _$UploadLiveclassFileAppStateCopyWithImpl<$Res,
        $Val extends UploadLiveclassFileAppState>
    implements $UploadLiveclassFileAppStateCopyWith<$Res> {
  _$UploadLiveclassFileAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedFilesName = null,
    Object? pickedFiles = null,
    Object? isPopupOpen = null,
  }) {
    return _then(_value.copyWith(
      pickedFilesName: null == pickedFilesName
          ? _value.pickedFilesName
          : pickedFilesName // ignore: cast_nullable_to_non_nullable
              as String,
      pickedFiles: null == pickedFiles
          ? _value.pickedFiles
          : pickedFiles // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
      isPopupOpen: null == isPopupOpen
          ? _value.isPopupOpen
          : isPopupOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadLiveclassFileAppStateImplCopyWith<$Res>
    implements $UploadLiveclassFileAppStateCopyWith<$Res> {
  factory _$$UploadLiveclassFileAppStateImplCopyWith(
          _$UploadLiveclassFileAppStateImpl value,
          $Res Function(_$UploadLiveclassFileAppStateImpl) then) =
      __$$UploadLiveclassFileAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String pickedFilesName,
      List<PlatformFile> pickedFiles,
      bool isPopupOpen});
}

/// @nodoc
class __$$UploadLiveclassFileAppStateImplCopyWithImpl<$Res>
    extends _$UploadLiveclassFileAppStateCopyWithImpl<$Res,
        _$UploadLiveclassFileAppStateImpl>
    implements _$$UploadLiveclassFileAppStateImplCopyWith<$Res> {
  __$$UploadLiveclassFileAppStateImplCopyWithImpl(
      _$UploadLiveclassFileAppStateImpl _value,
      $Res Function(_$UploadLiveclassFileAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickedFilesName = null,
    Object? pickedFiles = null,
    Object? isPopupOpen = null,
  }) {
    return _then(_$UploadLiveclassFileAppStateImpl(
      pickedFilesName: null == pickedFilesName
          ? _value.pickedFilesName
          : pickedFilesName // ignore: cast_nullable_to_non_nullable
              as String,
      pickedFiles: null == pickedFiles
          ? _value._pickedFiles
          : pickedFiles // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
      isPopupOpen: null == isPopupOpen
          ? _value.isPopupOpen
          : isPopupOpen // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UploadLiveclassFileAppStateImpl
    with DiagnosticableTreeMixin
    implements _UploadLiveclassFileAppState {
  const _$UploadLiveclassFileAppStateImpl(
      {this.pickedFilesName = '',
      final List<PlatformFile> pickedFiles = const [],
      this.isPopupOpen = false})
      : _pickedFiles = pickedFiles;

  @override
  @JsonKey()
  final String pickedFilesName;
  final List<PlatformFile> _pickedFiles;
  @override
  @JsonKey()
  List<PlatformFile> get pickedFiles {
    if (_pickedFiles is EqualUnmodifiableListView) return _pickedFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pickedFiles);
  }

  @override
  @JsonKey()
  final bool isPopupOpen;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadLiveclassFileAppState(pickedFilesName: $pickedFilesName, pickedFiles: $pickedFiles, isPopupOpen: $isPopupOpen)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UploadLiveclassFileAppState'))
      ..add(DiagnosticsProperty('pickedFilesName', pickedFilesName))
      ..add(DiagnosticsProperty('pickedFiles', pickedFiles))
      ..add(DiagnosticsProperty('isPopupOpen', isPopupOpen));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadLiveclassFileAppStateImpl &&
            (identical(other.pickedFilesName, pickedFilesName) ||
                other.pickedFilesName == pickedFilesName) &&
            const DeepCollectionEquality()
                .equals(other._pickedFiles, _pickedFiles) &&
            (identical(other.isPopupOpen, isPopupOpen) ||
                other.isPopupOpen == isPopupOpen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pickedFilesName,
      const DeepCollectionEquality().hash(_pickedFiles), isPopupOpen);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadLiveclassFileAppStateImplCopyWith<_$UploadLiveclassFileAppStateImpl>
      get copyWith => __$$UploadLiveclassFileAppStateImplCopyWithImpl<
          _$UploadLiveclassFileAppStateImpl>(this, _$identity);
}

abstract class _UploadLiveclassFileAppState
    implements UploadLiveclassFileAppState {
  const factory _UploadLiveclassFileAppState(
      {final String pickedFilesName,
      final List<PlatformFile> pickedFiles,
      final bool isPopupOpen}) = _$UploadLiveclassFileAppStateImpl;

  @override
  String get pickedFilesName;
  @override
  List<PlatformFile> get pickedFiles;
  @override
  bool get isPopupOpen;
  @override
  @JsonKey(ignore: true)
  _$$UploadLiveclassFileAppStateImplCopyWith<_$UploadLiveclassFileAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
