// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scanqrcode_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ScanQRCodeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context, String error, bool isLoading)
        ready,
    required TResult Function(bool isValid) DetailsFormState,
    required TResult Function(String nameError) imei1Error,
    required TResult Function(String nameError) imei2Error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(ScanQRCodeStateReady value) ready,
    required TResult Function(DetailsFormState value) DetailsFormState,
    required TResult Function(imei1Error value) imei1Error,
    required TResult Function(imei2Error value) imei2Error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanQRCodeStateCopyWith<$Res> {
  factory $ScanQRCodeStateCopyWith(
          ScanQRCodeState value, $Res Function(ScanQRCodeState) then) =
      _$ScanQRCodeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScanQRCodeStateCopyWithImpl<$Res>
    implements $ScanQRCodeStateCopyWith<$Res> {
  _$ScanQRCodeStateCopyWithImpl(this._value, this._then);

  final ScanQRCodeState _value;
  // ignore: unused_field
  final $Res Function(ScanQRCodeState) _then;
}

/// @nodoc
abstract class _$$InitialStateCopyWith<$Res> {
  factory _$$InitialStateCopyWith(
          _$InitialState value, $Res Function(_$InitialState) then) =
      __$$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateCopyWithImpl<$Res>
    extends _$ScanQRCodeStateCopyWithImpl<$Res>
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
    return 'ScanQRCodeState.initialState()';
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
    required TResult Function(
            BuildContext context, String error, bool isLoading)
        ready,
    required TResult Function(bool isValid) DetailsFormState,
    required TResult Function(String nameError) imei1Error,
    required TResult Function(String nameError) imei2Error,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
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
    required TResult Function(ScanQRCodeStateReady value) ready,
    required TResult Function(DetailsFormState value) DetailsFormState,
    required TResult Function(imei1Error value) imei1Error,
    required TResult Function(imei2Error value) imei2Error,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class InitialState implements ScanQRCodeState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class _$$ScanQRCodeStateReadyCopyWith<$Res> {
  factory _$$ScanQRCodeStateReadyCopyWith(_$ScanQRCodeStateReady value,
          $Res Function(_$ScanQRCodeStateReady) then) =
      __$$ScanQRCodeStateReadyCopyWithImpl<$Res>;
  $Res call({BuildContext context, String error, bool isLoading});
}

/// @nodoc
class __$$ScanQRCodeStateReadyCopyWithImpl<$Res>
    extends _$ScanQRCodeStateCopyWithImpl<$Res>
    implements _$$ScanQRCodeStateReadyCopyWith<$Res> {
  __$$ScanQRCodeStateReadyCopyWithImpl(_$ScanQRCodeStateReady _value,
      $Res Function(_$ScanQRCodeStateReady) _then)
      : super(_value, (v) => _then(v as _$ScanQRCodeStateReady));

  @override
  _$ScanQRCodeStateReady get _value => super._value as _$ScanQRCodeStateReady;

  @override
  $Res call({
    Object? context = freezed,
    Object? error = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$ScanQRCodeStateReady(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ScanQRCodeStateReady implements ScanQRCodeStateReady {
  const _$ScanQRCodeStateReady(
      {required this.context, this.error = '', this.isLoading = false});

  @override
  final BuildContext context;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'ScanQRCodeState.ready(context: $context, error: $error, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScanQRCodeStateReady &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$ScanQRCodeStateReadyCopyWith<_$ScanQRCodeStateReady> get copyWith =>
      __$$ScanQRCodeStateReadyCopyWithImpl<_$ScanQRCodeStateReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context, String error, bool isLoading)
        ready,
    required TResult Function(bool isValid) DetailsFormState,
    required TResult Function(String nameError) imei1Error,
    required TResult Function(String nameError) imei2Error,
  }) {
    return ready(context, error, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
  }) {
    return ready?.call(context, error, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(context, error, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(ScanQRCodeStateReady value) ready,
    required TResult Function(DetailsFormState value) DetailsFormState,
    required TResult Function(imei1Error value) imei1Error,
    required TResult Function(imei2Error value) imei2Error,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class ScanQRCodeStateReady implements ScanQRCodeState {
  const factory ScanQRCodeStateReady(
      {required final BuildContext context,
      final String error,
      final bool isLoading}) = _$ScanQRCodeStateReady;

  BuildContext get context;
  String get error;
  bool get isLoading;
  @JsonKey(ignore: true)
  _$$ScanQRCodeStateReadyCopyWith<_$ScanQRCodeStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailsFormStateCopyWith<$Res> {
  factory _$$DetailsFormStateCopyWith(
          _$DetailsFormState value, $Res Function(_$DetailsFormState) then) =
      __$$DetailsFormStateCopyWithImpl<$Res>;
  $Res call({bool isValid});
}

/// @nodoc
class __$$DetailsFormStateCopyWithImpl<$Res>
    extends _$ScanQRCodeStateCopyWithImpl<$Res>
    implements _$$DetailsFormStateCopyWith<$Res> {
  __$$DetailsFormStateCopyWithImpl(
      _$DetailsFormState _value, $Res Function(_$DetailsFormState) _then)
      : super(_value, (v) => _then(v as _$DetailsFormState));

  @override
  _$DetailsFormState get _value => super._value as _$DetailsFormState;

  @override
  $Res call({
    Object? isValid = freezed,
  }) {
    return _then(_$DetailsFormState(
      isValid == freezed
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DetailsFormState implements DetailsFormState {
  const _$DetailsFormState(this.isValid);

  @override
  final bool isValid;

  @override
  String toString() {
    return 'ScanQRCodeState.DetailsFormState(isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailsFormState &&
            const DeepCollectionEquality().equals(other.isValid, isValid));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(isValid));

  @JsonKey(ignore: true)
  @override
  _$$DetailsFormStateCopyWith<_$DetailsFormState> get copyWith =>
      __$$DetailsFormStateCopyWithImpl<_$DetailsFormState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context, String error, bool isLoading)
        ready,
    required TResult Function(bool isValid) DetailsFormState,
    required TResult Function(String nameError) imei1Error,
    required TResult Function(String nameError) imei2Error,
  }) {
    return DetailsFormState(isValid);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
  }) {
    return DetailsFormState?.call(isValid);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
    required TResult orElse(),
  }) {
    if (DetailsFormState != null) {
      return DetailsFormState(isValid);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(ScanQRCodeStateReady value) ready,
    required TResult Function(DetailsFormState value) DetailsFormState,
    required TResult Function(imei1Error value) imei1Error,
    required TResult Function(imei2Error value) imei2Error,
  }) {
    return DetailsFormState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
  }) {
    return DetailsFormState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
    required TResult orElse(),
  }) {
    if (DetailsFormState != null) {
      return DetailsFormState(this);
    }
    return orElse();
  }
}

abstract class DetailsFormState implements ScanQRCodeState {
  const factory DetailsFormState(final bool isValid) = _$DetailsFormState;

  bool get isValid;
  @JsonKey(ignore: true)
  _$$DetailsFormStateCopyWith<_$DetailsFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$imei1ErrorCopyWith<$Res> {
  factory _$$imei1ErrorCopyWith(
          _$imei1Error value, $Res Function(_$imei1Error) then) =
      __$$imei1ErrorCopyWithImpl<$Res>;
  $Res call({String nameError});
}

/// @nodoc
class __$$imei1ErrorCopyWithImpl<$Res>
    extends _$ScanQRCodeStateCopyWithImpl<$Res>
    implements _$$imei1ErrorCopyWith<$Res> {
  __$$imei1ErrorCopyWithImpl(
      _$imei1Error _value, $Res Function(_$imei1Error) _then)
      : super(_value, (v) => _then(v as _$imei1Error));

  @override
  _$imei1Error get _value => super._value as _$imei1Error;

  @override
  $Res call({
    Object? nameError = freezed,
  }) {
    return _then(_$imei1Error(
      nameError == freezed
          ? _value.nameError
          : nameError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$imei1Error implements imei1Error {
  const _$imei1Error(this.nameError);

  @override
  final String nameError;

  @override
  String toString() {
    return 'ScanQRCodeState.imei1Error(nameError: $nameError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$imei1Error &&
            const DeepCollectionEquality().equals(other.nameError, nameError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(nameError));

  @JsonKey(ignore: true)
  @override
  _$$imei1ErrorCopyWith<_$imei1Error> get copyWith =>
      __$$imei1ErrorCopyWithImpl<_$imei1Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context, String error, bool isLoading)
        ready,
    required TResult Function(bool isValid) DetailsFormState,
    required TResult Function(String nameError) imei1Error,
    required TResult Function(String nameError) imei2Error,
  }) {
    return imei1Error(nameError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
  }) {
    return imei1Error?.call(nameError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
    required TResult orElse(),
  }) {
    if (imei1Error != null) {
      return imei1Error(nameError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(ScanQRCodeStateReady value) ready,
    required TResult Function(DetailsFormState value) DetailsFormState,
    required TResult Function(imei1Error value) imei1Error,
    required TResult Function(imei2Error value) imei2Error,
  }) {
    return imei1Error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
  }) {
    return imei1Error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
    required TResult orElse(),
  }) {
    if (imei1Error != null) {
      return imei1Error(this);
    }
    return orElse();
  }
}

abstract class imei1Error implements ScanQRCodeState {
  const factory imei1Error(final String nameError) = _$imei1Error;

  String get nameError;
  @JsonKey(ignore: true)
  _$$imei1ErrorCopyWith<_$imei1Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$imei2ErrorCopyWith<$Res> {
  factory _$$imei2ErrorCopyWith(
          _$imei2Error value, $Res Function(_$imei2Error) then) =
      __$$imei2ErrorCopyWithImpl<$Res>;
  $Res call({String nameError});
}

/// @nodoc
class __$$imei2ErrorCopyWithImpl<$Res>
    extends _$ScanQRCodeStateCopyWithImpl<$Res>
    implements _$$imei2ErrorCopyWith<$Res> {
  __$$imei2ErrorCopyWithImpl(
      _$imei2Error _value, $Res Function(_$imei2Error) _then)
      : super(_value, (v) => _then(v as _$imei2Error));

  @override
  _$imei2Error get _value => super._value as _$imei2Error;

  @override
  $Res call({
    Object? nameError = freezed,
  }) {
    return _then(_$imei2Error(
      nameError == freezed
          ? _value.nameError
          : nameError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$imei2Error implements imei2Error {
  const _$imei2Error(this.nameError);

  @override
  final String nameError;

  @override
  String toString() {
    return 'ScanQRCodeState.imei2Error(nameError: $nameError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$imei2Error &&
            const DeepCollectionEquality().equals(other.nameError, nameError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(nameError));

  @JsonKey(ignore: true)
  @override
  _$$imei2ErrorCopyWith<_$imei2Error> get copyWith =>
      __$$imei2ErrorCopyWithImpl<_$imei2Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context, String error, bool isLoading)
        ready,
    required TResult Function(bool isValid) DetailsFormState,
    required TResult Function(String nameError) imei1Error,
    required TResult Function(String nameError) imei2Error,
  }) {
    return imei2Error(nameError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
  }) {
    return imei2Error?.call(nameError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading)? ready,
    TResult Function(bool isValid)? DetailsFormState,
    TResult Function(String nameError)? imei1Error,
    TResult Function(String nameError)? imei2Error,
    required TResult orElse(),
  }) {
    if (imei2Error != null) {
      return imei2Error(nameError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(ScanQRCodeStateReady value) ready,
    required TResult Function(DetailsFormState value) DetailsFormState,
    required TResult Function(imei1Error value) imei1Error,
    required TResult Function(imei2Error value) imei2Error,
  }) {
    return imei2Error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
  }) {
    return imei2Error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(ScanQRCodeStateReady value)? ready,
    TResult Function(DetailsFormState value)? DetailsFormState,
    TResult Function(imei1Error value)? imei1Error,
    TResult Function(imei2Error value)? imei2Error,
    required TResult orElse(),
  }) {
    if (imei2Error != null) {
      return imei2Error(this);
    }
    return orElse();
  }
}

abstract class imei2Error implements ScanQRCodeState {
  const factory imei2Error(final String nameError) = _$imei2Error;

  String get nameError;
  @JsonKey(ignore: true)
  _$$imei2ErrorCopyWith<_$imei2Error> get copyWith =>
      throw _privateConstructorUsedError;
}
