// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String passCodeError) passCodeError,
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function() successState,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(PassCodeError value) passCodeError,
    required TResult Function(LoadingState value) loading,
    required TResult Function(InitialState value) initialState,
    required TResult Function(SuccessState value) successState,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  final LoginState _value;
  // ignore: unused_field
  final $Res Function(LoginState) _then;
}

/// @nodoc
abstract class _$$MobileNumberErrorCopyWith<$Res> {
  factory _$$MobileNumberErrorCopyWith(
          _$MobileNumberError value, $Res Function(_$MobileNumberError) then) =
      __$$MobileNumberErrorCopyWithImpl<$Res>;
  $Res call({String mobileNumberError});
}

/// @nodoc
class __$$MobileNumberErrorCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements _$$MobileNumberErrorCopyWith<$Res> {
  __$$MobileNumberErrorCopyWithImpl(
      _$MobileNumberError _value, $Res Function(_$MobileNumberError) _then)
      : super(_value, (v) => _then(v as _$MobileNumberError));

  @override
  _$MobileNumberError get _value => super._value as _$MobileNumberError;

  @override
  $Res call({
    Object? mobileNumberError = freezed,
  }) {
    return _then(_$MobileNumberError(
      mobileNumberError == freezed
          ? _value.mobileNumberError
          : mobileNumberError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MobileNumberError implements MobileNumberError {
  const _$MobileNumberError(this.mobileNumberError);

  @override
  final String mobileNumberError;

  @override
  String toString() {
    return 'LoginState.mobileNumberError(mobileNumberError: $mobileNumberError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobileNumberError &&
            const DeepCollectionEquality()
                .equals(other.mobileNumberError, mobileNumberError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(mobileNumberError));

  @JsonKey(ignore: true)
  @override
  _$$MobileNumberErrorCopyWith<_$MobileNumberError> get copyWith =>
      __$$MobileNumberErrorCopyWithImpl<_$MobileNumberError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String passCodeError) passCodeError,
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function() successState,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) {
    return mobileNumberError(this.mobileNumberError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) {
    return mobileNumberError?.call(this.mobileNumberError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
    required TResult orElse(),
  }) {
    if (mobileNumberError != null) {
      return mobileNumberError(this.mobileNumberError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(PassCodeError value) passCodeError,
    required TResult Function(LoadingState value) loading,
    required TResult Function(InitialState value) initialState,
    required TResult Function(SuccessState value) successState,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) {
    return mobileNumberError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) {
    return mobileNumberError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
    required TResult orElse(),
  }) {
    if (mobileNumberError != null) {
      return mobileNumberError(this);
    }
    return orElse();
  }
}

abstract class MobileNumberError implements LoginState {
  const factory MobileNumberError(final String mobileNumberError) =
      _$MobileNumberError;

  String get mobileNumberError;
  @JsonKey(ignore: true)
  _$$MobileNumberErrorCopyWith<_$MobileNumberError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PassCodeErrorCopyWith<$Res> {
  factory _$$PassCodeErrorCopyWith(
          _$PassCodeError value, $Res Function(_$PassCodeError) then) =
      __$$PassCodeErrorCopyWithImpl<$Res>;
  $Res call({String passCodeError});
}

/// @nodoc
class __$$PassCodeErrorCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$PassCodeErrorCopyWith<$Res> {
  __$$PassCodeErrorCopyWithImpl(
      _$PassCodeError _value, $Res Function(_$PassCodeError) _then)
      : super(_value, (v) => _then(v as _$PassCodeError));

  @override
  _$PassCodeError get _value => super._value as _$PassCodeError;

  @override
  $Res call({
    Object? passCodeError = freezed,
  }) {
    return _then(_$PassCodeError(
      passCodeError == freezed
          ? _value.passCodeError
          : passCodeError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PassCodeError implements PassCodeError {
  const _$PassCodeError(this.passCodeError);

  @override
  final String passCodeError;

  @override
  String toString() {
    return 'LoginState.passCodeError(passCodeError: $passCodeError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PassCodeError &&
            const DeepCollectionEquality()
                .equals(other.passCodeError, passCodeError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(passCodeError));

  @JsonKey(ignore: true)
  @override
  _$$PassCodeErrorCopyWith<_$PassCodeError> get copyWith =>
      __$$PassCodeErrorCopyWithImpl<_$PassCodeError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String passCodeError) passCodeError,
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function() successState,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) {
    return passCodeError(this.passCodeError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) {
    return passCodeError?.call(this.passCodeError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
    required TResult orElse(),
  }) {
    if (passCodeError != null) {
      return passCodeError(this.passCodeError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(PassCodeError value) passCodeError,
    required TResult Function(LoadingState value) loading,
    required TResult Function(InitialState value) initialState,
    required TResult Function(SuccessState value) successState,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) {
    return passCodeError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) {
    return passCodeError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
    required TResult orElse(),
  }) {
    if (passCodeError != null) {
      return passCodeError(this);
    }
    return orElse();
  }
}

abstract class PassCodeError implements LoginState {
  const factory PassCodeError(final String passCodeError) = _$PassCodeError;

  String get passCodeError;
  @JsonKey(ignore: true)
  _$$PassCodeErrorCopyWith<_$PassCodeError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingStateCopyWith<$Res> {
  factory _$$LoadingStateCopyWith(
          _$LoadingState value, $Res Function(_$LoadingState) then) =
      __$$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$LoadingStateCopyWith<$Res> {
  __$$LoadingStateCopyWithImpl(
      _$LoadingState _value, $Res Function(_$LoadingState) _then)
      : super(_value, (v) => _then(v as _$LoadingState));

  @override
  _$LoadingState get _value => super._value as _$LoadingState;
}

/// @nodoc

class _$LoadingState implements LoadingState {
  const _$LoadingState();

  @override
  String toString() {
    return 'LoginState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String passCodeError) passCodeError,
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function() successState,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(PassCodeError value) passCodeError,
    required TResult Function(LoadingState value) loading,
    required TResult Function(InitialState value) initialState,
    required TResult Function(SuccessState value) successState,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements LoginState {
  const factory LoadingState() = _$LoadingState;
}

/// @nodoc
abstract class _$$InitialStateCopyWith<$Res> {
  factory _$$InitialStateCopyWith(
          _$InitialState value, $Res Function(_$InitialState) then) =
      __$$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$InitialStateCopyWith<$Res> {
  __$$InitialStateCopyWithImpl(
      _$InitialState _value, $Res Function(_$InitialState) _then)
      : super(_value, (v) => _then(v as _$InitialState));

  @override
  _$InitialState get _value => super._value as _$InitialState;
}

/// @nodoc

class _$InitialState implements InitialState {
  const _$InitialState();

  @override
  String toString() {
    return 'LoginState.initialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String passCodeError) passCodeError,
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function() successState,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(PassCodeError value) passCodeError,
    required TResult Function(LoadingState value) loading,
    required TResult Function(InitialState value) initialState,
    required TResult Function(SuccessState value) successState,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class InitialState implements LoginState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class _$$SuccessStateCopyWith<$Res> {
  factory _$$SuccessStateCopyWith(
          _$SuccessState value, $Res Function(_$SuccessState) then) =
      __$$SuccessStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$SuccessStateCopyWith<$Res> {
  __$$SuccessStateCopyWithImpl(
      _$SuccessState _value, $Res Function(_$SuccessState) _then)
      : super(_value, (v) => _then(v as _$SuccessState));

  @override
  _$SuccessState get _value => super._value as _$SuccessState;
}

/// @nodoc

class _$SuccessState implements SuccessState {
  const _$SuccessState();

  @override
  String toString() {
    return 'LoginState.successState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String passCodeError) passCodeError,
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function() successState,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) {
    return successState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) {
    return successState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
    required TResult orElse(),
  }) {
    if (successState != null) {
      return successState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(PassCodeError value) passCodeError,
    required TResult Function(LoadingState value) loading,
    required TResult Function(InitialState value) initialState,
    required TResult Function(SuccessState value) successState,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) {
    return successState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) {
    return successState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
    required TResult orElse(),
  }) {
    if (successState != null) {
      return successState(this);
    }
    return orElse();
  }
}

abstract class SuccessState implements LoginState {
  const factory SuccessState() = _$SuccessState;
}

/// @nodoc
abstract class _$$AgentIdErrorCopyWith<$Res> {
  factory _$$AgentIdErrorCopyWith(
          _$AgentIdError value, $Res Function(_$AgentIdError) then) =
      __$$AgentIdErrorCopyWithImpl<$Res>;
  $Res call({String agentIdError});
}

/// @nodoc
class __$$AgentIdErrorCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$AgentIdErrorCopyWith<$Res> {
  __$$AgentIdErrorCopyWithImpl(
      _$AgentIdError _value, $Res Function(_$AgentIdError) _then)
      : super(_value, (v) => _then(v as _$AgentIdError));

  @override
  _$AgentIdError get _value => super._value as _$AgentIdError;

  @override
  $Res call({
    Object? agentIdError = freezed,
  }) {
    return _then(_$AgentIdError(
      agentIdError == freezed
          ? _value.agentIdError
          : agentIdError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AgentIdError implements AgentIdError {
  const _$AgentIdError(this.agentIdError);

  @override
  final String agentIdError;

  @override
  String toString() {
    return 'LoginState.agentIdError(agentIdError: $agentIdError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgentIdError &&
            const DeepCollectionEquality()
                .equals(other.agentIdError, agentIdError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(agentIdError));

  @JsonKey(ignore: true)
  @override
  _$$AgentIdErrorCopyWith<_$AgentIdError> get copyWith =>
      __$$AgentIdErrorCopyWithImpl<_$AgentIdError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String passCodeError) passCodeError,
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function() successState,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) {
    return agentIdError(this.agentIdError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) {
    return agentIdError?.call(this.agentIdError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
    required TResult orElse(),
  }) {
    if (agentIdError != null) {
      return agentIdError(this.agentIdError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(PassCodeError value) passCodeError,
    required TResult Function(LoadingState value) loading,
    required TResult Function(InitialState value) initialState,
    required TResult Function(SuccessState value) successState,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) {
    return agentIdError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) {
    return agentIdError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
    required TResult orElse(),
  }) {
    if (agentIdError != null) {
      return agentIdError(this);
    }
    return orElse();
  }
}

abstract class AgentIdError implements LoginState {
  const factory AgentIdError(final String agentIdError) = _$AgentIdError;

  String get agentIdError;
  @JsonKey(ignore: true)
  _$$AgentIdErrorCopyWith<_$AgentIdError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoginFormStateCopyWith<$Res> {
  factory _$$LoginFormStateCopyWith(
          _$LoginFormState value, $Res Function(_$LoginFormState) then) =
      __$$LoginFormStateCopyWithImpl<$Res>;
  $Res call({bool isValid});
}

/// @nodoc
class __$$LoginFormStateCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res>
    implements _$$LoginFormStateCopyWith<$Res> {
  __$$LoginFormStateCopyWithImpl(
      _$LoginFormState _value, $Res Function(_$LoginFormState) _then)
      : super(_value, (v) => _then(v as _$LoginFormState));

  @override
  _$LoginFormState get _value => super._value as _$LoginFormState;

  @override
  $Res call({
    Object? isValid = freezed,
  }) {
    return _then(_$LoginFormState(
      isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoginFormState implements LoginFormState {
  const _$LoginFormState(this.isValid);

  @override
  final bool isValid;

  @override
  String toString() {
    return 'LoginState.loginFormState(isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginFormState &&
            const DeepCollectionEquality().equals(other.isValid, isValid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isValid));

  @JsonKey(ignore: true)
  @override
  _$$LoginFormStateCopyWith<_$LoginFormState> get copyWith =>
      __$$LoginFormStateCopyWithImpl<_$LoginFormState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String passCodeError) passCodeError,
    required TResult Function() loading,
    required TResult Function() initialState,
    required TResult Function() successState,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) {
    return loginFormState(isValid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) {
    return loginFormState?.call(isValid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String passCodeError)? passCodeError,
    TResult Function()? loading,
    TResult Function()? initialState,
    TResult Function()? successState,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
    required TResult orElse(),
  }) {
    if (loginFormState != null) {
      return loginFormState(isValid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(PassCodeError value) passCodeError,
    required TResult Function(LoadingState value) loading,
    required TResult Function(InitialState value) initialState,
    required TResult Function(SuccessState value) successState,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) {
    return loginFormState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) {
    return loginFormState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(PassCodeError value)? passCodeError,
    TResult Function(LoadingState value)? loading,
    TResult Function(InitialState value)? initialState,
    TResult Function(SuccessState value)? successState,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
    required TResult orElse(),
  }) {
    if (loginFormState != null) {
      return loginFormState(this);
    }
    return orElse();
  }
}

abstract class LoginFormState implements LoginState {
  const factory LoginFormState(final bool isValid) = _$LoginFormState;

  bool get isValid;
  @JsonKey(ignore: true)
  _$$LoginFormStateCopyWith<_$LoginFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
