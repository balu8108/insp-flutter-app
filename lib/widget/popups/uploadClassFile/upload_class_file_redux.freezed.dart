// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_class_file_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UploadClassFileAppState {
  String get classtype => throw _privateConstructorUsedError;
  String get classroomId => throw _privateConstructorUsedError;
  List<String> get pickedFilesName => throw _privateConstructorUsedError;
  List<PlatformFile> get pickedFiles => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UploadClassFileAppStateCopyWith<UploadClassFileAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadClassFileAppStateCopyWith<$Res> {
  factory $UploadClassFileAppStateCopyWith(UploadClassFileAppState value,
          $Res Function(UploadClassFileAppState) then) =
      _$UploadClassFileAppStateCopyWithImpl<$Res, UploadClassFileAppState>;
  @useResult
  $Res call(
      {String classtype,
      String classroomId,
      List<String> pickedFilesName,
      List<PlatformFile> pickedFiles,
      bool isLoading});
}

/// @nodoc
class _$UploadClassFileAppStateCopyWithImpl<$Res,
        $Val extends UploadClassFileAppState>
    implements $UploadClassFileAppStateCopyWith<$Res> {
  _$UploadClassFileAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classtype = null,
    Object? classroomId = null,
    Object? pickedFilesName = null,
    Object? pickedFiles = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      classtype: null == classtype
          ? _value.classtype
          : classtype // ignore: cast_nullable_to_non_nullable
              as String,
      classroomId: null == classroomId
          ? _value.classroomId
          : classroomId // ignore: cast_nullable_to_non_nullable
              as String,
      pickedFilesName: null == pickedFilesName
          ? _value.pickedFilesName
          : pickedFilesName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pickedFiles: null == pickedFiles
          ? _value.pickedFiles
          : pickedFiles // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadClassFileAppStateImplCopyWith<$Res>
    implements $UploadClassFileAppStateCopyWith<$Res> {
  factory _$$UploadClassFileAppStateImplCopyWith(
          _$UploadClassFileAppStateImpl value,
          $Res Function(_$UploadClassFileAppStateImpl) then) =
      __$$UploadClassFileAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String classtype,
      String classroomId,
      List<String> pickedFilesName,
      List<PlatformFile> pickedFiles,
      bool isLoading});
}

/// @nodoc
class __$$UploadClassFileAppStateImplCopyWithImpl<$Res>
    extends _$UploadClassFileAppStateCopyWithImpl<$Res,
        _$UploadClassFileAppStateImpl>
    implements _$$UploadClassFileAppStateImplCopyWith<$Res> {
  __$$UploadClassFileAppStateImplCopyWithImpl(
      _$UploadClassFileAppStateImpl _value,
      $Res Function(_$UploadClassFileAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? classtype = null,
    Object? classroomId = null,
    Object? pickedFilesName = null,
    Object? pickedFiles = null,
    Object? isLoading = null,
  }) {
    return _then(_$UploadClassFileAppStateImpl(
      classtype: null == classtype
          ? _value.classtype
          : classtype // ignore: cast_nullable_to_non_nullable
              as String,
      classroomId: null == classroomId
          ? _value.classroomId
          : classroomId // ignore: cast_nullable_to_non_nullable
              as String,
      pickedFilesName: null == pickedFilesName
          ? _value._pickedFilesName
          : pickedFilesName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pickedFiles: null == pickedFiles
          ? _value._pickedFiles
          : pickedFiles // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UploadClassFileAppStateImpl
    with DiagnosticableTreeMixin
    implements _UploadClassFileAppState {
  const _$UploadClassFileAppStateImpl(
      {required this.classtype,
      required this.classroomId,
      final List<String> pickedFilesName = const [],
      final List<PlatformFile> pickedFiles = const [],
      this.isLoading = false})
      : _pickedFilesName = pickedFilesName,
        _pickedFiles = pickedFiles;

  @override
  final String classtype;
  @override
  final String classroomId;
  final List<String> _pickedFilesName;
  @override
  @JsonKey()
  List<String> get pickedFilesName {
    if (_pickedFilesName is EqualUnmodifiableListView) return _pickedFilesName;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pickedFilesName);
  }

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
  final bool isLoading;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UploadClassFileAppState(classtype: $classtype, classroomId: $classroomId, pickedFilesName: $pickedFilesName, pickedFiles: $pickedFiles, isLoading: $isLoading)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UploadClassFileAppState'))
      ..add(DiagnosticsProperty('classtype', classtype))
      ..add(DiagnosticsProperty('classroomId', classroomId))
      ..add(DiagnosticsProperty('pickedFilesName', pickedFilesName))
      ..add(DiagnosticsProperty('pickedFiles', pickedFiles))
      ..add(DiagnosticsProperty('isLoading', isLoading));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadClassFileAppStateImpl &&
            (identical(other.classtype, classtype) ||
                other.classtype == classtype) &&
            (identical(other.classroomId, classroomId) ||
                other.classroomId == classroomId) &&
            const DeepCollectionEquality()
                .equals(other._pickedFilesName, _pickedFilesName) &&
            const DeepCollectionEquality()
                .equals(other._pickedFiles, _pickedFiles) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      classtype,
      classroomId,
      const DeepCollectionEquality().hash(_pickedFilesName),
      const DeepCollectionEquality().hash(_pickedFiles),
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadClassFileAppStateImplCopyWith<_$UploadClassFileAppStateImpl>
      get copyWith => __$$UploadClassFileAppStateImplCopyWithImpl<
          _$UploadClassFileAppStateImpl>(this, _$identity);
}

abstract class _UploadClassFileAppState implements UploadClassFileAppState {
  const factory _UploadClassFileAppState(
      {required final String classtype,
      required final String classroomId,
      final List<String> pickedFilesName,
      final List<PlatformFile> pickedFiles,
      final bool isLoading}) = _$UploadClassFileAppStateImpl;

  @override
  String get classtype;
  @override
  String get classroomId;
  @override
  List<String> get pickedFilesName;
  @override
  List<PlatformFile> get pickedFiles;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$UploadClassFileAppStateImplCopyWith<_$UploadClassFileAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
