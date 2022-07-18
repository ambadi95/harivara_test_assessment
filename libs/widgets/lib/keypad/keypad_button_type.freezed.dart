// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'keypad_button_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$KeypadButtonTypeTearOff {
  const _$KeypadButtonTypeTearOff();

  KeypadDigit digit(int number) {
    return KeypadDigit(
      number,
    );
  }

  KeypadBackSpace backspace() {
    return const KeypadBackSpace();
  }

  KeypadDecimalPoint decimalPoint() {
    return const KeypadDecimalPoint();
  }

  KeypadNone none() {
    return const KeypadNone();
  }
}

/// @nodoc
const $KeypadButtonType = _$KeypadButtonTypeTearOff();

/// @nodoc
mixin _$KeypadButtonType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int number) digit,
    required TResult Function() backspace,
    required TResult Function() decimalPoint,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int number)? digit,
    TResult Function()? backspace,
    TResult Function()? decimalPoint,
    TResult Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int number)? digit,
    TResult Function()? backspace,
    TResult Function()? decimalPoint,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(KeypadDigit value) digit,
    required TResult Function(KeypadBackSpace value) backspace,
    required TResult Function(KeypadDecimalPoint value) decimalPoint,
    required TResult Function(KeypadNone value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(KeypadDigit value)? digit,
    TResult Function(KeypadBackSpace value)? backspace,
    TResult Function(KeypadDecimalPoint value)? decimalPoint,
    TResult Function(KeypadNone value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(KeypadDigit value)? digit,
    TResult Function(KeypadBackSpace value)? backspace,
    TResult Function(KeypadDecimalPoint value)? decimalPoint,
    TResult Function(KeypadNone value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeypadButtonTypeCopyWith<$Res> {
  factory $KeypadButtonTypeCopyWith(
          KeypadButtonType value, $Res Function(KeypadButtonType) then) =
      _$KeypadButtonTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$KeypadButtonTypeCopyWithImpl<$Res>
    implements $KeypadButtonTypeCopyWith<$Res> {
  _$KeypadButtonTypeCopyWithImpl(this._value, this._then);

  final KeypadButtonType _value;
  // ignore: unused_field
  final $Res Function(KeypadButtonType) _then;
}

/// @nodoc
abstract class $KeypadDigitCopyWith<$Res> {
  factory $KeypadDigitCopyWith(
          KeypadDigit value, $Res Function(KeypadDigit) then) =
      _$KeypadDigitCopyWithImpl<$Res>;
  $Res call({int number});
}

/// @nodoc
class _$KeypadDigitCopyWithImpl<$Res>
    extends _$KeypadButtonTypeCopyWithImpl<$Res>
    implements $KeypadDigitCopyWith<$Res> {
  _$KeypadDigitCopyWithImpl(
      KeypadDigit _value, $Res Function(KeypadDigit) _then)
      : super(_value, (v) => _then(v as KeypadDigit));

  @override
  KeypadDigit get _value => super._value as KeypadDigit;

  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(KeypadDigit(
      number == freezed
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$KeypadDigit extends KeypadDigit {
  const _$KeypadDigit(this.number) : super._();

  @override
  final int number;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is KeypadDigit &&
            (identical(other.number, number) ||
                const DeepCollectionEquality().equals(other.number, number)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(number);

  @JsonKey(ignore: true)
  @override
  $KeypadDigitCopyWith<KeypadDigit> get copyWith =>
      _$KeypadDigitCopyWithImpl<KeypadDigit>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int number) digit,
    required TResult Function() backspace,
    required TResult Function() decimalPoint,
    required TResult Function() none,
  }) {
    return digit(number);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int number)? digit,
    TResult Function()? backspace,
    TResult Function()? decimalPoint,
    TResult Function()? none,
  }) {
    return digit?.call(number);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int number)? digit,
    TResult Function()? backspace,
    TResult Function()? decimalPoint,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (digit != null) {
      return digit(number);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(KeypadDigit value) digit,
    required TResult Function(KeypadBackSpace value) backspace,
    required TResult Function(KeypadDecimalPoint value) decimalPoint,
    required TResult Function(KeypadNone value) none,
  }) {
    return digit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(KeypadDigit value)? digit,
    TResult Function(KeypadBackSpace value)? backspace,
    TResult Function(KeypadDecimalPoint value)? decimalPoint,
    TResult Function(KeypadNone value)? none,
  }) {
    return digit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(KeypadDigit value)? digit,
    TResult Function(KeypadBackSpace value)? backspace,
    TResult Function(KeypadDecimalPoint value)? decimalPoint,
    TResult Function(KeypadNone value)? none,
    required TResult orElse(),
  }) {
    if (digit != null) {
      return digit(this);
    }
    return orElse();
  }
}

abstract class KeypadDigit extends KeypadButtonType {
  const factory KeypadDigit(int number) = _$KeypadDigit;
  const KeypadDigit._() : super._();

  int get number => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $KeypadDigitCopyWith<KeypadDigit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $KeypadBackSpaceCopyWith<$Res> {
  factory $KeypadBackSpaceCopyWith(
          KeypadBackSpace value, $Res Function(KeypadBackSpace) then) =
      _$KeypadBackSpaceCopyWithImpl<$Res>;
}

/// @nodoc
class _$KeypadBackSpaceCopyWithImpl<$Res>
    extends _$KeypadButtonTypeCopyWithImpl<$Res>
    implements $KeypadBackSpaceCopyWith<$Res> {
  _$KeypadBackSpaceCopyWithImpl(
      KeypadBackSpace _value, $Res Function(KeypadBackSpace) _then)
      : super(_value, (v) => _then(v as KeypadBackSpace));

  @override
  KeypadBackSpace get _value => super._value as KeypadBackSpace;
}

/// @nodoc

class _$KeypadBackSpace extends KeypadBackSpace {
  const _$KeypadBackSpace() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is KeypadBackSpace);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int number) digit,
    required TResult Function() backspace,
    required TResult Function() decimalPoint,
    required TResult Function() none,
  }) {
    return backspace();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int number)? digit,
    TResult Function()? backspace,
    TResult Function()? decimalPoint,
    TResult Function()? none,
  }) {
    return backspace?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int number)? digit,
    TResult Function()? backspace,
    TResult Function()? decimalPoint,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (backspace != null) {
      return backspace();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(KeypadDigit value) digit,
    required TResult Function(KeypadBackSpace value) backspace,
    required TResult Function(KeypadDecimalPoint value) decimalPoint,
    required TResult Function(KeypadNone value) none,
  }) {
    return backspace(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(KeypadDigit value)? digit,
    TResult Function(KeypadBackSpace value)? backspace,
    TResult Function(KeypadDecimalPoint value)? decimalPoint,
    TResult Function(KeypadNone value)? none,
  }) {
    return backspace?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(KeypadDigit value)? digit,
    TResult Function(KeypadBackSpace value)? backspace,
    TResult Function(KeypadDecimalPoint value)? decimalPoint,
    TResult Function(KeypadNone value)? none,
    required TResult orElse(),
  }) {
    if (backspace != null) {
      return backspace(this);
    }
    return orElse();
  }
}

abstract class KeypadBackSpace extends KeypadButtonType {
  const factory KeypadBackSpace() = _$KeypadBackSpace;
  const KeypadBackSpace._() : super._();
}

/// @nodoc
abstract class $KeypadDecimalPointCopyWith<$Res> {
  factory $KeypadDecimalPointCopyWith(
          KeypadDecimalPoint value, $Res Function(KeypadDecimalPoint) then) =
      _$KeypadDecimalPointCopyWithImpl<$Res>;
}

/// @nodoc
class _$KeypadDecimalPointCopyWithImpl<$Res>
    extends _$KeypadButtonTypeCopyWithImpl<$Res>
    implements $KeypadDecimalPointCopyWith<$Res> {
  _$KeypadDecimalPointCopyWithImpl(
      KeypadDecimalPoint _value, $Res Function(KeypadDecimalPoint) _then)
      : super(_value, (v) => _then(v as KeypadDecimalPoint));

  @override
  KeypadDecimalPoint get _value => super._value as KeypadDecimalPoint;
}

/// @nodoc

class _$KeypadDecimalPoint extends KeypadDecimalPoint {
  const _$KeypadDecimalPoint() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is KeypadDecimalPoint);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int number) digit,
    required TResult Function() backspace,
    required TResult Function() decimalPoint,
    required TResult Function() none,
  }) {
    return decimalPoint();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int number)? digit,
    TResult Function()? backspace,
    TResult Function()? decimalPoint,
    TResult Function()? none,
  }) {
    return decimalPoint?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int number)? digit,
    TResult Function()? backspace,
    TResult Function()? decimalPoint,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (decimalPoint != null) {
      return decimalPoint();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(KeypadDigit value) digit,
    required TResult Function(KeypadBackSpace value) backspace,
    required TResult Function(KeypadDecimalPoint value) decimalPoint,
    required TResult Function(KeypadNone value) none,
  }) {
    return decimalPoint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(KeypadDigit value)? digit,
    TResult Function(KeypadBackSpace value)? backspace,
    TResult Function(KeypadDecimalPoint value)? decimalPoint,
    TResult Function(KeypadNone value)? none,
  }) {
    return decimalPoint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(KeypadDigit value)? digit,
    TResult Function(KeypadBackSpace value)? backspace,
    TResult Function(KeypadDecimalPoint value)? decimalPoint,
    TResult Function(KeypadNone value)? none,
    required TResult orElse(),
  }) {
    if (decimalPoint != null) {
      return decimalPoint(this);
    }
    return orElse();
  }
}

abstract class KeypadDecimalPoint extends KeypadButtonType {
  const factory KeypadDecimalPoint() = _$KeypadDecimalPoint;
  const KeypadDecimalPoint._() : super._();
}

/// @nodoc
abstract class $KeypadNoneCopyWith<$Res> {
  factory $KeypadNoneCopyWith(
          KeypadNone value, $Res Function(KeypadNone) then) =
      _$KeypadNoneCopyWithImpl<$Res>;
}

/// @nodoc
class _$KeypadNoneCopyWithImpl<$Res>
    extends _$KeypadButtonTypeCopyWithImpl<$Res>
    implements $KeypadNoneCopyWith<$Res> {
  _$KeypadNoneCopyWithImpl(KeypadNone _value, $Res Function(KeypadNone) _then)
      : super(_value, (v) => _then(v as KeypadNone));

  @override
  KeypadNone get _value => super._value as KeypadNone;
}

/// @nodoc

class _$KeypadNone extends KeypadNone {
  const _$KeypadNone() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is KeypadNone);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int number) digit,
    required TResult Function() backspace,
    required TResult Function() decimalPoint,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(int number)? digit,
    TResult Function()? backspace,
    TResult Function()? decimalPoint,
    TResult Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int number)? digit,
    TResult Function()? backspace,
    TResult Function()? decimalPoint,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(KeypadDigit value) digit,
    required TResult Function(KeypadBackSpace value) backspace,
    required TResult Function(KeypadDecimalPoint value) decimalPoint,
    required TResult Function(KeypadNone value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(KeypadDigit value)? digit,
    TResult Function(KeypadBackSpace value)? backspace,
    TResult Function(KeypadDecimalPoint value)? decimalPoint,
    TResult Function(KeypadNone value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(KeypadDigit value)? digit,
    TResult Function(KeypadBackSpace value)? backspace,
    TResult Function(KeypadDecimalPoint value)? decimalPoint,
    TResult Function(KeypadNone value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class KeypadNone extends KeypadButtonType {
  const factory KeypadNone() = _$KeypadNone;
  const KeypadNone._() : super._();
}
