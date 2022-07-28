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
  TResult when<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList) $default, {
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList)? $default, {
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList)? $default, {
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LoginState value) $default, {
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_LoginState value)? $default, {
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LoginState value)? $default, {
    TResult Function(MobileNumberError value)? mobileNumberError,
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
abstract class _$$_LoginStateCopyWith<$Res> {
  factory _$$_LoginStateCopyWith(
          _$_LoginState value, $Res Function(_$_LoginState) then) =
      __$$_LoginStateCopyWithImpl<$Res>;
  $Res call({List<LoginModel> loginList});
}

/// @nodoc
class __$$_LoginStateCopyWithImpl<$Res> extends _$LoginStateCopyWithImpl<$Res>
    implements _$$_LoginStateCopyWith<$Res> {
  __$$_LoginStateCopyWithImpl(
      _$_LoginState _value, $Res Function(_$_LoginState) _then)
      : super(_value, (v) => _then(v as _$_LoginState));

  @override
  _$_LoginState get _value => super._value as _$_LoginState;

  @override
  $Res call({
    Object? loginList = freezed,
  }) {
    return _then(_$_LoginState(
      loginList: loginList == freezed
          ? _value._loginList
          : loginList // ignore: cast_nullable_to_non_nullable
              as List<LoginModel>,
    ));
  }
}

/// @nodoc

class _$_LoginState implements _LoginState {
  const _$_LoginState({final List<LoginModel> loginList = const []})
      : _loginList = loginList;

  final List<LoginModel> _loginList;
  @override
  @JsonKey()
  List<LoginModel> get loginList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_loginList);
  }

  @override
  String toString() {
    return 'LoginState(loginList: $loginList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginState &&
            const DeepCollectionEquality()
                .equals(other._loginList, _loginList));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_loginList));

  @JsonKey(ignore: true)
  @override
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      __$$_LoginStateCopyWithImpl<_$_LoginState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList) $default, {
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) {
    return $default(loginList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList)? $default, {
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) {
    return $default?.call(loginList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList)? $default, {
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(loginList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LoginState value) $default, {
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_LoginState value)? $default, {
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LoginState value)? $default, {
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _LoginState implements LoginState {
  const factory _LoginState({final List<LoginModel> loginList}) = _$_LoginState;

  List<LoginModel> get loginList;
  @JsonKey(ignore: true)
  _$$_LoginStateCopyWith<_$_LoginState> get copyWith =>
      throw _privateConstructorUsedError;
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
  TResult when<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList) $default, {
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) {
    return mobileNumberError(this.mobileNumberError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList)? $default, {
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) {
    return mobileNumberError?.call(this.mobileNumberError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList)? $default, {
    TResult Function(String mobileNumberError)? mobileNumberError,
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
  TResult map<TResult extends Object?>(
    TResult Function(_LoginState value) $default, {
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) {
    return mobileNumberError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_LoginState value)? $default, {
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) {
    return mobileNumberError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LoginState value)? $default, {
    TResult Function(MobileNumberError value)? mobileNumberError,
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
  TResult when<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList) $default, {
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) {
    return agentIdError(this.agentIdError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList)? $default, {
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) {
    return agentIdError?.call(this.agentIdError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList)? $default, {
    TResult Function(String mobileNumberError)? mobileNumberError,
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
  TResult map<TResult extends Object?>(
    TResult Function(_LoginState value) $default, {
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) {
    return agentIdError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_LoginState value)? $default, {
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) {
    return agentIdError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LoginState value)? $default, {
    TResult Function(MobileNumberError value)? mobileNumberError,
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
  TResult when<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList) $default, {
    required TResult Function(String mobileNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
    required TResult Function(bool isValid) loginFormState,
  }) {
    return loginFormState(isValid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList)? $default, {
    TResult Function(String mobileNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    TResult Function(bool isValid)? loginFormState,
  }) {
    return loginFormState?.call(isValid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<LoginModel> loginList)? $default, {
    TResult Function(String mobileNumberError)? mobileNumberError,
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
  TResult map<TResult extends Object?>(
    TResult Function(_LoginState value) $default, {
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
    required TResult Function(LoginFormState value) loginFormState,
  }) {
    return loginFormState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_LoginState value)? $default, {
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    TResult Function(LoginFormState value)? loginFormState,
  }) {
    return loginFormState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LoginState value)? $default, {
    TResult Function(MobileNumberError value)? mobileNumberError,
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
