// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'cards_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CardsStateTearOff {
  const _$CardsStateTearOff();

  NoCards noCards() {
    return NoCards();
  }

  ExistingCards existingCards() {
    return ExistingCards();
  }

  CardsDeleted cardsDeleted() {
    return CardsDeleted();
  }

  CardsScanned cardScanned(String number, int month, int year, bool hasCards) {
    return CardsScanned(
      number,
      month,
      year,
      hasCards,
    );
  }
}

/// @nodoc
const $CardsState = _$CardsStateTearOff();

/// @nodoc
mixin _$CardsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noCards,
    required TResult Function() existingCards,
    required TResult Function() cardsDeleted,
    required TResult Function(String number, int month, int year, bool hasCards)
        cardScanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noCards,
    TResult Function()? existingCards,
    TResult Function()? cardsDeleted,
    TResult Function(String number, int month, int year, bool hasCards)?
        cardScanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noCards,
    TResult Function()? existingCards,
    TResult Function()? cardsDeleted,
    TResult Function(String number, int month, int year, bool hasCards)?
        cardScanned,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoCards value) noCards,
    required TResult Function(ExistingCards value) existingCards,
    required TResult Function(CardsDeleted value) cardsDeleted,
    required TResult Function(CardsScanned value) cardScanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoCards value)? noCards,
    TResult Function(ExistingCards value)? existingCards,
    TResult Function(CardsDeleted value)? cardsDeleted,
    TResult Function(CardsScanned value)? cardScanned,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoCards value)? noCards,
    TResult Function(ExistingCards value)? existingCards,
    TResult Function(CardsDeleted value)? cardsDeleted,
    TResult Function(CardsScanned value)? cardScanned,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardsStateCopyWith<$Res> {
  factory $CardsStateCopyWith(
          CardsState value, $Res Function(CardsState) then) =
      _$CardsStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CardsStateCopyWithImpl<$Res> implements $CardsStateCopyWith<$Res> {
  _$CardsStateCopyWithImpl(this._value, this._then);

  final CardsState _value;
  // ignore: unused_field
  final $Res Function(CardsState) _then;
}

/// @nodoc
abstract class $NoCardsCopyWith<$Res> {
  factory $NoCardsCopyWith(NoCards value, $Res Function(NoCards) then) =
      _$NoCardsCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoCardsCopyWithImpl<$Res> extends _$CardsStateCopyWithImpl<$Res>
    implements $NoCardsCopyWith<$Res> {
  _$NoCardsCopyWithImpl(NoCards _value, $Res Function(NoCards) _then)
      : super(_value, (v) => _then(v as NoCards));

  @override
  NoCards get _value => super._value as NoCards;
}

/// @nodoc

class _$NoCards implements NoCards {
  _$NoCards();

  @override
  String toString() {
    return 'CardsState.noCards()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NoCards);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noCards,
    required TResult Function() existingCards,
    required TResult Function() cardsDeleted,
    required TResult Function(String number, int month, int year, bool hasCards)
        cardScanned,
  }) {
    return noCards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noCards,
    TResult Function()? existingCards,
    TResult Function()? cardsDeleted,
    TResult Function(String number, int month, int year, bool hasCards)?
        cardScanned,
  }) {
    return noCards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noCards,
    TResult Function()? existingCards,
    TResult Function()? cardsDeleted,
    TResult Function(String number, int month, int year, bool hasCards)?
        cardScanned,
    required TResult orElse(),
  }) {
    if (noCards != null) {
      return noCards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoCards value) noCards,
    required TResult Function(ExistingCards value) existingCards,
    required TResult Function(CardsDeleted value) cardsDeleted,
    required TResult Function(CardsScanned value) cardScanned,
  }) {
    return noCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoCards value)? noCards,
    TResult Function(ExistingCards value)? existingCards,
    TResult Function(CardsDeleted value)? cardsDeleted,
    TResult Function(CardsScanned value)? cardScanned,
  }) {
    return noCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoCards value)? noCards,
    TResult Function(ExistingCards value)? existingCards,
    TResult Function(CardsDeleted value)? cardsDeleted,
    TResult Function(CardsScanned value)? cardScanned,
    required TResult orElse(),
  }) {
    if (noCards != null) {
      return noCards(this);
    }
    return orElse();
  }
}

abstract class NoCards implements CardsState {
  factory NoCards() = _$NoCards;
}

/// @nodoc
abstract class $ExistingCardsCopyWith<$Res> {
  factory $ExistingCardsCopyWith(
          ExistingCards value, $Res Function(ExistingCards) then) =
      _$ExistingCardsCopyWithImpl<$Res>;
}

/// @nodoc
class _$ExistingCardsCopyWithImpl<$Res> extends _$CardsStateCopyWithImpl<$Res>
    implements $ExistingCardsCopyWith<$Res> {
  _$ExistingCardsCopyWithImpl(
      ExistingCards _value, $Res Function(ExistingCards) _then)
      : super(_value, (v) => _then(v as ExistingCards));

  @override
  ExistingCards get _value => super._value as ExistingCards;
}

/// @nodoc

class _$ExistingCards implements ExistingCards {
  _$ExistingCards();

  @override
  String toString() {
    return 'CardsState.existingCards()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ExistingCards);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noCards,
    required TResult Function() existingCards,
    required TResult Function() cardsDeleted,
    required TResult Function(String number, int month, int year, bool hasCards)
        cardScanned,
  }) {
    return existingCards();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noCards,
    TResult Function()? existingCards,
    TResult Function()? cardsDeleted,
    TResult Function(String number, int month, int year, bool hasCards)?
        cardScanned,
  }) {
    return existingCards?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noCards,
    TResult Function()? existingCards,
    TResult Function()? cardsDeleted,
    TResult Function(String number, int month, int year, bool hasCards)?
        cardScanned,
    required TResult orElse(),
  }) {
    if (existingCards != null) {
      return existingCards();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoCards value) noCards,
    required TResult Function(ExistingCards value) existingCards,
    required TResult Function(CardsDeleted value) cardsDeleted,
    required TResult Function(CardsScanned value) cardScanned,
  }) {
    return existingCards(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoCards value)? noCards,
    TResult Function(ExistingCards value)? existingCards,
    TResult Function(CardsDeleted value)? cardsDeleted,
    TResult Function(CardsScanned value)? cardScanned,
  }) {
    return existingCards?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoCards value)? noCards,
    TResult Function(ExistingCards value)? existingCards,
    TResult Function(CardsDeleted value)? cardsDeleted,
    TResult Function(CardsScanned value)? cardScanned,
    required TResult orElse(),
  }) {
    if (existingCards != null) {
      return existingCards(this);
    }
    return orElse();
  }
}

abstract class ExistingCards implements CardsState {
  factory ExistingCards() = _$ExistingCards;
}

/// @nodoc
abstract class $CardsDeletedCopyWith<$Res> {
  factory $CardsDeletedCopyWith(
          CardsDeleted value, $Res Function(CardsDeleted) then) =
      _$CardsDeletedCopyWithImpl<$Res>;
}

/// @nodoc
class _$CardsDeletedCopyWithImpl<$Res> extends _$CardsStateCopyWithImpl<$Res>
    implements $CardsDeletedCopyWith<$Res> {
  _$CardsDeletedCopyWithImpl(
      CardsDeleted _value, $Res Function(CardsDeleted) _then)
      : super(_value, (v) => _then(v as CardsDeleted));

  @override
  CardsDeleted get _value => super._value as CardsDeleted;
}

/// @nodoc

class _$CardsDeleted implements CardsDeleted {
  _$CardsDeleted();

  @override
  String toString() {
    return 'CardsState.cardsDeleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CardsDeleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noCards,
    required TResult Function() existingCards,
    required TResult Function() cardsDeleted,
    required TResult Function(String number, int month, int year, bool hasCards)
        cardScanned,
  }) {
    return cardsDeleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noCards,
    TResult Function()? existingCards,
    TResult Function()? cardsDeleted,
    TResult Function(String number, int month, int year, bool hasCards)?
        cardScanned,
  }) {
    return cardsDeleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noCards,
    TResult Function()? existingCards,
    TResult Function()? cardsDeleted,
    TResult Function(String number, int month, int year, bool hasCards)?
        cardScanned,
    required TResult orElse(),
  }) {
    if (cardsDeleted != null) {
      return cardsDeleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoCards value) noCards,
    required TResult Function(ExistingCards value) existingCards,
    required TResult Function(CardsDeleted value) cardsDeleted,
    required TResult Function(CardsScanned value) cardScanned,
  }) {
    return cardsDeleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoCards value)? noCards,
    TResult Function(ExistingCards value)? existingCards,
    TResult Function(CardsDeleted value)? cardsDeleted,
    TResult Function(CardsScanned value)? cardScanned,
  }) {
    return cardsDeleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoCards value)? noCards,
    TResult Function(ExistingCards value)? existingCards,
    TResult Function(CardsDeleted value)? cardsDeleted,
    TResult Function(CardsScanned value)? cardScanned,
    required TResult orElse(),
  }) {
    if (cardsDeleted != null) {
      return cardsDeleted(this);
    }
    return orElse();
  }
}

abstract class CardsDeleted implements CardsState {
  factory CardsDeleted() = _$CardsDeleted;
}

/// @nodoc
abstract class $CardsScannedCopyWith<$Res> {
  factory $CardsScannedCopyWith(
          CardsScanned value, $Res Function(CardsScanned) then) =
      _$CardsScannedCopyWithImpl<$Res>;
  $Res call({String number, int month, int year, bool hasCards});
}

/// @nodoc
class _$CardsScannedCopyWithImpl<$Res> extends _$CardsStateCopyWithImpl<$Res>
    implements $CardsScannedCopyWith<$Res> {
  _$CardsScannedCopyWithImpl(
      CardsScanned _value, $Res Function(CardsScanned) _then)
      : super(_value, (v) => _then(v as CardsScanned));

  @override
  CardsScanned get _value => super._value as CardsScanned;

  @override
  $Res call({
    Object? number = freezed,
    Object? month = freezed,
    Object? year = freezed,
    Object? hasCards = freezed,
  }) {
    return _then(CardsScanned(
      number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      month == freezed
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year == freezed
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      hasCards == freezed
          ? _value.hasCards
          : hasCards // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CardsScanned implements CardsScanned {
  _$CardsScanned(this.number, this.month, this.year, this.hasCards);

  @override
  final String number;
  @override
  final int month;
  @override
  final int year;
  @override
  final bool hasCards;

  @override
  String toString() {
    return 'CardsState.cardScanned(number: $number, month: $month, year: $year, hasCards: $hasCards)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CardsScanned &&
            const DeepCollectionEquality().equals(other.number, number) &&
            const DeepCollectionEquality().equals(other.month, month) &&
            const DeepCollectionEquality().equals(other.year, year) &&
            const DeepCollectionEquality().equals(other.hasCards, hasCards));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(number),
      const DeepCollectionEquality().hash(month),
      const DeepCollectionEquality().hash(year),
      const DeepCollectionEquality().hash(hasCards));

  @JsonKey(ignore: true)
  @override
  $CardsScannedCopyWith<CardsScanned> get copyWith =>
      _$CardsScannedCopyWithImpl<CardsScanned>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noCards,
    required TResult Function() existingCards,
    required TResult Function() cardsDeleted,
    required TResult Function(String number, int month, int year, bool hasCards)
        cardScanned,
  }) {
    return cardScanned(number, month, year, hasCards);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? noCards,
    TResult Function()? existingCards,
    TResult Function()? cardsDeleted,
    TResult Function(String number, int month, int year, bool hasCards)?
        cardScanned,
  }) {
    return cardScanned?.call(number, month, year, hasCards);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noCards,
    TResult Function()? existingCards,
    TResult Function()? cardsDeleted,
    TResult Function(String number, int month, int year, bool hasCards)?
        cardScanned,
    required TResult orElse(),
  }) {
    if (cardScanned != null) {
      return cardScanned(number, month, year, hasCards);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoCards value) noCards,
    required TResult Function(ExistingCards value) existingCards,
    required TResult Function(CardsDeleted value) cardsDeleted,
    required TResult Function(CardsScanned value) cardScanned,
  }) {
    return cardScanned(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NoCards value)? noCards,
    TResult Function(ExistingCards value)? existingCards,
    TResult Function(CardsDeleted value)? cardsDeleted,
    TResult Function(CardsScanned value)? cardScanned,
  }) {
    return cardScanned?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoCards value)? noCards,
    TResult Function(ExistingCards value)? existingCards,
    TResult Function(CardsDeleted value)? cardsDeleted,
    TResult Function(CardsScanned value)? cardScanned,
    required TResult orElse(),
  }) {
    if (cardScanned != null) {
      return cardScanned(this);
    }
    return orElse();
  }
}

abstract class CardsScanned implements CardsState {
  factory CardsScanned(String number, int month, int year, bool hasCards) =
      _$CardsScanned;

  String get number;
  int get month;
  int get year;
  bool get hasCards;
  @JsonKey(ignore: true)
  $CardsScannedCopyWith<CardsScanned> get copyWith =>
      throw _privateConstructorUsedError;
}
