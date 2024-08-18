// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'student_suggestion_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StudentSuggestionAppState {
  String? get feedback => throw _privateConstructorUsedError;
  String? get feedbackError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $StudentSuggestionAppStateCopyWith<StudentSuggestionAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StudentSuggestionAppStateCopyWith<$Res> {
  factory $StudentSuggestionAppStateCopyWith(StudentSuggestionAppState value,
          $Res Function(StudentSuggestionAppState) then) =
      _$StudentSuggestionAppStateCopyWithImpl<$Res, StudentSuggestionAppState>;
  @useResult
  $Res call({String? feedback, String? feedbackError});
}

/// @nodoc
class _$StudentSuggestionAppStateCopyWithImpl<$Res,
        $Val extends StudentSuggestionAppState>
    implements $StudentSuggestionAppStateCopyWith<$Res> {
  _$StudentSuggestionAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = freezed,
    Object? feedbackError = freezed,
  }) {
    return _then(_value.copyWith(
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackError: freezed == feedbackError
          ? _value.feedbackError
          : feedbackError // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StudentSuggestionAppStateImplCopyWith<$Res>
    implements $StudentSuggestionAppStateCopyWith<$Res> {
  factory _$$StudentSuggestionAppStateImplCopyWith(
          _$StudentSuggestionAppStateImpl value,
          $Res Function(_$StudentSuggestionAppStateImpl) then) =
      __$$StudentSuggestionAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? feedback, String? feedbackError});
}

/// @nodoc
class __$$StudentSuggestionAppStateImplCopyWithImpl<$Res>
    extends _$StudentSuggestionAppStateCopyWithImpl<$Res,
        _$StudentSuggestionAppStateImpl>
    implements _$$StudentSuggestionAppStateImplCopyWith<$Res> {
  __$$StudentSuggestionAppStateImplCopyWithImpl(
      _$StudentSuggestionAppStateImpl _value,
      $Res Function(_$StudentSuggestionAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedback = freezed,
    Object? feedbackError = freezed,
  }) {
    return _then(_$StudentSuggestionAppStateImpl(
      feedback: freezed == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String?,
      feedbackError: freezed == feedbackError
          ? _value.feedbackError
          : feedbackError // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StudentSuggestionAppStateImpl
    with DiagnosticableTreeMixin
    implements _StudentSuggestionAppState {
  const _$StudentSuggestionAppStateImpl(
      {this.feedback = '', this.feedbackError = ''});

  @override
  @JsonKey()
  final String? feedback;
  @override
  @JsonKey()
  final String? feedbackError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'StudentSuggestionAppState(feedback: $feedback, feedbackError: $feedbackError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'StudentSuggestionAppState'))
      ..add(DiagnosticsProperty('feedback', feedback))
      ..add(DiagnosticsProperty('feedbackError', feedbackError));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StudentSuggestionAppStateImpl &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.feedbackError, feedbackError) ||
                other.feedbackError == feedbackError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, feedback, feedbackError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StudentSuggestionAppStateImplCopyWith<_$StudentSuggestionAppStateImpl>
      get copyWith => __$$StudentSuggestionAppStateImplCopyWithImpl<
          _$StudentSuggestionAppStateImpl>(this, _$identity);
}

abstract class _StudentSuggestionAppState implements StudentSuggestionAppState {
  const factory _StudentSuggestionAppState(
      {final String? feedback,
      final String? feedbackError}) = _$StudentSuggestionAppStateImpl;

  @override
  String? get feedback;
  @override
  String? get feedbackError;
  @override
  @JsonKey(ignore: true)
  _$$StudentSuggestionAppStateImplCopyWith<_$StudentSuggestionAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
