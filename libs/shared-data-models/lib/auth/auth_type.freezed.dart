// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'auth_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() faceId,
    required TResult Function() fingerPrint,
    required TResult Function() mpin,
    required TResult Function() pin,
    required TResult Function() tpin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceId value) faceId,
    required TResult Function(FingerPrint value) fingerPrint,
    required TResult Function(MPIN value) mpin,
    required TResult Function(PIN value) pin,
    required TResult Function(TPIN value) tpin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthTypeCopyWith<$Res> {
  factory $AuthTypeCopyWith(AuthType value, $Res Function(AuthType) then) =
      _$AuthTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthTypeCopyWithImpl<$Res> implements $AuthTypeCopyWith<$Res> {
  _$AuthTypeCopyWithImpl(this._value, this._then);

  final AuthType _value;
  // ignore: unused_field
  final $Res Function(AuthType) _then;
}

/// @nodoc
abstract class _$$FaceIdCopyWith<$Res> {
  factory _$$FaceIdCopyWith(_$FaceId value, $Res Function(_$FaceId) then) =
      __$$FaceIdCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FaceIdCopyWithImpl<$Res> extends _$AuthTypeCopyWithImpl<$Res>
    implements _$$FaceIdCopyWith<$Res> {
  __$$FaceIdCopyWithImpl(_$FaceId _value, $Res Function(_$FaceId) _then)
      : super(_value, (v) => _then(v as _$FaceId));

  @override
  _$FaceId get _value => super._value as _$FaceId;
}

/// @nodoc

class _$FaceId extends FaceId {
  const _$FaceId() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FaceId);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() faceId,
    required TResult Function() fingerPrint,
    required TResult Function() mpin,
    required TResult Function() pin,
    required TResult Function() tpin,
  }) {
    return faceId();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
  }) {
    return faceId?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
    required TResult orElse(),
  }) {
    if (faceId != null) {
      return faceId();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceId value) faceId,
    required TResult Function(FingerPrint value) fingerPrint,
    required TResult Function(MPIN value) mpin,
    required TResult Function(PIN value) pin,
    required TResult Function(TPIN value) tpin,
  }) {
    return faceId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
  }) {
    return faceId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
    required TResult orElse(),
  }) {
    if (faceId != null) {
      return faceId(this);
    }
    return orElse();
  }
}

abstract class FaceId extends AuthType {
  const factory FaceId() = _$FaceId;
  const FaceId._() : super._();
}

/// @nodoc
abstract class _$$FingerPrintCopyWith<$Res> {
  factory _$$FingerPrintCopyWith(
          _$FingerPrint value, $Res Function(_$FingerPrint) then) =
      __$$FingerPrintCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FingerPrintCopyWithImpl<$Res> extends _$AuthTypeCopyWithImpl<$Res>
    implements _$$FingerPrintCopyWith<$Res> {
  __$$FingerPrintCopyWithImpl(
      _$FingerPrint _value, $Res Function(_$FingerPrint) _then)
      : super(_value, (v) => _then(v as _$FingerPrint));

  @override
  _$FingerPrint get _value => super._value as _$FingerPrint;
}

/// @nodoc

class _$FingerPrint extends FingerPrint {
  const _$FingerPrint() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FingerPrint);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() faceId,
    required TResult Function() fingerPrint,
    required TResult Function() mpin,
    required TResult Function() pin,
    required TResult Function() tpin,
  }) {
    return fingerPrint();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
  }) {
    return fingerPrint?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
    required TResult orElse(),
  }) {
    if (fingerPrint != null) {
      return fingerPrint();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceId value) faceId,
    required TResult Function(FingerPrint value) fingerPrint,
    required TResult Function(MPIN value) mpin,
    required TResult Function(PIN value) pin,
    required TResult Function(TPIN value) tpin,
  }) {
    return fingerPrint(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
  }) {
    return fingerPrint?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
    required TResult orElse(),
  }) {
    if (fingerPrint != null) {
      return fingerPrint(this);
    }
    return orElse();
  }
}

abstract class FingerPrint extends AuthType {
  const factory FingerPrint() = _$FingerPrint;
  const FingerPrint._() : super._();
}

/// @nodoc
abstract class _$$MPINCopyWith<$Res> {
  factory _$$MPINCopyWith(_$MPIN value, $Res Function(_$MPIN) then) =
      __$$MPINCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MPINCopyWithImpl<$Res> extends _$AuthTypeCopyWithImpl<$Res>
    implements _$$MPINCopyWith<$Res> {
  __$$MPINCopyWithImpl(_$MPIN _value, $Res Function(_$MPIN) _then)
      : super(_value, (v) => _then(v as _$MPIN));

  @override
  _$MPIN get _value => super._value as _$MPIN;
}

/// @nodoc

class _$MPIN extends MPIN {
  const _$MPIN() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MPIN);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() faceId,
    required TResult Function() fingerPrint,
    required TResult Function() mpin,
    required TResult Function() pin,
    required TResult Function() tpin,
  }) {
    return mpin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
  }) {
    return mpin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
    required TResult orElse(),
  }) {
    if (mpin != null) {
      return mpin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceId value) faceId,
    required TResult Function(FingerPrint value) fingerPrint,
    required TResult Function(MPIN value) mpin,
    required TResult Function(PIN value) pin,
    required TResult Function(TPIN value) tpin,
  }) {
    return mpin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
  }) {
    return mpin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
    required TResult orElse(),
  }) {
    if (mpin != null) {
      return mpin(this);
    }
    return orElse();
  }
}

abstract class MPIN extends AuthType {
  const factory MPIN() = _$MPIN;
  const MPIN._() : super._();
}

/// @nodoc
abstract class _$$PINCopyWith<$Res> {
  factory _$$PINCopyWith(_$PIN value, $Res Function(_$PIN) then) =
      __$$PINCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PINCopyWithImpl<$Res> extends _$AuthTypeCopyWithImpl<$Res>
    implements _$$PINCopyWith<$Res> {
  __$$PINCopyWithImpl(_$PIN _value, $Res Function(_$PIN) _then)
      : super(_value, (v) => _then(v as _$PIN));

  @override
  _$PIN get _value => super._value as _$PIN;
}

/// @nodoc

class _$PIN extends PIN {
  const _$PIN() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PIN);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() faceId,
    required TResult Function() fingerPrint,
    required TResult Function() mpin,
    required TResult Function() pin,
    required TResult Function() tpin,
  }) {
    return pin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
  }) {
    return pin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
    required TResult orElse(),
  }) {
    if (pin != null) {
      return pin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceId value) faceId,
    required TResult Function(FingerPrint value) fingerPrint,
    required TResult Function(MPIN value) mpin,
    required TResult Function(PIN value) pin,
    required TResult Function(TPIN value) tpin,
  }) {
    return pin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
  }) {
    return pin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
    required TResult orElse(),
  }) {
    if (pin != null) {
      return pin(this);
    }
    return orElse();
  }
}

abstract class PIN extends AuthType {
  const factory PIN() = _$PIN;
  const PIN._() : super._();
}

/// @nodoc
abstract class _$$TPINCopyWith<$Res> {
  factory _$$TPINCopyWith(_$TPIN value, $Res Function(_$TPIN) then) =
      __$$TPINCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TPINCopyWithImpl<$Res> extends _$AuthTypeCopyWithImpl<$Res>
    implements _$$TPINCopyWith<$Res> {
  __$$TPINCopyWithImpl(_$TPIN _value, $Res Function(_$TPIN) _then)
      : super(_value, (v) => _then(v as _$TPIN));

  @override
  _$TPIN get _value => super._value as _$TPIN;
}

/// @nodoc

class _$TPIN extends TPIN {
  const _$TPIN() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TPIN);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() faceId,
    required TResult Function() fingerPrint,
    required TResult Function() mpin,
    required TResult Function() pin,
    required TResult Function() tpin,
  }) {
    return tpin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
  }) {
    return tpin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? faceId,
    TResult Function()? fingerPrint,
    TResult Function()? mpin,
    TResult Function()? pin,
    TResult Function()? tpin,
    required TResult orElse(),
  }) {
    if (tpin != null) {
      return tpin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FaceId value) faceId,
    required TResult Function(FingerPrint value) fingerPrint,
    required TResult Function(MPIN value) mpin,
    required TResult Function(PIN value) pin,
    required TResult Function(TPIN value) tpin,
  }) {
    return tpin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
  }) {
    return tpin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FaceId value)? faceId,
    TResult Function(FingerPrint value)? fingerPrint,
    TResult Function(MPIN value)? mpin,
    TResult Function(PIN value)? pin,
    TResult Function(TPIN value)? tpin,
    required TResult orElse(),
  }) {
    if (tpin != null) {
      return tpin(this);
    }
    return orElse();
  }
}

abstract class TPIN extends AuthType {
  const factory TPIN() = _$TPIN;
  const TPIN._() : super._();
}
