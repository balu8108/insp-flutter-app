// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdfviewer_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PDFViewerAppState {
  String get fileUrl => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PDFViewerAppStateCopyWith<PDFViewerAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PDFViewerAppStateCopyWith<$Res> {
  factory $PDFViewerAppStateCopyWith(
          PDFViewerAppState value, $Res Function(PDFViewerAppState) then) =
      _$PDFViewerAppStateCopyWithImpl<$Res, PDFViewerAppState>;
  @useResult
  $Res call({String fileUrl});
}

/// @nodoc
class _$PDFViewerAppStateCopyWithImpl<$Res, $Val extends PDFViewerAppState>
    implements $PDFViewerAppStateCopyWith<$Res> {
  _$PDFViewerAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl = null,
  }) {
    return _then(_value.copyWith(
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PDFViewerAppStateImplCopyWith<$Res>
    implements $PDFViewerAppStateCopyWith<$Res> {
  factory _$$PDFViewerAppStateImplCopyWith(_$PDFViewerAppStateImpl value,
          $Res Function(_$PDFViewerAppStateImpl) then) =
      __$$PDFViewerAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileUrl});
}

/// @nodoc
class __$$PDFViewerAppStateImplCopyWithImpl<$Res>
    extends _$PDFViewerAppStateCopyWithImpl<$Res, _$PDFViewerAppStateImpl>
    implements _$$PDFViewerAppStateImplCopyWith<$Res> {
  __$$PDFViewerAppStateImplCopyWithImpl(_$PDFViewerAppStateImpl _value,
      $Res Function(_$PDFViewerAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl = null,
  }) {
    return _then(_$PDFViewerAppStateImpl(
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PDFViewerAppStateImpl implements _PDFViewerAppState {
  const _$PDFViewerAppStateImpl({this.fileUrl = ''});

  @override
  @JsonKey()
  final String fileUrl;

  @override
  String toString() {
    return 'PDFViewerAppState(fileUrl: $fileUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PDFViewerAppStateImpl &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PDFViewerAppStateImplCopyWith<_$PDFViewerAppStateImpl> get copyWith =>
      __$$PDFViewerAppStateImplCopyWithImpl<_$PDFViewerAppStateImpl>(
          this, _$identity);
}

abstract class _PDFViewerAppState implements PDFViewerAppState {
  const factory _PDFViewerAppState({final String fileUrl}) =
      _$PDFViewerAppStateImpl;

  @override
  String get fileUrl;
  @override
  @JsonKey(ignore: true)
  _$$PDFViewerAppStateImplCopyWith<_$PDFViewerAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
