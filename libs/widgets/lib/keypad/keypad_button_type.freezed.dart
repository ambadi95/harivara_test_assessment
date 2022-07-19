// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'keypad_button_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$KeypadDigitCopyWith<$Res> {
  factory _$$KeypadDigitCopyWith(
          _$KeypadDigit value, $Res Function(_$KeypadDigit) then) =
      __$$KeypadDigitCopyWithImpl<$Res>;
  $Res call({int number});
}

/// @nodoc
class __$$KeypadDigitCopyWithImpl<$Res>
    extends _$KeypadButtonTypeCopyWithImpl<$Res>
    implements _$$KeypadDigitCopyWith<$Res> {
  __$$KeypadDigitCopyWithImpl(
      _$KeypadDigit _value, $Res Function(_$KeypadDigit) _then)
      : super(_value, (v) => _then(v as _$KeypadDigit));

  @override
  _$KeypadDigit get _value => super._value as _$KeypadDigit;

  @override
  $Res call({
    Object? number = freezed,
  }) {
    return _then(_$KeypadDigit(
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
        (other.runtimeType == runtimeType &&
            other is _$KeypadDigit &&
            const DeepCollectionEquality().equals(other.number, number));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(number));

  @JsonKey(ignore: true)
  @override
  _$$KeypadDigitCopyWith<_$KeypadDigit> get copyWith =>
      __$$KeypadDigitCopyWithImpl<_$KeypadDigit>(this, _$identity);

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
  const factory KeypadDigit(final int number) = _$KeypadDigit;
  const KeypadDigit._() : super._();

  int get number;
  @JsonKey(ignore: true)
  _$$KeypadDigitCopyWith<_$KeypadDigit> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$KeypadBackSpaceCopyWith<$Res> {
  factory _$$KeypadBackSpaceCopyWith(
          _$KeypadBackSpace value, $Res Function(_$KeypadBackSpace) then) =
      __$$KeypadBackSpaceCopyWithImpl<$Res>;
}

/// @nodoc
class __$$KeypadBackSpaceCopyWithImpl<$Res>
    extends _$KeypadButtonTypeCopyWithImpl<$Res>
    implements _$$KeypadBackSpaceCopyWith<$Res> {
  __$$KeypadBackSpaceCopyWithImpl(
      _$KeypadBackSpace _value, $Res Function(_$KeypadBackSpace) _then)
      : super(_value, (v) => _then(v as _$KeypadBackSpace));

  @override
  _$KeypadBackSpace get _value => super._value as _$KeypadBackSpace;
}

/// @nodoc

class _$KeypadBackSpace extends KeypadBackSpace {
  const _$KeypadBackSpace() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$KeypadBackSpace);
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
abstract class _$$KeypadDecimalPointCopyWith<$Res> {
  factory _$$KeypadDecimalPointCopyWith(_$KeypadDecimalPoint value,
          $Res Function(_$KeypadDecimalPoint) then) =
      __$$KeypadDecimalPointCopyWithImpl<$Res>;
}

/// @nodoc
class __$$KeypadDecimalPointCopyWithImpl<$Res>
    extends _$KeypadButtonTypeCopyWithImpl<$Res>
    implements _$$KeypadDecimalPointCopyWith<$Res> {
  __$$KeypadDecimalPointCopyWithImpl(
      _$KeypadDecimalPoint _value, $Res Function(_$KeypadDecimalPoint) _then)
      : super(_value, (v) => _then(v as _$KeypadDecimalPoint));

  @override
  _$KeypadDecimalPoint get _value => super._value as _$KeypadDecimalPoint;
}

/// @nodoc

class _$KeypadDecimalPoint extends KeypadDecimalPoint {
  const _$KeypadDecimalPoint() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$KeypadDecimalPoint);
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
abstract class _$$KeypadNoneCopyWith<$Res> {
  factory _$$KeypadNoneCopyWith(
          _$KeypadNone value, $Res Function(_$KeypadNone) then) =
      __$$KeypadNoneCopyWithImpl<$Res>;
}

/// @nodoc
class __$$KeypadNoneCopyWithImpl<$Res>
    extends _$KeypadButtonTypeCopyWithImpl<$Res>
    implements _$$KeypadNoneCopyWith<$Res> {
  __$$KeypadNoneCopyWithImpl(
      _$KeypadNone _value, $Res Function(_$KeypadNone) _then)
      : super(_value, (v) => _then(v as _$KeypadNone));

  @override
  _$KeypadNone get _value => super._value as _$KeypadNone;
}

/// @nodoc

class _$KeypadNone extends KeypadNone {
  const _$KeypadNone() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$KeypadNone);
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
