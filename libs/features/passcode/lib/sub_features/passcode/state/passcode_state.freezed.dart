// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'passcode_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreatePasscodeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context,
            PassCodeVerificationType passCodeVerificationType,
            String pageTitle,
            String pageDescription,
            String initialPasscode,
            String currentPasscode,
            int passcodeLength,
            String destinationPath,
            String error,
            bool isLoading)
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            PassCodeVerificationType passCodeVerificationType,
            String pageTitle,
            String pageDescription,
            String initialPasscode,
            String currentPasscode,
            int passcodeLength,
            String destinationPath,
            String error,
            bool isLoading)?
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            PassCodeVerificationType passCodeVerificationType,
            String pageTitle,
            String pageDescription,
            String initialPasscode,
            String currentPasscode,
            int passcodeLength,
            String destinationPath,
            String error,
            bool isLoading)?
        ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(CreatePasscodeReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CreatePasscodeReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CreatePasscodeReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePasscodeStateCopyWith<$Res> {
  factory $CreatePasscodeStateCopyWith(
          CreatePasscodeState value, $Res Function(CreatePasscodeState) then) =
      _$CreatePasscodeStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CreatePasscodeStateCopyWithImpl<$Res>
    implements $CreatePasscodeStateCopyWith<$Res> {
  _$CreatePasscodeStateCopyWithImpl(this._value, this._then);

  final CreatePasscodeState _value;
  // ignore: unused_field
  final $Res Function(CreatePasscodeState) _then;
}

/// @nodoc
abstract class _$$InitialStateCopyWith<$Res> {
  factory _$$InitialStateCopyWith(
          _$InitialState value, $Res Function(_$InitialState) then) =
      __$$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateCopyWithImpl<$Res>
    extends _$CreatePasscodeStateCopyWithImpl<$Res>
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
    return 'CreatePasscodeState.initialState()';
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
            BuildContext context,
            PassCodeVerificationType passCodeVerificationType,
            String pageTitle,
            String pageDescription,
            String initialPasscode,
            String currentPasscode,
            int passcodeLength,
            String destinationPath,
            String error,
            bool isLoading)
        ready,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            PassCodeVerificationType passCodeVerificationType,
            String pageTitle,
            String pageDescription,
            String initialPasscode,
            String currentPasscode,
            int passcodeLength,
            String destinationPath,
            String error,
            bool isLoading)?
        ready,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            PassCodeVerificationType passCodeVerificationType,
            String pageTitle,
            String pageDescription,
            String initialPasscode,
            String currentPasscode,
            int passcodeLength,
            String destinationPath,
            String error,
            bool isLoading)?
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
    required TResult Function(CreatePasscodeReady value) ready,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CreatePasscodeReady value)? ready,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CreatePasscodeReady value)? ready,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class InitialState implements CreatePasscodeState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class _$$CreatePasscodeReadyCopyWith<$Res> {
  factory _$$CreatePasscodeReadyCopyWith(_$CreatePasscodeReady value,
          $Res Function(_$CreatePasscodeReady) then) =
      __$$CreatePasscodeReadyCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      PassCodeVerificationType passCodeVerificationType,
      String pageTitle,
      String pageDescription,
      String initialPasscode,
      String currentPasscode,
      int passcodeLength,
      String destinationPath,
      String error,
      bool isLoading});
}

/// @nodoc
class __$$CreatePasscodeReadyCopyWithImpl<$Res>
    extends _$CreatePasscodeStateCopyWithImpl<$Res>
    implements _$$CreatePasscodeReadyCopyWith<$Res> {
  __$$CreatePasscodeReadyCopyWithImpl(
      _$CreatePasscodeReady _value, $Res Function(_$CreatePasscodeReady) _then)
      : super(_value, (v) => _then(v as _$CreatePasscodeReady));

  @override
  _$CreatePasscodeReady get _value => super._value as _$CreatePasscodeReady;

  @override
  $Res call({
    Object? context = freezed,
    Object? passCodeVerificationType = freezed,
    Object? pageTitle = freezed,
    Object? pageDescription = freezed,
    Object? initialPasscode = freezed,
    Object? currentPasscode = freezed,
    Object? passcodeLength = freezed,
    Object? destinationPath = freezed,
    Object? error = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$CreatePasscodeReady(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      passCodeVerificationType: passCodeVerificationType == freezed
          ? _value.passCodeVerificationType
          : passCodeVerificationType // ignore: cast_nullable_to_non_nullable
              as PassCodeVerificationType,
      pageTitle: pageTitle == freezed
          ? _value.pageTitle
          : pageTitle // ignore: cast_nullable_to_non_nullable
              as String,
      pageDescription: pageDescription == freezed
          ? _value.pageDescription
          : pageDescription // ignore: cast_nullable_to_non_nullable
              as String,
      initialPasscode: initialPasscode == freezed
          ? _value.initialPasscode
          : initialPasscode // ignore: cast_nullable_to_non_nullable
              as String,
      currentPasscode: currentPasscode == freezed
          ? _value.currentPasscode
          : currentPasscode // ignore: cast_nullable_to_non_nullable
              as String,
      passcodeLength: passcodeLength == freezed
          ? _value.passcodeLength
          : passcodeLength // ignore: cast_nullable_to_non_nullable
              as int,
      destinationPath: destinationPath == freezed
          ? _value.destinationPath
          : destinationPath // ignore: cast_nullable_to_non_nullable
              as String,
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

class _$CreatePasscodeReady implements CreatePasscodeReady {
  const _$CreatePasscodeReady(
      {required this.context,
      required this.passCodeVerificationType,
      required this.pageTitle,
      required this.pageDescription,
      required this.initialPasscode,
      required this.currentPasscode,
      required this.passcodeLength,
      required this.destinationPath,
      this.error = '',
      this.isLoading = false});

  @override
  final BuildContext context;
  @override
  final PassCodeVerificationType passCodeVerificationType;
  @override
  final String pageTitle;
  @override
  final String pageDescription;
  @override
  final String initialPasscode;
  @override
  final String currentPasscode;
  @override
  final int passcodeLength;
  @override
  final String destinationPath;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CreatePasscodeState.ready(context: $context, passCodeVerificationType: $passCodeVerificationType, pageTitle: $pageTitle, pageDescription: $pageDescription, initialPasscode: $initialPasscode, currentPasscode: $currentPasscode, passcodeLength: $passcodeLength, destinationPath: $destinationPath, error: $error, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatePasscodeReady &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(
                other.passCodeVerificationType, passCodeVerificationType) &&
            const DeepCollectionEquality().equals(other.pageTitle, pageTitle) &&
            const DeepCollectionEquality()
                .equals(other.pageDescription, pageDescription) &&
            const DeepCollectionEquality()
                .equals(other.initialPasscode, initialPasscode) &&
            const DeepCollectionEquality()
                .equals(other.currentPasscode, currentPasscode) &&
            const DeepCollectionEquality()
                .equals(other.passcodeLength, passcodeLength) &&
            const DeepCollectionEquality()
                .equals(other.destinationPath, destinationPath) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(passCodeVerificationType),
      const DeepCollectionEquality().hash(pageTitle),
      const DeepCollectionEquality().hash(pageDescription),
      const DeepCollectionEquality().hash(initialPasscode),
      const DeepCollectionEquality().hash(currentPasscode),
      const DeepCollectionEquality().hash(passcodeLength),
      const DeepCollectionEquality().hash(destinationPath),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$CreatePasscodeReadyCopyWith<_$CreatePasscodeReady> get copyWith =>
      __$$CreatePasscodeReadyCopyWithImpl<_$CreatePasscodeReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context,
            PassCodeVerificationType passCodeVerificationType,
            String pageTitle,
            String pageDescription,
            String initialPasscode,
            String currentPasscode,
            int passcodeLength,
            String destinationPath,
            String error,
            bool isLoading)
        ready,
  }) {
    return ready(
        context,
        passCodeVerificationType,
        pageTitle,
        pageDescription,
        initialPasscode,
        currentPasscode,
        passcodeLength,
        destinationPath,
        error,
        isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            PassCodeVerificationType passCodeVerificationType,
            String pageTitle,
            String pageDescription,
            String initialPasscode,
            String currentPasscode,
            int passcodeLength,
            String destinationPath,
            String error,
            bool isLoading)?
        ready,
  }) {
    return ready?.call(
        context,
        passCodeVerificationType,
        pageTitle,
        pageDescription,
        initialPasscode,
        currentPasscode,
        passcodeLength,
        destinationPath,
        error,
        isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            PassCodeVerificationType passCodeVerificationType,
            String pageTitle,
            String pageDescription,
            String initialPasscode,
            String currentPasscode,
            int passcodeLength,
            String destinationPath,
            String error,
            bool isLoading)?
        ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(
          context,
          passCodeVerificationType,
          pageTitle,
          pageDescription,
          initialPasscode,
          currentPasscode,
          passcodeLength,
          destinationPath,
          error,
          isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(CreatePasscodeReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CreatePasscodeReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(CreatePasscodeReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class CreatePasscodeReady implements CreatePasscodeState {
  const factory CreatePasscodeReady(
      {required final BuildContext context,
      required final PassCodeVerificationType passCodeVerificationType,
      required final String pageTitle,
      required final String pageDescription,
      required final String initialPasscode,
      required final String currentPasscode,
      required final int passcodeLength,
      required final String destinationPath,
      final String error,
      final bool isLoading}) = _$CreatePasscodeReady;

  BuildContext get context;
  PassCodeVerificationType get passCodeVerificationType;
  String get pageTitle;
  String get pageDescription;
  String get initialPasscode;
  String get currentPasscode;
  int get passcodeLength;
  String get destinationPath;
  String get error;
  bool get isLoading;
  @JsonKey(ignore: true)
  _$$CreatePasscodeReadyCopyWith<_$CreatePasscodeReady> get copyWith =>
      throw _privateConstructorUsedError;
}
