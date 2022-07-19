// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'app_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppType {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() merchant,
    required TResult Function() customer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? merchant,
    TResult Function()? customer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? merchant,
    TResult Function()? customer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MerchantApp value) merchant,
    required TResult Function(CustomerApp value) customer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MerchantApp value)? merchant,
    TResult Function(CustomerApp value)? customer,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MerchantApp value)? merchant,
    TResult Function(CustomerApp value)? customer,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppTypeCopyWith<$Res> {
  factory $AppTypeCopyWith(AppType value, $Res Function(AppType) then) =
      _$AppTypeCopyWithImpl<$Res>;
}

/// @nodoc
class _$AppTypeCopyWithImpl<$Res> implements $AppTypeCopyWith<$Res> {
  _$AppTypeCopyWithImpl(this._value, this._then);

  final AppType _value;
  // ignore: unused_field
  final $Res Function(AppType) _then;
}

/// @nodoc
abstract class _$$MerchantAppCopyWith<$Res> {
  factory _$$MerchantAppCopyWith(
          _$MerchantApp value, $Res Function(_$MerchantApp) then) =
      __$$MerchantAppCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MerchantAppCopyWithImpl<$Res> extends _$AppTypeCopyWithImpl<$Res>
    implements _$$MerchantAppCopyWith<$Res> {
  __$$MerchantAppCopyWithImpl(
      _$MerchantApp _value, $Res Function(_$MerchantApp) _then)
      : super(_value, (v) => _then(v as _$MerchantApp));

  @override
  _$MerchantApp get _value => super._value as _$MerchantApp;
}

/// @nodoc

class _$MerchantApp extends MerchantApp {
  const _$MerchantApp() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MerchantApp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() merchant,
    required TResult Function() customer,
  }) {
    return merchant();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? merchant,
    TResult Function()? customer,
  }) {
    return merchant?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? merchant,
    TResult Function()? customer,
    required TResult orElse(),
  }) {
    if (merchant != null) {
      return merchant();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MerchantApp value) merchant,
    required TResult Function(CustomerApp value) customer,
  }) {
    return merchant(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MerchantApp value)? merchant,
    TResult Function(CustomerApp value)? customer,
  }) {
    return merchant?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MerchantApp value)? merchant,
    TResult Function(CustomerApp value)? customer,
    required TResult orElse(),
  }) {
    if (merchant != null) {
      return merchant(this);
    }
    return orElse();
  }
}

abstract class MerchantApp extends AppType {
  const factory MerchantApp() = _$MerchantApp;
  const MerchantApp._() : super._();
}

/// @nodoc
abstract class _$$CustomerAppCopyWith<$Res> {
  factory _$$CustomerAppCopyWith(
          _$CustomerApp value, $Res Function(_$CustomerApp) then) =
      __$$CustomerAppCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CustomerAppCopyWithImpl<$Res> extends _$AppTypeCopyWithImpl<$Res>
    implements _$$CustomerAppCopyWith<$Res> {
  __$$CustomerAppCopyWithImpl(
      _$CustomerApp _value, $Res Function(_$CustomerApp) _then)
      : super(_value, (v) => _then(v as _$CustomerApp));

  @override
  _$CustomerApp get _value => super._value as _$CustomerApp;
}

/// @nodoc

class _$CustomerApp extends CustomerApp {
  const _$CustomerApp() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CustomerApp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() merchant,
    required TResult Function() customer,
  }) {
    return customer();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? merchant,
    TResult Function()? customer,
  }) {
    return customer?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? merchant,
    TResult Function()? customer,
    required TResult orElse(),
  }) {
    if (customer != null) {
      return customer();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MerchantApp value) merchant,
    required TResult Function(CustomerApp value) customer,
  }) {
    return customer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(MerchantApp value)? merchant,
    TResult Function(CustomerApp value)? customer,
  }) {
    return customer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MerchantApp value)? merchant,
    TResult Function(CustomerApp value)? customer,
    required TResult orElse(),
  }) {
    if (customer != null) {
      return customer(this);
    }
    return orElse();
  }
}

abstract class CustomerApp extends AppType {
  const factory CustomerApp() = _$CustomerApp;
  const CustomerApp._() : super._();
}
