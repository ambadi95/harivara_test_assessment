// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TransactionStatusTearOff {
  const _$TransactionStatusTearOff();

  Success success() {
    return const Success();
  }

  Pending pending() {
    return const Pending();
  }

  Failed failed() {
    return const Failed();
  }

  Queued queued() {
    return const Queued();
  }

  Cancelled cancelled() {
    return const Cancelled();
  }

  TransactionStatusNA notAvailable() {
    return const TransactionStatusNA();
  }
}

/// @nodoc
const $TransactionStatus = _$TransactionStatusTearOff();

/// @nodoc
mixin _$TransactionStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() pending,
    required TResult Function() failed,
    required TResult Function() queued,
    required TResult Function() cancelled,
    required TResult Function() notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Pending value) pending,
    required TResult Function(Failed value) failed,
    required TResult Function(Queued value) queued,
    required TResult Function(Cancelled value) cancelled,
    required TResult Function(TransactionStatusNA value) notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStatusCopyWith<$Res> {
  factory $TransactionStatusCopyWith(
          TransactionStatus value, $Res Function(TransactionStatus) then) =
      _$TransactionStatusCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionStatusCopyWithImpl<$Res>
    implements $TransactionStatusCopyWith<$Res> {
  _$TransactionStatusCopyWithImpl(this._value, this._then);

  final TransactionStatus _value;
  // ignore: unused_field
  final $Res Function(TransactionStatus) _then;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$TransactionStatusCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;
}

/// @nodoc

class _$Success extends Success {
  const _$Success() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() pending,
    required TResult Function() failed,
    required TResult Function() queued,
    required TResult Function() cancelled,
    required TResult Function() notAvailable,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Pending value) pending,
    required TResult Function(Failed value) failed,
    required TResult Function(Queued value) queued,
    required TResult Function(Cancelled value) cancelled,
    required TResult Function(TransactionStatusNA value) notAvailable,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success extends TransactionStatus {
  const factory Success() = _$Success;
  const Success._() : super._();
}

/// @nodoc
abstract class $PendingCopyWith<$Res> {
  factory $PendingCopyWith(Pending value, $Res Function(Pending) then) =
      _$PendingCopyWithImpl<$Res>;
}

/// @nodoc
class _$PendingCopyWithImpl<$Res> extends _$TransactionStatusCopyWithImpl<$Res>
    implements $PendingCopyWith<$Res> {
  _$PendingCopyWithImpl(Pending _value, $Res Function(Pending) _then)
      : super(_value, (v) => _then(v as Pending));

  @override
  Pending get _value => super._value as Pending;
}

/// @nodoc

class _$Pending extends Pending {
  const _$Pending() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Pending);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() pending,
    required TResult Function() failed,
    required TResult Function() queued,
    required TResult Function() cancelled,
    required TResult Function() notAvailable,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Pending value) pending,
    required TResult Function(Failed value) failed,
    required TResult Function(Queued value) queued,
    required TResult Function(Cancelled value) cancelled,
    required TResult Function(TransactionStatusNA value) notAvailable,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class Pending extends TransactionStatus {
  const factory Pending() = _$Pending;
  const Pending._() : super._();
}

/// @nodoc
abstract class $FailedCopyWith<$Res> {
  factory $FailedCopyWith(Failed value, $Res Function(Failed) then) =
      _$FailedCopyWithImpl<$Res>;
}

/// @nodoc
class _$FailedCopyWithImpl<$Res> extends _$TransactionStatusCopyWithImpl<$Res>
    implements $FailedCopyWith<$Res> {
  _$FailedCopyWithImpl(Failed _value, $Res Function(Failed) _then)
      : super(_value, (v) => _then(v as Failed));

  @override
  Failed get _value => super._value as Failed;
}

/// @nodoc

class _$Failed extends Failed {
  const _$Failed() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Failed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() pending,
    required TResult Function() failed,
    required TResult Function() queued,
    required TResult Function() cancelled,
    required TResult Function() notAvailable,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
  }) {
    return failed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Pending value) pending,
    required TResult Function(Failed value) failed,
    required TResult Function(Queued value) queued,
    required TResult Function(Cancelled value) cancelled,
    required TResult Function(TransactionStatusNA value) notAvailable,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Failed extends TransactionStatus {
  const factory Failed() = _$Failed;
  const Failed._() : super._();
}

/// @nodoc
abstract class $QueuedCopyWith<$Res> {
  factory $QueuedCopyWith(Queued value, $Res Function(Queued) then) =
      _$QueuedCopyWithImpl<$Res>;
}

/// @nodoc
class _$QueuedCopyWithImpl<$Res> extends _$TransactionStatusCopyWithImpl<$Res>
    implements $QueuedCopyWith<$Res> {
  _$QueuedCopyWithImpl(Queued _value, $Res Function(Queued) _then)
      : super(_value, (v) => _then(v as Queued));

  @override
  Queued get _value => super._value as Queued;
}

/// @nodoc

class _$Queued extends Queued {
  const _$Queued() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Queued);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() pending,
    required TResult Function() failed,
    required TResult Function() queued,
    required TResult Function() cancelled,
    required TResult Function() notAvailable,
  }) {
    return queued();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
  }) {
    return queued?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (queued != null) {
      return queued();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Pending value) pending,
    required TResult Function(Failed value) failed,
    required TResult Function(Queued value) queued,
    required TResult Function(Cancelled value) cancelled,
    required TResult Function(TransactionStatusNA value) notAvailable,
  }) {
    return queued(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
  }) {
    return queued?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (queued != null) {
      return queued(this);
    }
    return orElse();
  }
}

abstract class Queued extends TransactionStatus {
  const factory Queued() = _$Queued;
  const Queued._() : super._();
}

/// @nodoc
abstract class $CancelledCopyWith<$Res> {
  factory $CancelledCopyWith(Cancelled value, $Res Function(Cancelled) then) =
      _$CancelledCopyWithImpl<$Res>;
}

/// @nodoc
class _$CancelledCopyWithImpl<$Res>
    extends _$TransactionStatusCopyWithImpl<$Res>
    implements $CancelledCopyWith<$Res> {
  _$CancelledCopyWithImpl(Cancelled _value, $Res Function(Cancelled) _then)
      : super(_value, (v) => _then(v as Cancelled));

  @override
  Cancelled get _value => super._value as Cancelled;
}

/// @nodoc

class _$Cancelled extends Cancelled {
  const _$Cancelled() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Cancelled);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() pending,
    required TResult Function() failed,
    required TResult Function() queued,
    required TResult Function() cancelled,
    required TResult Function() notAvailable,
  }) {
    return cancelled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
  }) {
    return cancelled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Success value) success,
    required TResult Function(Pending value) pending,
    required TResult Function(Failed value) failed,
    required TResult Function(Queued value) queued,
    required TResult Function(Cancelled value) cancelled,
    required TResult Function(TransactionStatusNA value) notAvailable,
  }) {
    return cancelled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
  }) {
    return cancelled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (cancelled != null) {
      return cancelled(this);
    }
    return orElse();
  }
}

abstract class Cancelled extends TransactionStatus {
  const factory Cancelled() = _$Cancelled;
  const Cancelled._() : super._();
}

/// @nodoc
abstract class $TransactionStatusNACopyWith<$Res> {
  factory $TransactionStatusNACopyWith(
          TransactionStatusNA value, $Res Function(TransactionStatusNA) then) =
      _$TransactionStatusNACopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionStatusNACopyWithImpl<$Res>
    extends _$TransactionStatusCopyWithImpl<$Res>
    implements $TransactionStatusNACopyWith<$Res> {
  _$TransactionStatusNACopyWithImpl(
      TransactionStatusNA _value, $Res Function(TransactionStatusNA) _then)
      : super(_value, (v) => _then(v as TransactionStatusNA));

  @override
  TransactionStatusNA get _value => super._value as TransactionStatusNA;
}

/// @nodoc

class _$TransactionStatusNA extends TransactionStatusNA {
  const _$TransactionStatusNA() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TransactionStatusNA);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() success,
    required TResult Function() pending,
    required TResult Function() failed,
    required TResult Function() queued,
    required TResult Function() cancelled,
    required TResult Function() notAvailable,
  }) {
    return notAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
    TResult Function()? notAvailable,
  }) {
    return notAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? success,
    TResult Function()? pending,
    TResult Function()? failed,
    TResult Function()? queued,
    TResult Function()? cancelled,
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
    required TResult Function(Success value) success,
    required TResult Function(Pending value) pending,
    required TResult Function(Failed value) failed,
    required TResult Function(Queued value) queued,
    required TResult Function(Cancelled value) cancelled,
    required TResult Function(TransactionStatusNA value) notAvailable,
  }) {
    return notAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
  }) {
    return notAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Success value)? success,
    TResult Function(Pending value)? pending,
    TResult Function(Failed value)? failed,
    TResult Function(Queued value)? queued,
    TResult Function(Cancelled value)? cancelled,
    TResult Function(TransactionStatusNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable(this);
    }
    return orElse();
  }
}

abstract class TransactionStatusNA extends TransactionStatus {
  const factory TransactionStatusNA() = _$TransactionStatusNA;
  const TransactionStatusNA._() : super._();
}
