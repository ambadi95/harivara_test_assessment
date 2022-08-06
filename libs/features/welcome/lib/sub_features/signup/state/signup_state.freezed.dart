// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'signup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(bool isValid) SignUpFormState,
    required TResult Function(String nindaNumberError) nindaNumberError,
    required TResult Function(String nindaNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(SignUpFormState value) SignUpFormState,
    required TResult Function(NindaNumberError value) nindaNumberError,
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) then) =
      _$SignUpStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._value, this._then);

  final SignUpState _value;
  // ignore: unused_field
  final $Res Function(SignUpState) _then;
}

/// @nodoc
abstract class _$$InitialStateCopyWith<$Res> {
  factory _$$InitialStateCopyWith(
          _$InitialState value, $Res Function(_$InitialState) then) =
      __$$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
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
    return 'SignUpState.initialState()';
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
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(bool isValid) SignUpFormState,
    required TResult Function(String nindaNumberError) nindaNumberError,
    required TResult Function(String nindaNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
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
    required TResult Function(InitialState value) initialState,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(SignUpFormState value) SignUpFormState,
    required TResult Function(NindaNumberError value) nindaNumberError,
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class InitialState implements SignUpState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class _$$LoadingStateCopyWith<$Res> {
  factory _$$LoadingStateCopyWith(
          _$LoadingState value, $Res Function(_$LoadingState) then) =
      __$$LoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingStateCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
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
    return 'SignUpState.loadingState()';
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
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(bool isValid) SignUpFormState,
    required TResult Function(String nindaNumberError) nindaNumberError,
    required TResult Function(String nindaNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
  }) {
    return loadingState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
  }) {
    return loadingState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(SignUpFormState value) SignUpFormState,
    required TResult Function(NindaNumberError value) nindaNumberError,
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
  }) {
    return loadingState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
  }) {
    return loadingState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    required TResult orElse(),
  }) {
    if (loadingState != null) {
      return loadingState(this);
    }
    return orElse();
  }
}

abstract class LoadingState implements SignUpState {
  const factory LoadingState() = _$LoadingState;
}

/// @nodoc
abstract class _$$SignUpFormStateCopyWith<$Res> {
  factory _$$SignUpFormStateCopyWith(
          _$SignUpFormState value, $Res Function(_$SignUpFormState) then) =
      __$$SignUpFormStateCopyWithImpl<$Res>;
  $Res call({bool isValid});
}

/// @nodoc
class __$$SignUpFormStateCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res>
    implements _$$SignUpFormStateCopyWith<$Res> {
  __$$SignUpFormStateCopyWithImpl(
      _$SignUpFormState _value, $Res Function(_$SignUpFormState) _then)
      : super(_value, (v) => _then(v as _$SignUpFormState));

  @override
  _$SignUpFormState get _value => super._value as _$SignUpFormState;

  @override
  $Res call({
    Object? isValid = freezed,
  }) {
    return _then(_$SignUpFormState(
      isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SignUpFormState implements SignUpFormState {
  const _$SignUpFormState(this.isValid);

  @override
  final bool isValid;

  @override
  String toString() {
    return 'SignUpState.SignUpFormState(isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpFormState &&
            const DeepCollectionEquality().equals(other.isValid, isValid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isValid));

  @JsonKey(ignore: true)
  @override
  _$$SignUpFormStateCopyWith<_$SignUpFormState> get copyWith =>
      __$$SignUpFormStateCopyWithImpl<_$SignUpFormState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(bool isValid) SignUpFormState,
    required TResult Function(String nindaNumberError) nindaNumberError,
    required TResult Function(String nindaNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
  }) {
    return SignUpFormState(isValid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
  }) {
    return SignUpFormState?.call(isValid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    required TResult orElse(),
  }) {
    if (SignUpFormState != null) {
      return SignUpFormState(isValid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(SignUpFormState value) SignUpFormState,
    required TResult Function(NindaNumberError value) nindaNumberError,
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
  }) {
    return SignUpFormState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
  }) {
    return SignUpFormState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    required TResult orElse(),
  }) {
    if (SignUpFormState != null) {
      return SignUpFormState(this);
    }
    return orElse();
  }
}

abstract class SignUpFormState implements SignUpState {
  const factory SignUpFormState(final bool isValid) = _$SignUpFormState;

  bool get isValid;
  @JsonKey(ignore: true)
  _$$SignUpFormStateCopyWith<_$SignUpFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NindaNumberErrorCopyWith<$Res> {
  factory _$$NindaNumberErrorCopyWith(
          _$NindaNumberError value, $Res Function(_$NindaNumberError) then) =
      __$$NindaNumberErrorCopyWithImpl<$Res>;
  $Res call({String nindaNumberError});
}

/// @nodoc
class __$$NindaNumberErrorCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res>
    implements _$$NindaNumberErrorCopyWith<$Res> {
  __$$NindaNumberErrorCopyWithImpl(
      _$NindaNumberError _value, $Res Function(_$NindaNumberError) _then)
      : super(_value, (v) => _then(v as _$NindaNumberError));

  @override
  _$NindaNumberError get _value => super._value as _$NindaNumberError;

  @override
  $Res call({
    Object? nindaNumberError = freezed,
  }) {
    return _then(_$NindaNumberError(
      nindaNumberError == freezed
          ? _value.nindaNumberError
          : nindaNumberError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NindaNumberError implements NindaNumberError {
  const _$NindaNumberError(this.nindaNumberError);

  @override
  final String nindaNumberError;

  @override
  String toString() {
    return 'SignUpState.nindaNumberError(nindaNumberError: $nindaNumberError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NindaNumberError &&
            const DeepCollectionEquality()
                .equals(other.nindaNumberError, nindaNumberError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(nindaNumberError));

  @JsonKey(ignore: true)
  @override
  _$$NindaNumberErrorCopyWith<_$NindaNumberError> get copyWith =>
      __$$NindaNumberErrorCopyWithImpl<_$NindaNumberError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(bool isValid) SignUpFormState,
    required TResult Function(String nindaNumberError) nindaNumberError,
    required TResult Function(String nindaNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
  }) {
    return nindaNumberError(this.nindaNumberError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
  }) {
    return nindaNumberError?.call(this.nindaNumberError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    required TResult orElse(),
  }) {
    if (nindaNumberError != null) {
      return nindaNumberError(this.nindaNumberError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(SignUpFormState value) SignUpFormState,
    required TResult Function(NindaNumberError value) nindaNumberError,
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
  }) {
    return nindaNumberError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
  }) {
    return nindaNumberError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    required TResult orElse(),
  }) {
    if (nindaNumberError != null) {
      return nindaNumberError(this);
    }
    return orElse();
  }
}

abstract class NindaNumberError implements SignUpState {
  const factory NindaNumberError(final String nindaNumberError) =
      _$NindaNumberError;

  String get nindaNumberError;
  @JsonKey(ignore: true)
  _$$NindaNumberErrorCopyWith<_$NindaNumberError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MobileNumberErrorCopyWith<$Res> {
  factory _$$MobileNumberErrorCopyWith(
          _$MobileNumberError value, $Res Function(_$MobileNumberError) then) =
      __$$MobileNumberErrorCopyWithImpl<$Res>;
  $Res call({String nindaNumberError});
}

/// @nodoc
class __$$MobileNumberErrorCopyWithImpl<$Res>
    extends _$SignUpStateCopyWithImpl<$Res>
    implements _$$MobileNumberErrorCopyWith<$Res> {
  __$$MobileNumberErrorCopyWithImpl(
      _$MobileNumberError _value, $Res Function(_$MobileNumberError) _then)
      : super(_value, (v) => _then(v as _$MobileNumberError));

  @override
  _$MobileNumberError get _value => super._value as _$MobileNumberError;

  @override
  $Res call({
    Object? nindaNumberError = freezed,
  }) {
    return _then(_$MobileNumberError(
      nindaNumberError == freezed
          ? _value.nindaNumberError
          : nindaNumberError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$MobileNumberError implements MobileNumberError {
  const _$MobileNumberError(this.nindaNumberError);

  @override
  final String nindaNumberError;

  @override
  String toString() {
    return 'SignUpState.mobileNumberError(nindaNumberError: $nindaNumberError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MobileNumberError &&
            const DeepCollectionEquality()
                .equals(other.nindaNumberError, nindaNumberError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(nindaNumberError));

  @JsonKey(ignore: true)
  @override
  _$$MobileNumberErrorCopyWith<_$MobileNumberError> get copyWith =>
      __$$MobileNumberErrorCopyWithImpl<_$MobileNumberError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(bool isValid) SignUpFormState,
    required TResult Function(String nindaNumberError) nindaNumberError,
    required TResult Function(String nindaNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
  }) {
    return mobileNumberError(this.nindaNumberError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
  }) {
    return mobileNumberError?.call(this.nindaNumberError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
    required TResult orElse(),
  }) {
    if (mobileNumberError != null) {
      return mobileNumberError(this.nindaNumberError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(SignUpFormState value) SignUpFormState,
    required TResult Function(NindaNumberError value) nindaNumberError,
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
  }) {
    return mobileNumberError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
  }) {
    return mobileNumberError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    required TResult orElse(),
  }) {
    if (mobileNumberError != null) {
      return mobileNumberError(this);
    }
    return orElse();
  }
}

abstract class MobileNumberError implements SignUpState {
  const factory MobileNumberError(final String nindaNumberError) =
      _$MobileNumberError;

  String get nindaNumberError;
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
class __$$AgentIdErrorCopyWithImpl<$Res> extends _$SignUpStateCopyWithImpl<$Res>
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
    return 'SignUpState.agentIdError(agentIdError: $agentIdError)';
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
    required TResult Function() initialState,
    required TResult Function() loadingState,
    required TResult Function(bool isValid) SignUpFormState,
    required TResult Function(String nindaNumberError) nindaNumberError,
    required TResult Function(String nindaNumberError) mobileNumberError,
    required TResult Function(String agentIdError) agentIdError,
  }) {
    return agentIdError(this.agentIdError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
  }) {
    return agentIdError?.call(this.agentIdError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function()? loadingState,
    TResult Function(bool isValid)? SignUpFormState,
    TResult Function(String nindaNumberError)? nindaNumberError,
    TResult Function(String nindaNumberError)? mobileNumberError,
    TResult Function(String agentIdError)? agentIdError,
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
    required TResult Function(InitialState value) initialState,
    required TResult Function(LoadingState value) loadingState,
    required TResult Function(SignUpFormState value) SignUpFormState,
    required TResult Function(NindaNumberError value) nindaNumberError,
    required TResult Function(MobileNumberError value) mobileNumberError,
    required TResult Function(AgentIdError value) agentIdError,
  }) {
    return agentIdError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
  }) {
    return agentIdError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(LoadingState value)? loadingState,
    TResult Function(SignUpFormState value)? SignUpFormState,
    TResult Function(NindaNumberError value)? nindaNumberError,
    TResult Function(MobileNumberError value)? mobileNumberError,
    TResult Function(AgentIdError value)? agentIdError,
    required TResult orElse(),
  }) {
    if (agentIdError != null) {
      return agentIdError(this);
    }
    return orElse();
  }
}

abstract class AgentIdError implements SignUpState {
  const factory AgentIdError(final String agentIdError) = _$AgentIdError;

  String get agentIdError;
  @JsonKey(ignore: true)
  _$$AgentIdErrorCopyWith<_$AgentIdError> get copyWith =>
      throw _privateConstructorUsedError;
}
