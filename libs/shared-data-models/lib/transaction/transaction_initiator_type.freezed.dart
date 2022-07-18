// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_initiator_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TransactionInitiatorTypeTearOff {
  const _$TransactionInitiatorTypeTearOff();

  Receiver receiver() {
    return const Receiver();
  }

  Sender sender() {
    return const Sender();
  }

  TransactionInitiatorNA notAvailable() {
    return const TransactionInitiatorNA();
  }
}

/// @nodoc
const $TransactionInitiatorType = _$TransactionInitiatorTypeTearOff();

/// @nodoc
mixin _$TransactionInitiatorType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() receiver,
    required TResult Function() sender,
    required TResult Function() notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? receiver,
    TResult Function()? sender,
    TResult Function()? notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? receiver,
    TResult Function()? sender,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Receiver value) receiver,
    required TResult Function(Sender value) sender,
    required TResult Function(TransactionInitiatorNA value) notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Receiver value)? receiver,
    TResult Function(Sender value)? sender,
    TResult Function(TransactionInitiatorNA value)? notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Receiver value)? receiver,
    TResult Function(Sender value)? sender,
    TResult Function(TransactionInitiatorNA value)? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionInitiatorTypeCopyWith<$Res> {
  factory $TransactionInitiatorTypeCopyWith(TransactionInitiatorType value,
          $Res Function(TransactionInitiatorType) then) =
      _$TransactionInitiatorTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionInitiatorTypeCopyWithImpl<$Res>
    implements $TransactionInitiatorTypeCopyWith<$Res> {
  _$TransactionInitiatorTypeCopyWithImpl(this._value, this._then);

  final TransactionInitiatorType _value;
  // ignore: unused_field
  final $Res Function(TransactionInitiatorType) _then;
}

/// @nodoc
abstract class $ReceiverCopyWith<$Res> {
  factory $ReceiverCopyWith(Receiver value, $Res Function(Receiver) then) =
      _$ReceiverCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReceiverCopyWithImpl<$Res>
    extends _$TransactionInitiatorTypeCopyWithImpl<$Res>
    implements $ReceiverCopyWith<$Res> {
  _$ReceiverCopyWithImpl(Receiver _value, $Res Function(Receiver) _then)
      : super(_value, (v) => _then(v as Receiver));

  @override
  Receiver get _value => super._value as Receiver;
}

/// @nodoc

class _$Receiver extends Receiver {
  const _$Receiver() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Receiver);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() receiver,
    required TResult Function() sender,
    required TResult Function() notAvailable,
  }) {
    return receiver();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? receiver,
    TResult Function()? sender,
    TResult Function()? notAvailable,
  }) {
    return receiver?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? receiver,
    TResult Function()? sender,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (receiver != null) {
      return receiver();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Receiver value) receiver,
    required TResult Function(Sender value) sender,
    required TResult Function(TransactionInitiatorNA value) notAvailable,
  }) {
    return receiver(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Receiver value)? receiver,
    TResult Function(Sender value)? sender,
    TResult Function(TransactionInitiatorNA value)? notAvailable,
  }) {
    return receiver?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Receiver value)? receiver,
    TResult Function(Sender value)? sender,
    TResult Function(TransactionInitiatorNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (receiver != null) {
      return receiver(this);
    }
    return orElse();
  }
}

abstract class Receiver extends TransactionInitiatorType {
  const factory Receiver() = _$Receiver;
  const Receiver._() : super._();
}

/// @nodoc
abstract class $SenderCopyWith<$Res> {
  factory $SenderCopyWith(Sender value, $Res Function(Sender) then) =
      _$SenderCopyWithImpl<$Res>;
}

/// @nodoc
class _$SenderCopyWithImpl<$Res>
    extends _$TransactionInitiatorTypeCopyWithImpl<$Res>
    implements $SenderCopyWith<$Res> {
  _$SenderCopyWithImpl(Sender _value, $Res Function(Sender) _then)
      : super(_value, (v) => _then(v as Sender));

  @override
  Sender get _value => super._value as Sender;
}

/// @nodoc

class _$Sender extends Sender {
  const _$Sender() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Sender);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() receiver,
    required TResult Function() sender,
    required TResult Function() notAvailable,
  }) {
    return sender();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? receiver,
    TResult Function()? sender,
    TResult Function()? notAvailable,
  }) {
    return sender?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? receiver,
    TResult Function()? sender,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (sender != null) {
      return sender();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Receiver value) receiver,
    required TResult Function(Sender value) sender,
    required TResult Function(TransactionInitiatorNA value) notAvailable,
  }) {
    return sender(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Receiver value)? receiver,
    TResult Function(Sender value)? sender,
    TResult Function(TransactionInitiatorNA value)? notAvailable,
  }) {
    return sender?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Receiver value)? receiver,
    TResult Function(Sender value)? sender,
    TResult Function(TransactionInitiatorNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (sender != null) {
      return sender(this);
    }
    return orElse();
  }
}

abstract class Sender extends TransactionInitiatorType {
  const factory Sender() = _$Sender;
  const Sender._() : super._();
}

/// @nodoc
abstract class $TransactionInitiatorNACopyWith<$Res> {
  factory $TransactionInitiatorNACopyWith(TransactionInitiatorNA value,
          $Res Function(TransactionInitiatorNA) then) =
      _$TransactionInitiatorNACopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionInitiatorNACopyWithImpl<$Res>
    extends _$TransactionInitiatorTypeCopyWithImpl<$Res>
    implements $TransactionInitiatorNACopyWith<$Res> {
  _$TransactionInitiatorNACopyWithImpl(TransactionInitiatorNA _value,
      $Res Function(TransactionInitiatorNA) _then)
      : super(_value, (v) => _then(v as TransactionInitiatorNA));

  @override
  TransactionInitiatorNA get _value => super._value as TransactionInitiatorNA;
}

/// @nodoc

class _$TransactionInitiatorNA extends TransactionInitiatorNA {
  const _$TransactionInitiatorNA() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TransactionInitiatorNA);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() receiver,
    required TResult Function() sender,
    required TResult Function() notAvailable,
  }) {
    return notAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? receiver,
    TResult Function()? sender,
    TResult Function()? notAvailable,
  }) {
    return notAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? receiver,
    TResult Function()? sender,
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
    required TResult Function(Receiver value) receiver,
    required TResult Function(Sender value) sender,
    required TResult Function(TransactionInitiatorNA value) notAvailable,
  }) {
    return notAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Receiver value)? receiver,
    TResult Function(Sender value)? sender,
    TResult Function(TransactionInitiatorNA value)? notAvailable,
  }) {
    return notAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Receiver value)? receiver,
    TResult Function(Sender value)? sender,
    TResult Function(TransactionInitiatorNA value)? notAvailable,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable(this);
    }
    return orElse();
  }
}

abstract class TransactionInitiatorNA extends TransactionInitiatorType {
  const factory TransactionInitiatorNA() = _$TransactionInitiatorNA;
  const TransactionInitiatorNA._() : super._();
}
