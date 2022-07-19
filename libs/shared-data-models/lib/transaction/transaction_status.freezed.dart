// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$SuccessCopyWith<$Res> {
  factory _$$SuccessCopyWith(_$Success value, $Res Function(_$Success) then) =
      __$$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessCopyWithImpl<$Res>
    extends _$TransactionStatusCopyWithImpl<$Res>
    implements _$$SuccessCopyWith<$Res> {
  __$$SuccessCopyWithImpl(_$Success _value, $Res Function(_$Success) _then)
      : super(_value, (v) => _then(v as _$Success));

  @override
  _$Success get _value => super._value as _$Success;
}

/// @nodoc

class _$Success extends Success {
  const _$Success() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Success);
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
abstract class _$$PendingCopyWith<$Res> {
  factory _$$PendingCopyWith(_$Pending value, $Res Function(_$Pending) then) =
      __$$PendingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PendingCopyWithImpl<$Res>
    extends _$TransactionStatusCopyWithImpl<$Res>
    implements _$$PendingCopyWith<$Res> {
  __$$PendingCopyWithImpl(_$Pending _value, $Res Function(_$Pending) _then)
      : super(_value, (v) => _then(v as _$Pending));

  @override
  _$Pending get _value => super._value as _$Pending;
}

/// @nodoc

class _$Pending extends Pending {
  const _$Pending() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Pending);
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
abstract class _$$FailedCopyWith<$Res> {
  factory _$$FailedCopyWith(_$Failed value, $Res Function(_$Failed) then) =
      __$$FailedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FailedCopyWithImpl<$Res> extends _$TransactionStatusCopyWithImpl<$Res>
    implements _$$FailedCopyWith<$Res> {
  __$$FailedCopyWithImpl(_$Failed _value, $Res Function(_$Failed) _then)
      : super(_value, (v) => _then(v as _$Failed));

  @override
  _$Failed get _value => super._value as _$Failed;
}

/// @nodoc

class _$Failed extends Failed {
  const _$Failed() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Failed);
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
abstract class _$$QueuedCopyWith<$Res> {
  factory _$$QueuedCopyWith(_$Queued value, $Res Function(_$Queued) then) =
      __$$QueuedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$QueuedCopyWithImpl<$Res> extends _$TransactionStatusCopyWithImpl<$Res>
    implements _$$QueuedCopyWith<$Res> {
  __$$QueuedCopyWithImpl(_$Queued _value, $Res Function(_$Queued) _then)
      : super(_value, (v) => _then(v as _$Queued));

  @override
  _$Queued get _value => super._value as _$Queued;
}

/// @nodoc

class _$Queued extends Queued {
  const _$Queued() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Queued);
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
abstract class _$$CancelledCopyWith<$Res> {
  factory _$$CancelledCopyWith(
          _$Cancelled value, $Res Function(_$Cancelled) then) =
      __$$CancelledCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CancelledCopyWithImpl<$Res>
    extends _$TransactionStatusCopyWithImpl<$Res>
    implements _$$CancelledCopyWith<$Res> {
  __$$CancelledCopyWithImpl(
      _$Cancelled _value, $Res Function(_$Cancelled) _then)
      : super(_value, (v) => _then(v as _$Cancelled));

  @override
  _$Cancelled get _value => super._value as _$Cancelled;
}

/// @nodoc

class _$Cancelled extends Cancelled {
  const _$Cancelled() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Cancelled);
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
abstract class _$$TransactionStatusNACopyWith<$Res> {
  factory _$$TransactionStatusNACopyWith(_$TransactionStatusNA value,
          $Res Function(_$TransactionStatusNA) then) =
      __$$TransactionStatusNACopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionStatusNACopyWithImpl<$Res>
    extends _$TransactionStatusCopyWithImpl<$Res>
    implements _$$TransactionStatusNACopyWith<$Res> {
  __$$TransactionStatusNACopyWithImpl(
      _$TransactionStatusNA _value, $Res Function(_$TransactionStatusNA) _then)
      : super(_value, (v) => _then(v as _$TransactionStatusNA));

  @override
  _$TransactionStatusNA get _value => super._value as _$TransactionStatusNA;
}

/// @nodoc

class _$TransactionStatusNA extends TransactionStatusNA {
  const _$TransactionStatusNA() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransactionStatusNA);
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
