// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_initiator_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$ReceiverCopyWith<$Res> {
  factory _$$ReceiverCopyWith(
          _$Receiver value, $Res Function(_$Receiver) then) =
      __$$ReceiverCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReceiverCopyWithImpl<$Res>
    extends _$TransactionInitiatorTypeCopyWithImpl<$Res>
    implements _$$ReceiverCopyWith<$Res> {
  __$$ReceiverCopyWithImpl(_$Receiver _value, $Res Function(_$Receiver) _then)
      : super(_value, (v) => _then(v as _$Receiver));

  @override
  _$Receiver get _value => super._value as _$Receiver;
}

/// @nodoc

class _$Receiver extends Receiver {
  const _$Receiver() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Receiver);
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
abstract class _$$SenderCopyWith<$Res> {
  factory _$$SenderCopyWith(_$Sender value, $Res Function(_$Sender) then) =
      __$$SenderCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SenderCopyWithImpl<$Res>
    extends _$TransactionInitiatorTypeCopyWithImpl<$Res>
    implements _$$SenderCopyWith<$Res> {
  __$$SenderCopyWithImpl(_$Sender _value, $Res Function(_$Sender) _then)
      : super(_value, (v) => _then(v as _$Sender));

  @override
  _$Sender get _value => super._value as _$Sender;
}

/// @nodoc

class _$Sender extends Sender {
  const _$Sender() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Sender);
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
abstract class _$$TransactionInitiatorNACopyWith<$Res> {
  factory _$$TransactionInitiatorNACopyWith(_$TransactionInitiatorNA value,
          $Res Function(_$TransactionInitiatorNA) then) =
      __$$TransactionInitiatorNACopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionInitiatorNACopyWithImpl<$Res>
    extends _$TransactionInitiatorTypeCopyWithImpl<$Res>
    implements _$$TransactionInitiatorNACopyWith<$Res> {
  __$$TransactionInitiatorNACopyWithImpl(_$TransactionInitiatorNA _value,
      $Res Function(_$TransactionInitiatorNA) _then)
      : super(_value, (v) => _then(v as _$TransactionInitiatorNA));

  @override
  _$TransactionInitiatorNA get _value =>
      super._value as _$TransactionInitiatorNA;
}

/// @nodoc

class _$TransactionInitiatorNA extends TransactionInitiatorNA {
  const _$TransactionInitiatorNA() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransactionInitiatorNA);
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
