// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceDetailState {
  String get deviceId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceDetailStateCopyWith<DeviceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceDetailStateCopyWith<$Res> {
  factory $DeviceDetailStateCopyWith(
          DeviceDetailState value, $Res Function(DeviceDetailState) then) =
      _$DeviceDetailStateCopyWithImpl<$Res>;
  $Res call({String deviceId});
}

/// @nodoc
class _$DeviceDetailStateCopyWithImpl<$Res>
    implements $DeviceDetailStateCopyWith<$Res> {
  _$DeviceDetailStateCopyWithImpl(this._value, this._then);

  final DeviceDetailState _value;
  // ignore: unused_field
  final $Res Function(DeviceDetailState) _then;

  @override
  $Res call({
    Object? deviceId = freezed,
  }) {
    return _then(_value.copyWith(
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceDetailStateCopyWith<$Res>
    implements $DeviceDetailStateCopyWith<$Res> {
  factory _$$_DeviceDetailStateCopyWith(_$_DeviceDetailState value,
          $Res Function(_$_DeviceDetailState) then) =
      __$$_DeviceDetailStateCopyWithImpl<$Res>;
  @override
  $Res call({String deviceId});
}

/// @nodoc
class __$$_DeviceDetailStateCopyWithImpl<$Res>
    extends _$DeviceDetailStateCopyWithImpl<$Res>
    implements _$$_DeviceDetailStateCopyWith<$Res> {
  __$$_DeviceDetailStateCopyWithImpl(
      _$_DeviceDetailState _value, $Res Function(_$_DeviceDetailState) _then)
      : super(_value, (v) => _then(v as _$_DeviceDetailState));

  @override
  _$_DeviceDetailState get _value => super._value as _$_DeviceDetailState;

  @override
  $Res call({
    Object? deviceId = freezed,
  }) {
    return _then(_$_DeviceDetailState(
      deviceId: deviceId == freezed
          ? _value.deviceId
          : deviceId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_DeviceDetailState implements _DeviceDetailState {
  const _$_DeviceDetailState({this.deviceId = ''});

  @override
  @JsonKey()
  final String deviceId;

  @override
  String toString() {
    return 'DeviceDetailState(deviceId: $deviceId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceDetailState &&
            const DeepCollectionEquality().equals(other.deviceId, deviceId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(deviceId));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceDetailStateCopyWith<_$_DeviceDetailState> get copyWith =>
      __$$_DeviceDetailStateCopyWithImpl<_$_DeviceDetailState>(
          this, _$identity);
}

abstract class _DeviceDetailState implements DeviceDetailState {
  const factory _DeviceDetailState({final String deviceId}) =
      _$_DeviceDetailState;

  @override
  String get deviceId;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceDetailStateCopyWith<_$_DeviceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
