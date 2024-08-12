// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_feedback_detail_redux.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RatingFeedbackDetailAppState {
  INSPCardModel get selectedItem => throw _privateConstructorUsedError;
  List<INSPCardModel> get allTopic => throw _privateConstructorUsedError;
  List<RatingFeedbackCardModal> get ratingFeedbackCard =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RatingFeedbackDetailAppStateCopyWith<RatingFeedbackDetailAppState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RatingFeedbackDetailAppStateCopyWith<$Res> {
  factory $RatingFeedbackDetailAppStateCopyWith(
          RatingFeedbackDetailAppState value,
          $Res Function(RatingFeedbackDetailAppState) then) =
      _$RatingFeedbackDetailAppStateCopyWithImpl<$Res,
          RatingFeedbackDetailAppState>;
  @useResult
  $Res call(
      {INSPCardModel selectedItem,
      List<INSPCardModel> allTopic,
      List<RatingFeedbackCardModal> ratingFeedbackCard});
}

/// @nodoc
class _$RatingFeedbackDetailAppStateCopyWithImpl<$Res,
        $Val extends RatingFeedbackDetailAppState>
    implements $RatingFeedbackDetailAppStateCopyWith<$Res> {
  _$RatingFeedbackDetailAppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
    Object? allTopic = null,
    Object? ratingFeedbackCard = null,
  }) {
    return _then(_value.copyWith(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allTopic: null == allTopic
          ? _value.allTopic
          : allTopic // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      ratingFeedbackCard: null == ratingFeedbackCard
          ? _value.ratingFeedbackCard
          : ratingFeedbackCard // ignore: cast_nullable_to_non_nullable
              as List<RatingFeedbackCardModal>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RatingFeedbackDetailAppStateImplCopyWith<$Res>
    implements $RatingFeedbackDetailAppStateCopyWith<$Res> {
  factory _$$RatingFeedbackDetailAppStateImplCopyWith(
          _$RatingFeedbackDetailAppStateImpl value,
          $Res Function(_$RatingFeedbackDetailAppStateImpl) then) =
      __$$RatingFeedbackDetailAppStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {INSPCardModel selectedItem,
      List<INSPCardModel> allTopic,
      List<RatingFeedbackCardModal> ratingFeedbackCard});
}

/// @nodoc
class __$$RatingFeedbackDetailAppStateImplCopyWithImpl<$Res>
    extends _$RatingFeedbackDetailAppStateCopyWithImpl<$Res,
        _$RatingFeedbackDetailAppStateImpl>
    implements _$$RatingFeedbackDetailAppStateImplCopyWith<$Res> {
  __$$RatingFeedbackDetailAppStateImplCopyWithImpl(
      _$RatingFeedbackDetailAppStateImpl _value,
      $Res Function(_$RatingFeedbackDetailAppStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedItem = null,
    Object? allTopic = null,
    Object? ratingFeedbackCard = null,
  }) {
    return _then(_$RatingFeedbackDetailAppStateImpl(
      selectedItem: null == selectedItem
          ? _value.selectedItem
          : selectedItem // ignore: cast_nullable_to_non_nullable
              as INSPCardModel,
      allTopic: null == allTopic
          ? _value._allTopic
          : allTopic // ignore: cast_nullable_to_non_nullable
              as List<INSPCardModel>,
      ratingFeedbackCard: null == ratingFeedbackCard
          ? _value._ratingFeedbackCard
          : ratingFeedbackCard // ignore: cast_nullable_to_non_nullable
              as List<RatingFeedbackCardModal>,
    ));
  }
}

/// @nodoc

class _$RatingFeedbackDetailAppStateImpl
    with DiagnosticableTreeMixin
    implements _RatingFeedbackDetailAppState {
  const _$RatingFeedbackDetailAppStateImpl(
      {required this.selectedItem,
      final List<INSPCardModel> allTopic = const [],
      final List<RatingFeedbackCardModal> ratingFeedbackCard = const []})
      : _allTopic = allTopic,
        _ratingFeedbackCard = ratingFeedbackCard;

  @override
  final INSPCardModel selectedItem;
  final List<INSPCardModel> _allTopic;
  @override
  @JsonKey()
  List<INSPCardModel> get allTopic {
    if (_allTopic is EqualUnmodifiableListView) return _allTopic;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTopic);
  }

  final List<RatingFeedbackCardModal> _ratingFeedbackCard;
  @override
  @JsonKey()
  List<RatingFeedbackCardModal> get ratingFeedbackCard {
    if (_ratingFeedbackCard is EqualUnmodifiableListView)
      return _ratingFeedbackCard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ratingFeedbackCard);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RatingFeedbackDetailAppState(selectedItem: $selectedItem, allTopic: $allTopic, ratingFeedbackCard: $ratingFeedbackCard)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RatingFeedbackDetailAppState'))
      ..add(DiagnosticsProperty('selectedItem', selectedItem))
      ..add(DiagnosticsProperty('allTopic', allTopic))
      ..add(DiagnosticsProperty('ratingFeedbackCard', ratingFeedbackCard));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RatingFeedbackDetailAppStateImpl &&
            (identical(other.selectedItem, selectedItem) ||
                other.selectedItem == selectedItem) &&
            const DeepCollectionEquality().equals(other._allTopic, _allTopic) &&
            const DeepCollectionEquality()
                .equals(other._ratingFeedbackCard, _ratingFeedbackCard));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      selectedItem,
      const DeepCollectionEquality().hash(_allTopic),
      const DeepCollectionEquality().hash(_ratingFeedbackCard));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RatingFeedbackDetailAppStateImplCopyWith<
          _$RatingFeedbackDetailAppStateImpl>
      get copyWith => __$$RatingFeedbackDetailAppStateImplCopyWithImpl<
          _$RatingFeedbackDetailAppStateImpl>(this, _$identity);
}

abstract class _RatingFeedbackDetailAppState
    implements RatingFeedbackDetailAppState {
  const factory _RatingFeedbackDetailAppState(
          {required final INSPCardModel selectedItem,
          final List<INSPCardModel> allTopic,
          final List<RatingFeedbackCardModal> ratingFeedbackCard}) =
      _$RatingFeedbackDetailAppStateImpl;

  @override
  INSPCardModel get selectedItem;
  @override
  List<INSPCardModel> get allTopic;
  @override
  List<RatingFeedbackCardModal> get ratingFeedbackCard;
  @override
  @JsonKey(ignore: true)
  _$$RatingFeedbackDetailAppStateImplCopyWith<
          _$RatingFeedbackDetailAppStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
