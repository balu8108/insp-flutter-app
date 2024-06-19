// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_widget_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LibraryWidgetAppState {
  List<INSPCardModel> get libraryInspCardModels =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LibraryWidgetAppStateCopyWith<LibraryWidgetAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryWidgetAppStateCopyWith<$Res> {
  factory $LibraryWidgetAppStateCopyWith(LibraryWidgetAppState value,
          $Res Function(LibraryWidgetAppState) then) =
      _$LibraryWidgetAppStateCopyWithImpl<$Res, LibraryWidgetAppState>;
  @useResult
  $Res call({List<INSPCardModel> libraryInspCardModels});
}

/// @nodoc
class _$LibraryWidgetAppStateCopyWithImpl<$Res,
        $Val extends LibraryWidgetAppState>
    implements $LibraryWidgetAppStateCopyWith<$Res> {
  _$LibraryWidgetAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryInspCardModels = null,
  }) {
    return _then(_value.copyWith(
      libraryInspCardModels: null == libraryInspCardModels
          ? _value.libraryInspCardModels
          : libraryInspCardModels // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LibraryWidgetAppStateImplCopyWith<$Res>
    implements $LibraryWidgetAppStateCopyWith<$Res> {
  factory _$$LibraryWidgetAppStateImplCopyWith(
          _$LibraryWidgetAppStateImpl value,
          $Res Function(_$LibraryWidgetAppStateImpl) then) =
      __$$LibraryWidgetAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<INSPCardModel> libraryInspCardModels});
}

/// @nodoc
class __$$LibraryWidgetAppStateImplCopyWithImpl<$Res>
    extends _$LibraryWidgetAppStateCopyWithImpl<$Res,
        _$LibraryWidgetAppStateImpl>
    implements _$$LibraryWidgetAppStateImplCopyWith<$Res> {
  __$$LibraryWidgetAppStateImplCopyWithImpl(_$LibraryWidgetAppStateImpl _value,
      $Res Function(_$LibraryWidgetAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraryInspCardModels = null,
  }) {
    return _then(_$LibraryWidgetAppStateImpl(
      null == libraryInspCardModels
          ? _value._libraryInspCardModels
          : libraryInspCardModels // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
    ));
  }
}

/// @nodoc

class _$LibraryWidgetAppStateImpl
    with DiagnosticableTreeMixin
    implements _LibraryWidgetAppState {
  const _$LibraryWidgetAppStateImpl(
      [final List<INSPCardModel> libraryInspCardModels = const []])
      : _libraryInspCardModels = libraryInspCardModels;

  final List<INSPCardModel> _libraryInspCardModels;
  @override
  @JsonKey()
  List<INSPCardModel> get libraryInspCardModels {
    if (_libraryInspCardModels is EqualUnmodifiableListView)
      return _libraryInspCardModels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_libraryInspCardModels);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LibraryWidgetAppState(libraryInspCardModels: $libraryInspCardModels)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LibraryWidgetAppState'))
      ..add(
          DiagnosticsProperty('libraryInspCardModels', libraryInspCardModels));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryWidgetAppStateImpl &&
            const DeepCollectionEquality()
                .equals(other._libraryInspCardModels, _libraryInspCardModels));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_libraryInspCardModels));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryWidgetAppStateImplCopyWith<_$LibraryWidgetAppStateImpl>
      get copyWith => __$$LibraryWidgetAppStateImplCopyWithImpl<
          _$LibraryWidgetAppStateImpl>(this, _$identity);
}

abstract class _LibraryWidgetAppState implements LibraryWidgetAppState {
  const factory _LibraryWidgetAppState(
          [final List<INSPCardModel> libraryInspCardModels]) =
      _$LibraryWidgetAppStateImpl;

  @override
  List<INSPCardModel> get libraryInspCardModels;
  @override
  @JsonKey(ignore: true)
  _$$LibraryWidgetAppStateImplCopyWith<_$LibraryWidgetAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
