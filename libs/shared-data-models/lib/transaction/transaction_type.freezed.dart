// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() debit,
    required TResult Function() credit,
    required TResult Function() notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
    TResult Function()? notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Debit value) debit,
    required TResult Function(Credit value) credit,
    required TResult Function(TransactionTypeNA value) notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Debit value)? debit,
    TResult Function(Credit value)? credit,
    TResult Function(TransactionTypeNA value)? notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Debit value)? debit,
    TResult Function(Credit value)? credit,
    TResult Function(TransactionTypeNA value)? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionTypeCopyWith<$Res> {
  factory $TransactionTypeCopyWith(
          TransactionType value, $Res Function(TransactionType) then) =
      _$TransactionTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionTypeCopyWithImpl<$Res>
    implements $TransactionTypeCopyWith<$Res> {
  _$TransactionTypeCopyWithImpl(this._value, this._then);

  final TransactionType _value;
  // ignore: unused_field
  final $Res Function(TransactionType) _then;
}

/// @nodoc
abstract class _$$DebitCopyWith<$Res> {
  factory _$$DebitCopyWith(_$Debit value, $Res Function(_$Debit) then) =
      __$$DebitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DebitCopyWithImpl<$Res> extends _$TransactionTypeCopyWithImpl<$Res>
    implements _$$DebitCopyWith<$Res> {
  __$$DebitCopyWithImpl(_$Debit _value, $Res Function(_$Debit) _then)
      : super(_value, (v) => _then(v as _$Debit));

  @override
  _$Debit get _value => super._value as _$Debit;
}

/// @nodoc

class _$Debit extends Debit {
  const _$Debit() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Debit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() debit,
    required TResult Function() credit,
    required TResult Function() notAvailable,
  }) {
    return debit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
    TResult Function()? notAvailable,
  }) {
    return debit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
    TResult Function()? notAvailable,
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
    required TResult Function(Debit value) debit,
    required TResult Function(Credit value) credit,
    required TResult Function(TransactionTypeNA value) notAvailable,
  }) {
    return debit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Debit value)? debit,
    TResult Function(Credit value)? credit,
    TResult Function(TransactionTypeNA value)? notAvailable,
  }) {
    return debit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Debit value)? debit,
    TResult Function(Credit value)? credit,
    TResult Function(TransactionTypeNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (debit != null) {
      return debit(this);
    }
    return orElse();
  }
}

abstract class Debit extends TransactionType {
  const factory Debit() = _$Debit;
  const Debit._() : super._();
}

/// @nodoc
abstract class _$$CreditCopyWith<$Res> {
  factory _$$CreditCopyWith(_$Credit value, $Res Function(_$Credit) then) =
      __$$CreditCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreditCopyWithImpl<$Res> extends _$TransactionTypeCopyWithImpl<$Res>
    implements _$$CreditCopyWith<$Res> {
  __$$CreditCopyWithImpl(_$Credit _value, $Res Function(_$Credit) _then)
      : super(_value, (v) => _then(v as _$Credit));

  @override
  _$Credit get _value => super._value as _$Credit;
}

/// @nodoc

class _$Credit extends Credit {
  const _$Credit() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Credit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() debit,
    required TResult Function() credit,
    required TResult Function() notAvailable,
  }) {
    return credit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
    TResult Function()? notAvailable,
  }) {
    return credit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
    TResult Function()? notAvailable,
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
    required TResult Function(Debit value) debit,
    required TResult Function(Credit value) credit,
    required TResult Function(TransactionTypeNA value) notAvailable,
  }) {
    return credit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Debit value)? debit,
    TResult Function(Credit value)? credit,
    TResult Function(TransactionTypeNA value)? notAvailable,
  }) {
    return credit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Debit value)? debit,
    TResult Function(Credit value)? credit,
    TResult Function(TransactionTypeNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (credit != null) {
      return credit(this);
    }
    return orElse();
  }
}

abstract class Credit extends TransactionType {
  const factory Credit() = _$Credit;
  const Credit._() : super._();
}

/// @nodoc
abstract class _$$TransactionTypeNACopyWith<$Res> {
  factory _$$TransactionTypeNACopyWith(
          _$TransactionTypeNA value, $Res Function(_$TransactionTypeNA) then) =
      __$$TransactionTypeNACopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionTypeNACopyWithImpl<$Res>
    extends _$TransactionTypeCopyWithImpl<$Res>
    implements _$$TransactionTypeNACopyWith<$Res> {
  __$$TransactionTypeNACopyWithImpl(
      _$TransactionTypeNA _value, $Res Function(_$TransactionTypeNA) _then)
      : super(_value, (v) => _then(v as _$TransactionTypeNA));

  @override
  _$TransactionTypeNA get _value => super._value as _$TransactionTypeNA;
}

/// @nodoc

class _$TransactionTypeNA extends TransactionTypeNA {
  const _$TransactionTypeNA() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransactionTypeNA);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() debit,
    required TResult Function() credit,
    required TResult Function() notAvailable,
  }) {
    return notAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
    TResult Function()? notAvailable,
  }) {
    return notAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? debit,
    TResult Function()? credit,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Debit value) debit,
    required TResult Function(Credit value) credit,
    required TResult Function(TransactionTypeNA value) notAvailable,
  }) {
    return notAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Debit value)? debit,
    TResult Function(Credit value)? credit,
    TResult Function(TransactionTypeNA value)? notAvailable,
  }) {
    return notAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Debit value)? debit,
    TResult Function(Credit value)? credit,
    TResult Function(TransactionTypeNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable(this);
    }
    return orElse();
  }
}

abstract class TransactionTypeNA extends TransactionType {
  const factory TransactionTypeNA() = _$TransactionTypeNA;
  const TransactionTypeNA._() : super._();
}
