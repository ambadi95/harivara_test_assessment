// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_scheme_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountSchemeType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wallet,
    required TResult Function() iban,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? iban,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? iban,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WALLET value) wallet,
    required TResult Function(IBAN value) iban,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WALLET value)? wallet,
    TResult Function(IBAN value)? iban,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WALLET value)? wallet,
    TResult Function(IBAN value)? iban,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountSchemeTypeCopyWith<$Res> {
  factory $AccountSchemeTypeCopyWith(
          AccountSchemeType value, $Res Function(AccountSchemeType) then) =
      _$AccountSchemeTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountSchemeTypeCopyWithImpl<$Res>
    implements $AccountSchemeTypeCopyWith<$Res> {
  _$AccountSchemeTypeCopyWithImpl(this._value, this._then);

  final AccountSchemeType _value;
  // ignore: unused_field
  final $Res Function(AccountSchemeType) _then;
}

/// @nodoc
abstract class _$$WALLETCopyWith<$Res> {
  factory _$$WALLETCopyWith(_$WALLET value, $Res Function(_$WALLET) then) =
      __$$WALLETCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WALLETCopyWithImpl<$Res> extends _$AccountSchemeTypeCopyWithImpl<$Res>
    implements _$$WALLETCopyWith<$Res> {
  __$$WALLETCopyWithImpl(_$WALLET _value, $Res Function(_$WALLET) _then)
      : super(_value, (v) => _then(v as _$WALLET));

  @override
  _$WALLET get _value => super._value as _$WALLET;
}

/// @nodoc

class _$WALLET extends WALLET {
  const _$WALLET() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WALLET);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wallet,
    required TResult Function() iban,
  }) {
    return wallet();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? iban,
  }) {
    return wallet?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? iban,
    required TResult orElse(),
  }) {
    if (wallet != null) {
      return wallet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WALLET value) wallet,
    required TResult Function(IBAN value) iban,
  }) {
    return wallet(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WALLET value)? wallet,
    TResult Function(IBAN value)? iban,
  }) {
    return wallet?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WALLET value)? wallet,
    TResult Function(IBAN value)? iban,
    required TResult orElse(),
  }) {
    if (wallet != null) {
      return wallet(this);
    }
    return orElse();
  }
}

abstract class WALLET extends AccountSchemeType {
  const factory WALLET() = _$WALLET;
  const WALLET._() : super._();
}

/// @nodoc
abstract class _$$IBANCopyWith<$Res> {
  factory _$$IBANCopyWith(_$IBAN value, $Res Function(_$IBAN) then) =
      __$$IBANCopyWithImpl<$Res>;
}

/// @nodoc
class __$$IBANCopyWithImpl<$Res> extends _$AccountSchemeTypeCopyWithImpl<$Res>
    implements _$$IBANCopyWith<$Res> {
  __$$IBANCopyWithImpl(_$IBAN _value, $Res Function(_$IBAN) _then)
      : super(_value, (v) => _then(v as _$IBAN));

  @override
  _$IBAN get _value => super._value as _$IBAN;
}

/// @nodoc

class _$IBAN extends IBAN {
  const _$IBAN() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IBAN);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() wallet,
    required TResult Function() iban,
  }) {
    return iban();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? iban,
  }) {
    return iban?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? wallet,
    TResult Function()? iban,
    required TResult orElse(),
  }) {
    if (iban != null) {
      return iban();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WALLET value) wallet,
    required TResult Function(IBAN value) iban,
  }) {
    return iban(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(WALLET value)? wallet,
    TResult Function(IBAN value)? iban,
  }) {
    return iban?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WALLET value)? wallet,
    TResult Function(IBAN value)? iban,
    required TResult orElse(),
  }) {
    if (iban != null) {
      return iban(this);
    }
    return orElse();
  }
}

abstract class IBAN extends AccountSchemeType {
  const factory IBAN() = _$IBAN;
  const IBAN._() : super._();
}
