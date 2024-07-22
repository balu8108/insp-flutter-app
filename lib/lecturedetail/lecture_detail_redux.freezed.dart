// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lecture_detail_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LectureDetailAppState {
  LectureCardModel get selectedItem => throw _privateConstructorUsedError;
  dynamic get question => throw _privateConstructorUsedError;
  AllLecturesData get lectureData => throw _privateConstructorUsedError;
  List<LectureAssignmentCardModel> get assignments =>
      throw _privateConstructorUsedError;
  String get query => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LectureDetailAppStateCopyWith<LectureDetailAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LectureDetailAppStateCopyWith<$Res> {
  factory $LectureDetailAppStateCopyWith(LectureDetailAppState value,
          $Res Function(LectureDetailAppState) then) =
      _$LectureDetailAppStateCopyWithImpl<$Res, LectureDetailAppState>;
  @useResult
  $Res call(
      {LectureCardModel selectedItem,
      dynamic question,
      AllLecturesData lectureData,
      List<LectureAssignmentCardModel> assignments,
      String query});
}

/// @nodoc
class _$LectureDetailAppStateCopyWithImpl<$Res,
        $Val extends LectureDetailAppState>
    implements $LectureDetailAppStateCopyWith<$Res> {
  _$LectureDetailAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
    Object? question = freezed,
    Object? lectureData = null,
    Object? assignments = null,
    Object? query = null,
  }) {
    return _then(_value.copyWith(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as LectureCardModel,
      question: freezed == question
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lectureData: null == lectureData
          ? _value.lectureData
          : lectureData // ignore: cast_nullable_to_non_nullable
              as AllLecturesData,
      assignments: null == assignments
          ? _value.assignments
          : assignments // ignore: cast_nullable_to_non_nullable
              as List<LectureAssignmentCardModel>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LectureDetailAppStateImplCopyWith<$Res>
    implements $LectureDetailAppStateCopyWith<$Res> {
  factory _$$LectureDetailAppStateImplCopyWith(
          _$LectureDetailAppStateImpl value,
          $Res Function(_$LectureDetailAppStateImpl) then) =
      __$$LectureDetailAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LectureCardModel selectedItem,
      dynamic question,
      AllLecturesData lectureData,
      List<LectureAssignmentCardModel> assignments,
      String query});
}

/// @nodoc
class __$$LectureDetailAppStateImplCopyWithImpl<$Res>
    extends _$LectureDetailAppStateCopyWithImpl<$Res,
        _$LectureDetailAppStateImpl>
    implements _$$LectureDetailAppStateImplCopyWith<$Res> {
  __$$LectureDetailAppStateImplCopyWithImpl(_$LectureDetailAppStateImpl _value,
      $Res Function(_$LectureDetailAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
    Object? question = freezed,
    Object? lectureData = null,
    Object? assignments = null,
    Object? query = null,
  }) {
    return _then(_$LectureDetailAppStateImpl(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as LectureCardModel,
      question: freezed == question ? _value.question! : question,
      lectureData: null == lectureData
          ? _value.lectureData
          : lectureData // ignore: cast_nullable_to_non_nullable
              as AllLecturesData,
      assignments: null == assignments
          ? _value._assignments
          : assignments // ignore: cast_nullable_to_non_nullable
              as List<LectureAssignmentCardModel>,
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LectureDetailAppStateImpl
    with DiagnosticableTreeMixin
    implements _LectureDetailAppState {
  const _$LectureDetailAppStateImpl(
      {required this.selectedItem,
      this.question = 0,
      this.lectureData = const AllLecturesData(
          questionLogCount: 0,
          liveClassRoom: LecturesDetailResponseModelData()),
      final List<LectureAssignmentCardModel> assignments = const [],
      this.query = ''})
      : _assignments = assignments;

  @override
  final LectureCardModel selectedItem;
  @override
  @JsonKey()
  final dynamic question;
  @override
  @JsonKey()
  final AllLecturesData lectureData;
  final List<LectureAssignmentCardModel> _assignments;
  @override
  @JsonKey()
  List<LectureAssignmentCardModel> get assignments {
    if (_assignments is EqualUnmodifiableListView) return _assignments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assignments);
  }

  @override
  @JsonKey()
  final String query;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LectureDetailAppState(selectedItem: $selectedItem, question: $question, lectureData: $lectureData, assignments: $assignments, query: $query)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LectureDetailAppState'))
      ..add(DiagnosticsProperty('selectedItem', selectedItem))
      ..add(DiagnosticsProperty('question', question))
      ..add(DiagnosticsProperty('lectureData', lectureData))
      ..add(DiagnosticsProperty('assignments', assignments))
      ..add(DiagnosticsProperty('query', query));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LectureDetailAppStateImpl &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            const DeepCollectionEquality().equals(other.question, question) &&
            (identical(other.lectureData, lectureData) ||
                other.lectureData == lectureData) &&
            const DeepCollectionEquality()
                .equals(other._assignments, _assignments) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedItem,
      const DeepCollectionEquality().hash(question),
      lectureData,
      const DeepCollectionEquality().hash(_assignments),
      query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LectureDetailAppStateImplCopyWith<_$LectureDetailAppStateImpl>
      get copyWith => __$$LectureDetailAppStateImplCopyWithImpl<
          _$LectureDetailAppStateImpl>(this, _$identity);
}

abstract class _LectureDetailAppState implements LectureDetailAppState {
  const factory _LectureDetailAppState(
      {required final LectureCardModel selectedItem,
      final dynamic question,
      final AllLecturesData lectureData,
      final List<LectureAssignmentCardModel> assignments,
      final String query}) = _$LectureDetailAppStateImpl;

  @override
  LectureCardModel get selectedItem;
  @override
  dynamic get question;
  @override
  AllLecturesData get lectureData;
  @override
  List<LectureAssignmentCardModel> get assignments;
  @override
  String get query;
  @override
  @JsonKey(ignore: true)
  _$$LectureDetailAppStateImplCopyWith<_$LectureDetailAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
