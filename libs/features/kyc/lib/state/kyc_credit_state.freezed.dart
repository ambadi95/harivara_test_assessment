// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'kyc_credit_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$KycCreditState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(BuildContext context, String error,
            bool isKycError, bool isCreditCheckError, bool isLoading)
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isKycError,
            bool isCreditCheckError, bool isLoading)?
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isKycError,
            bool isCreditCheckError, bool isLoading)?
        ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(KycCreditStateReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(KycCreditStateReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(KycCreditStateReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KycCreditStateCopyWith<$Res> {
  factory $KycCreditStateCopyWith(
          KycCreditState value, $Res Function(KycCreditState) then) =
      _$KycCreditStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$KycCreditStateCopyWithImpl<$Res>
    implements $KycCreditStateCopyWith<$Res> {
  _$KycCreditStateCopyWithImpl(this._value, this._then);

  final KycCreditState _value;
  // ignore: unused_field
  final $Res Function(KycCreditState) _then;
}

/// @nodoc
abstract class _$$InitialStateCopyWith<$Res> {
  factory _$$InitialStateCopyWith(
          _$InitialState value, $Res Function(_$InitialState) then) =
      __$$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateCopyWithImpl<$Res>
    extends _$KycCreditStateCopyWithImpl<$Res>
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
    return 'KycCreditState.initialState()';
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
    required TResult Function(BuildContext context, String error,
            bool isKycError, bool isCreditCheckError, bool isLoading)
        ready,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isKycError,
            bool isCreditCheckError, bool isLoading)?
        ready,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isKycError,
            bool isCreditCheckError, bool isLoading)?
        ready,
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
    required TResult Function(KycCreditStateReady value) ready,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(KycCreditStateReady value)? ready,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(KycCreditStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class InitialState implements KycCreditState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class _$$KycCreditStateReadyCopyWith<$Res> {
  factory _$$KycCreditStateReadyCopyWith(_$KycCreditStateReady value,
          $Res Function(_$KycCreditStateReady) then) =
      __$$KycCreditStateReadyCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      String error,
      bool isKycError,
      bool isCreditCheckError,
      bool isLoading});
}

/// @nodoc
class __$$KycCreditStateReadyCopyWithImpl<$Res>
    extends _$KycCreditStateCopyWithImpl<$Res>
    implements _$$KycCreditStateReadyCopyWith<$Res> {
  __$$KycCreditStateReadyCopyWithImpl(
      _$KycCreditStateReady _value, $Res Function(_$KycCreditStateReady) _then)
      : super(_value, (v) => _then(v as _$KycCreditStateReady));

  @override
  _$KycCreditStateReady get _value => super._value as _$KycCreditStateReady;

  @override
  $Res call({
    Object? context = freezed,
    Object? error = freezed,
    Object? isKycError = freezed,
    Object? isCreditCheckError = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$KycCreditStateReady(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isKycError: isKycError == freezed
          ? _value.isKycError
          : isKycError // ignore: cast_nullable_to_non_nullable
              as bool,
      isCreditCheckError: isCreditCheckError == freezed
          ? _value.isCreditCheckError
          : isCreditCheckError // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$KycCreditStateReady implements KycCreditStateReady {
  const _$KycCreditStateReady(
      {required this.context,
      this.error = '',
      this.isKycError = false,
      this.isCreditCheckError = false,
      this.isLoading = false});

  @override
  final BuildContext context;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final bool isKycError;
  @override
  @JsonKey()
  final bool isCreditCheckError;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'KycCreditState.ready(context: $context, error: $error, isKycError: $isKycError, isCreditCheckError: $isCreditCheckError, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$KycCreditStateReady &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other.isKycError, isKycError) &&
            const DeepCollectionEquality()
                .equals(other.isCreditCheckError, isCreditCheckError) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(isKycError),
      const DeepCollectionEquality().hash(isCreditCheckError),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$KycCreditStateReadyCopyWith<_$KycCreditStateReady> get copyWith =>
      __$$KycCreditStateReadyCopyWithImpl<_$KycCreditStateReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(BuildContext context, String error,
            bool isKycError, bool isCreditCheckError, bool isLoading)
        ready,
  }) {
    return ready(context, error, isKycError, isCreditCheckError, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isKycError,
            bool isCreditCheckError, bool isLoading)?
        ready,
  }) {
    return ready?.call(
        context, error, isKycError, isCreditCheckError, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isKycError,
            bool isCreditCheckError, bool isLoading)?
        ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(context, error, isKycError, isCreditCheckError, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(KycCreditStateReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(KycCreditStateReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(KycCreditStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class KycCreditStateReady implements KycCreditState {
  const factory KycCreditStateReady(
      {required final BuildContext context,
      final String error,
      final bool isKycError,
      final bool isCreditCheckError,
      final bool isLoading}) = _$KycCreditStateReady;

  BuildContext get context;
  String get error;
  bool get isKycError;
  bool get isCreditCheckError;
  bool get isLoading;
  @JsonKey(ignore: true)
  _$$KycCreditStateReadyCopyWith<_$KycCreditStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}
