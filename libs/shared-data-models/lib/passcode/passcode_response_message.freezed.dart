// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'passcode_response_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PasscodeResponseMessageTearOff {
  const _$PasscodeResponseMessageTearOff();

  PasscodeMessageLoginSuccess loginSuccess() {
    return const PasscodeMessageLoginSuccess();
  }

  PasscodeMessageLoginFailed loginFailed() {
    return const PasscodeMessageLoginFailed();
  }
}

/// @nodoc
const $PasscodeResponseMessage = _$PasscodeResponseMessageTearOff();

/// @nodoc
mixin _$PasscodeResponseMessage {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginSuccess,
    required TResult Function() loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function()? loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function()? loginFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasscodeMessageLoginSuccess value) loginSuccess,
    required TResult Function(PasscodeMessageLoginFailed value) loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeMessageLoginSuccess value)? loginSuccess,
    TResult Function(PasscodeMessageLoginFailed value)? loginFailed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeMessageLoginSuccess value)? loginSuccess,
    TResult Function(PasscodeMessageLoginFailed value)? loginFailed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PasscodeResponseMessageCopyWith<$Res> {
  factory $PasscodeResponseMessageCopyWith(PasscodeResponseMessage value,
          $Res Function(PasscodeResponseMessage) then) =
      _$PasscodeResponseMessageCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasscodeResponseMessageCopyWithImpl<$Res>
    implements $PasscodeResponseMessageCopyWith<$Res> {
  _$PasscodeResponseMessageCopyWithImpl(this._value, this._then);

  final PasscodeResponseMessage _value;
  // ignore: unused_field
  final $Res Function(PasscodeResponseMessage) _then;
}

/// @nodoc
abstract class $PasscodeMessageLoginSuccessCopyWith<$Res> {
  factory $PasscodeMessageLoginSuccessCopyWith(
          PasscodeMessageLoginSuccess value,
          $Res Function(PasscodeMessageLoginSuccess) then) =
      _$PasscodeMessageLoginSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasscodeMessageLoginSuccessCopyWithImpl<$Res>
    extends _$PasscodeResponseMessageCopyWithImpl<$Res>
    implements $PasscodeMessageLoginSuccessCopyWith<$Res> {
  _$PasscodeMessageLoginSuccessCopyWithImpl(PasscodeMessageLoginSuccess _value,
      $Res Function(PasscodeMessageLoginSuccess) _then)
      : super(_value, (v) => _then(v as PasscodeMessageLoginSuccess));

  @override
  PasscodeMessageLoginSuccess get _value =>
      super._value as PasscodeMessageLoginSuccess;
}

/// @nodoc

class _$PasscodeMessageLoginSuccess extends PasscodeMessageLoginSuccess {
  const _$PasscodeMessageLoginSuccess() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PasscodeMessageLoginSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginSuccess,
    required TResult Function() loginFailed,
  }) {
    return loginSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function()? loginFailed,
  }) {
    return loginSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function()? loginFailed,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasscodeMessageLoginSuccess value) loginSuccess,
    required TResult Function(PasscodeMessageLoginFailed value) loginFailed,
  }) {
    return loginSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeMessageLoginSuccess value)? loginSuccess,
    TResult Function(PasscodeMessageLoginFailed value)? loginFailed,
  }) {
    return loginSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeMessageLoginSuccess value)? loginSuccess,
    TResult Function(PasscodeMessageLoginFailed value)? loginFailed,
    required TResult orElse(),
  }) {
    if (loginSuccess != null) {
      return loginSuccess(this);
    }
    return orElse();
  }
}

abstract class PasscodeMessageLoginSuccess extends PasscodeResponseMessage {
  const factory PasscodeMessageLoginSuccess() = _$PasscodeMessageLoginSuccess;
  const PasscodeMessageLoginSuccess._() : super._();
}

/// @nodoc
abstract class $PasscodeMessageLoginFailedCopyWith<$Res> {
  factory $PasscodeMessageLoginFailedCopyWith(PasscodeMessageLoginFailed value,
          $Res Function(PasscodeMessageLoginFailed) then) =
      _$PasscodeMessageLoginFailedCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasscodeMessageLoginFailedCopyWithImpl<$Res>
    extends _$PasscodeResponseMessageCopyWithImpl<$Res>
    implements $PasscodeMessageLoginFailedCopyWith<$Res> {
  _$PasscodeMessageLoginFailedCopyWithImpl(PasscodeMessageLoginFailed _value,
      $Res Function(PasscodeMessageLoginFailed) _then)
      : super(_value, (v) => _then(v as PasscodeMessageLoginFailed));

  @override
  PasscodeMessageLoginFailed get _value =>
      super._value as PasscodeMessageLoginFailed;
}

/// @nodoc

class _$PasscodeMessageLoginFailed extends PasscodeMessageLoginFailed {
  const _$PasscodeMessageLoginFailed() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PasscodeMessageLoginFailed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loginSuccess,
    required TResult Function() loginFailed,
  }) {
    return loginFailed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function()? loginFailed,
  }) {
    return loginFailed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loginSuccess,
    TResult Function()? loginFailed,
    required TResult orElse(),
  }) {
    if (loginFailed != null) {
      return loginFailed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PasscodeMessageLoginSuccess value) loginSuccess,
    required TResult Function(PasscodeMessageLoginFailed value) loginFailed,
  }) {
    return loginFailed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PasscodeMessageLoginSuccess value)? loginSuccess,
    TResult Function(PasscodeMessageLoginFailed value)? loginFailed,
  }) {
    return loginFailed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PasscodeMessageLoginSuccess value)? loginSuccess,
    TResult Function(PasscodeMessageLoginFailed value)? loginFailed,
    required TResult orElse(),
  }) {
    if (loginFailed != null) {
      return loginFailed(this);
    }
    return orElse();
  }
}

abstract class PasscodeMessageLoginFailed extends PasscodeResponseMessage {
  const factory PasscodeMessageLoginFailed() = _$PasscodeMessageLoginFailed;
  const PasscodeMessageLoginFailed._() : super._();
}
