// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_assignment_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddAssignmentAppState {
  String? get selectedSubject => throw _privateConstructorUsedError;
  String? get selectedTopic => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<String> get pickedFilesName => throw _privateConstructorUsedError;
  List<PlatformFile> get pickedFiles => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddAssignmentAppStateCopyWith<AddAssignmentAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddAssignmentAppStateCopyWith<$Res> {
  factory $AddAssignmentAppStateCopyWith(AddAssignmentAppState value,
          $Res Function(AddAssignmentAppState) then) =
      _$AddAssignmentAppStateCopyWithImpl<$Res, AddAssignmentAppState>;
  @useResult
  $Res call(
      {String? selectedSubject,
      String? selectedTopic,
      String? description,
      List<String> pickedFilesName,
      List<PlatformFile> pickedFiles});
}

/// @nodoc
class _$AddAssignmentAppStateCopyWithImpl<$Res,
        $Val extends AddAssignmentAppState>
    implements $AddAssignmentAppStateCopyWith<$Res> {
  _$AddAssignmentAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSubject = freezed,
    Object? selectedTopic = freezed,
    Object? description = freezed,
    Object? pickedFilesName = null,
    Object? pickedFiles = null,
  }) {
    return _then(_value.copyWith(
      selectedSubject: freezed == selectedSubject
          ? _value.selectedSubject
          : selectedSubject // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedTopic: freezed == selectedTopic
          ? _value.selectedTopic
          : selectedTopic // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      pickedFilesName: null == pickedFilesName
          ? _value.pickedFilesName
          : pickedFilesName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      pickedFiles: null == pickedFiles
          ? _value.pickedFiles
          : pickedFiles // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddAssignmentAppStateImplCopyWith<$Res>
    implements $AddAssignmentAppStateCopyWith<$Res> {
  factory _$$AddAssignmentAppStateImplCopyWith(
          _$AddAssignmentAppStateImpl value,
          $Res Function(_$AddAssignmentAppStateImpl) then) =
      __$$AddAssignmentAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? selectedSubject,
      String? selectedTopic,
      String? description,
      List<String> pickedFilesName,
      List<PlatformFile> pickedFiles});
}

/// @nodoc
class __$$AddAssignmentAppStateImplCopyWithImpl<$Res>
    extends _$AddAssignmentAppStateCopyWithImpl<$Res,
        _$AddAssignmentAppStateImpl>
    implements _$$AddAssignmentAppStateImplCopyWith<$Res> {
  __$$AddAssignmentAppStateImplCopyWithImpl(_$AddAssignmentAppStateImpl _value,
      $Res Function(_$AddAssignmentAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedSubject = freezed,
    Object? selectedTopic = freezed,
    Object? description = freezed,
    Object? pickedFilesName = null,
    Object? pickedFiles = null,
  }) {
    return _then(_$AddAssignmentAppStateImpl(
      freezed == selectedSubject
          ? _value.selectedSubject
          : selectedSubject // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == selectedTopic
          ? _value.selectedTopic
          : selectedTopic // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      null == pickedFilesName
          ? _value._pickedFilesName
          : pickedFilesName // ignore: cast_nullable_to_non_nullable
              as List<String>,
      null == pickedFiles
          ? _value._pickedFiles
          : pickedFiles // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
    ));
  }
}

/// @nodoc

class _$AddAssignmentAppStateImpl
    with DiagnosticableTreeMixin
    implements _AddAssignmentAppState {
  const _$AddAssignmentAppStateImpl(
      [this.selectedSubject = '',
      this.selectedTopic = '',
      this.description = '',
      final List<String> pickedFilesName = const [],
      final List<PlatformFile> pickedFiles = const []])
      : _pickedFilesName = pickedFilesName,
        _pickedFiles = pickedFiles;

  @override
  @JsonKey()
  final String? selectedSubject;
  @override
  @JsonKey()
  final String? selectedTopic;
  @override
  @JsonKey()
  final String? description;
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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddAssignmentAppState(selectedSubject: $selectedSubject, selectedTopic: $selectedTopic, description: $description, pickedFilesName: $pickedFilesName, pickedFiles: $pickedFiles)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddAssignmentAppState'))
      ..add(DiagnosticsProperty('selectedSubject', selectedSubject))
      ..add(DiagnosticsProperty('selectedTopic', selectedTopic))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('pickedFilesName', pickedFilesName))
      ..add(DiagnosticsProperty('pickedFiles', pickedFiles));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAssignmentAppStateImpl &&
            (identical(other.selectedSubject, selectedSubject) ||
                other.selectedSubject == selectedSubject) &&
            (identical(other.selectedTopic, selectedTopic) ||
                other.selectedTopic == selectedTopic) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._pickedFilesName, _pickedFilesName) &&
            const DeepCollectionEquality()
                .equals(other._pickedFiles, _pickedFiles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedSubject,
      selectedTopic,
      description,
      const DeepCollectionEquality().hash(_pickedFilesName),
      const DeepCollectionEquality().hash(_pickedFiles));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAssignmentAppStateImplCopyWith<_$AddAssignmentAppStateImpl>
      get copyWith => __$$AddAssignmentAppStateImplCopyWithImpl<
          _$AddAssignmentAppStateImpl>(this, _$identity);
}

abstract class _AddAssignmentAppState implements AddAssignmentAppState {
  const factory _AddAssignmentAppState(
      [final String? selectedSubject,
      final String? selectedTopic,
      final String? description,
      final List<String> pickedFilesName,
      final List<PlatformFile> pickedFiles]) = _$AddAssignmentAppStateImpl;

  @override
  String? get selectedSubject;
  @override
  String? get selectedTopic;
  @override
  String? get description;
  @override
  List<String> get pickedFilesName;
  @override
  List<PlatformFile> get pickedFiles;
  @override
  @JsonKey(ignore: true)
  _$$AddAssignmentAppStateImplCopyWith<_$AddAssignmentAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
