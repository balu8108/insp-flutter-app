// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RatingAppState {
  int get feedbackId => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  String get ratingError => throw _privateConstructorUsedError;
  String get feedback => throw _privateConstructorUsedError;
  String get feedbackError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RatingAppStateCopyWith<RatingAppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingAppStateCopyWith<$Res> {
  factory $RatingAppStateCopyWith(
          RatingAppState value, $Res Function(RatingAppState) then) =
      _$RatingAppStateCopyWithImpl<$Res, RatingAppState>;
  @useResult
  $Res call(
      {int feedbackId,
      double rating,
      String ratingError,
      String feedback,
      String feedbackError});
}

/// @nodoc
class _$RatingAppStateCopyWithImpl<$Res, $Val extends RatingAppState>
    implements $RatingAppStateCopyWith<$Res> {
  _$RatingAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedbackId = null,
    Object? rating = null,
    Object? ratingError = null,
    Object? feedback = null,
    Object? feedbackError = null,
  }) {
    return _then(_value.copyWith(
      feedbackId: null == feedbackId
          ? _value.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingError: null == ratingError
          ? _value.ratingError
          : ratingError // ignore: cast_nullable_to_non_nullable
              as String,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
      feedbackError: null == feedbackError
          ? _value.feedbackError
          : feedbackError // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingAppStateImplCopyWith<$Res>
    implements $RatingAppStateCopyWith<$Res> {
  factory _$$RatingAppStateImplCopyWith(_$RatingAppStateImpl value,
          $Res Function(_$RatingAppStateImpl) then) =
      __$$RatingAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int feedbackId,
      double rating,
      String ratingError,
      String feedback,
      String feedbackError});
}

/// @nodoc
class __$$RatingAppStateImplCopyWithImpl<$Res>
    extends _$RatingAppStateCopyWithImpl<$Res, _$RatingAppStateImpl>
    implements _$$RatingAppStateImplCopyWith<$Res> {
  __$$RatingAppStateImplCopyWithImpl(
      _$RatingAppStateImpl _value, $Res Function(_$RatingAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? feedbackId = null,
    Object? rating = null,
    Object? ratingError = null,
    Object? feedback = null,
    Object? feedbackError = null,
  }) {
    return _then(_$RatingAppStateImpl(
      feedbackId: null == feedbackId
          ? _value.feedbackId
          : feedbackId // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
      ratingError: null == ratingError
          ? _value.ratingError
          : ratingError // ignore: cast_nullable_to_non_nullable
              as String,
      feedback: null == feedback
          ? _value.feedback
          : feedback // ignore: cast_nullable_to_non_nullable
              as String,
      feedbackError: null == feedbackError
          ? _value.feedbackError
          : feedbackError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RatingAppStateImpl
    with DiagnosticableTreeMixin
    implements _RatingAppState {
  const _$RatingAppStateImpl(
      {required this.feedbackId,
      this.rating = 0.0,
      this.ratingError = '',
      this.feedback = '',
      this.feedbackError = ''});

  @override
  final int feedbackId;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final String ratingError;
  @override
  @JsonKey()
  final String feedback;
  @override
  @JsonKey()
  final String feedbackError;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RatingAppState(feedbackId: $feedbackId, rating: $rating, ratingError: $ratingError, feedback: $feedback, feedbackError: $feedbackError)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RatingAppState'))
      ..add(DiagnosticsProperty('feedbackId', feedbackId))
      ..add(DiagnosticsProperty('rating', rating))
      ..add(DiagnosticsProperty('ratingError', ratingError))
      ..add(DiagnosticsProperty('feedback', feedback))
      ..add(DiagnosticsProperty('feedbackError', feedbackError));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingAppStateImpl &&
            (identical(other.feedbackId, feedbackId) ||
                other.feedbackId == feedbackId) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.ratingError, ratingError) ||
                other.ratingError == ratingError) &&
            (identical(other.feedback, feedback) ||
                other.feedback == feedback) &&
            (identical(other.feedbackError, feedbackError) ||
                other.feedbackError == feedbackError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, feedbackId, rating, ratingError, feedback, feedbackError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingAppStateImplCopyWith<_$RatingAppStateImpl> get copyWith =>
      __$$RatingAppStateImplCopyWithImpl<_$RatingAppStateImpl>(
          this, _$identity);
}

abstract class _RatingAppState implements RatingAppState {
  const factory _RatingAppState(
      {required final int feedbackId,
      final double rating,
      final String ratingError,
      final String feedback,
      final String feedbackError}) = _$RatingAppStateImpl;

  @override
  int get feedbackId;
  @override
  double get rating;
  @override
  String get ratingError;
  @override
  String get feedback;
  @override
  String get feedbackError;
  @override
  @JsonKey(ignore: true)
  _$$RatingAppStateImplCopyWith<_$RatingAppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
