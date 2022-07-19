// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'card_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CardType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() debit,
    required TResult Function() credit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DebitCard value) debit,
    required TResult Function(CreditCard value) credit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DebitCard value)? debit,
    TResult Function(CreditCard value)? credit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DebitCard value)? debit,
    TResult Function(CreditCard value)? credit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardTypeCopyWith<$Res> {
  factory $CardTypeCopyWith(CardType value, $Res Function(CardType) then) =
      _$CardTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$CardTypeCopyWithImpl<$Res> implements $CardTypeCopyWith<$Res> {
  _$CardTypeCopyWithImpl(this._value, this._then);

  final CardType _value;
  // ignore: unused_field
  final $Res Function(CardType) _then;
}

/// @nodoc
abstract class _$$DebitCardCopyWith<$Res> {
  factory _$$DebitCardCopyWith(
          _$DebitCard value, $Res Function(_$DebitCard) then) =
      __$$DebitCardCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DebitCardCopyWithImpl<$Res> extends _$CardTypeCopyWithImpl<$Res>
    implements _$$DebitCardCopyWith<$Res> {
  __$$DebitCardCopyWithImpl(
      _$DebitCard _value, $Res Function(_$DebitCard) _then)
      : super(_value, (v) => _then(v as _$DebitCard));

  @override
  _$DebitCard get _value => super._value as _$DebitCard;
}

/// @nodoc

class _$DebitCard extends DebitCard {
  const _$DebitCard() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DebitCard);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() debit,
    required TResult Function() credit,
  }) {
    return debit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
  }) {
    return debit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
    required TResult orElse(),
  }) {
    if (debit != null) {
      return debit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DebitCard value) debit,
    required TResult Function(CreditCard value) credit,
  }) {
    return debit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DebitCard value)? debit,
    TResult Function(CreditCard value)? credit,
  }) {
    return debit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DebitCard value)? debit,
    TResult Function(CreditCard value)? credit,
    required TResult orElse(),
  }) {
    if (debit != null) {
      return debit(this);
    }
    return orElse();
  }
}

abstract class DebitCard extends CardType {
  const factory DebitCard() = _$DebitCard;
  const DebitCard._() : super._();
}

/// @nodoc
abstract class _$$CreditCardCopyWith<$Res> {
  factory _$$CreditCardCopyWith(
          _$CreditCard value, $Res Function(_$CreditCard) then) =
      __$$CreditCardCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreditCardCopyWithImpl<$Res> extends _$CardTypeCopyWithImpl<$Res>
    implements _$$CreditCardCopyWith<$Res> {
  __$$CreditCardCopyWithImpl(
      _$CreditCard _value, $Res Function(_$CreditCard) _then)
      : super(_value, (v) => _then(v as _$CreditCard));

  @override
  _$CreditCard get _value => super._value as _$CreditCard;
}

/// @nodoc

class _$CreditCard extends CreditCard {
  const _$CreditCard() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreditCard);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() debit,
    required TResult Function() credit,
  }) {
    return credit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
  }) {
    return credit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
    required TResult orElse(),
  }) {
    if (credit != null) {
      return credit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DebitCard value) debit,
    required TResult Function(CreditCard value) credit,
  }) {
    return credit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(DebitCard value)? debit,
    TResult Function(CreditCard value)? credit,
  }) {
    return credit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DebitCard value)? debit,
    TResult Function(CreditCard value)? credit,
    required TResult orElse(),
  }) {
    if (credit != null) {
      return credit(this);
    }
    return orElse();
  }
}

abstract class CreditCard extends CardType {
  const factory CreditCard() = _$CreditCard;
  const CreditCard._() : super._();
}
