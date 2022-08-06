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
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String deviceId) $default, {
    required TResult Function(String mobileId) selectedMobile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String deviceId)? $default, {
    TResult Function(String mobileId)? selectedMobile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String deviceId)? $default, {
    TResult Function(String mobileId)? selectedMobile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeviceDetailState value) $default, {
    required TResult Function(SelectedMobile value) selectedMobile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_DeviceDetailState value)? $default, {
    TResult Function(SelectedMobile value)? selectedMobile,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeviceDetailState value)? $default, {
    TResult Function(SelectedMobile value)? selectedMobile,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceDetailStateCopyWith<$Res> {
  factory $DeviceDetailStateCopyWith(
          DeviceDetailState value, $Res Function(DeviceDetailState) then) =
      _$DeviceDetailStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DeviceDetailStateCopyWithImpl<$Res>
    implements $DeviceDetailStateCopyWith<$Res> {
  _$DeviceDetailStateCopyWithImpl(this._value, this._then);

  final DeviceDetailState _value;
  // ignore: unused_field
  final $Res Function(DeviceDetailState) _then;
}

/// @nodoc
abstract class _$$_DeviceDetailStateCopyWith<$Res> {
  factory _$$_DeviceDetailStateCopyWith(_$_DeviceDetailState value,
          $Res Function(_$_DeviceDetailState) then) =
      __$$_DeviceDetailStateCopyWithImpl<$Res>;
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

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String deviceId) $default, {
    required TResult Function(String mobileId) selectedMobile,
  }) {
    return $default(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String deviceId)? $default, {
    TResult Function(String mobileId)? selectedMobile,
  }) {
    return $default?.call(deviceId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String deviceId)? $default, {
    TResult Function(String mobileId)? selectedMobile,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(deviceId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeviceDetailState value) $default, {
    required TResult Function(SelectedMobile value) selectedMobile,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_DeviceDetailState value)? $default, {
    TResult Function(SelectedMobile value)? selectedMobile,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeviceDetailState value)? $default, {
    TResult Function(SelectedMobile value)? selectedMobile,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _DeviceDetailState implements DeviceDetailState {
  const factory _DeviceDetailState({final String deviceId}) =
      _$_DeviceDetailState;

  String get deviceId;
  @JsonKey(ignore: true)
  _$$_DeviceDetailStateCopyWith<_$_DeviceDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectedMobileCopyWith<$Res> {
  factory _$$SelectedMobileCopyWith(
          _$SelectedMobile value, $Res Function(_$SelectedMobile) then) =
      __$$SelectedMobileCopyWithImpl<$Res>;
  $Res call({String mobileId});
}

/// @nodoc
class __$$SelectedMobileCopyWithImpl<$Res>
    extends _$DeviceDetailStateCopyWithImpl<$Res>
    implements _$$SelectedMobileCopyWith<$Res> {
  __$$SelectedMobileCopyWithImpl(
      _$SelectedMobile _value, $Res Function(_$SelectedMobile) _then)
      : super(_value, (v) => _then(v as _$SelectedMobile));

  @override
  _$SelectedMobile get _value => super._value as _$SelectedMobile;

  @override
  $Res call({
    Object? mobileId = freezed,
  }) {
    return _then(_$SelectedMobile(
      mobileId == freezed
          ? _value.mobileId
          : mobileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SelectedMobile implements SelectedMobile {
  const _$SelectedMobile(this.mobileId);

  @override
  final String mobileId;

  @override
  String toString() {
    return 'DeviceDetailState.selectedMobile(mobileId: $mobileId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectedMobile &&
            const DeepCollectionEquality().equals(other.mobileId, mobileId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(mobileId));

  @JsonKey(ignore: true)
  @override
  _$$SelectedMobileCopyWith<_$SelectedMobile> get copyWith =>
      __$$SelectedMobileCopyWithImpl<_$SelectedMobile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String deviceId) $default, {
    required TResult Function(String mobileId) selectedMobile,
  }) {
    return selectedMobile(mobileId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(String deviceId)? $default, {
    TResult Function(String mobileId)? selectedMobile,
  }) {
    return selectedMobile?.call(mobileId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String deviceId)? $default, {
    TResult Function(String mobileId)? selectedMobile,
    required TResult orElse(),
  }) {
    if (selectedMobile != null) {
      return selectedMobile(mobileId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_DeviceDetailState value) $default, {
    required TResult Function(SelectedMobile value) selectedMobile,
  }) {
    return selectedMobile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_DeviceDetailState value)? $default, {
    TResult Function(SelectedMobile value)? selectedMobile,
  }) {
    return selectedMobile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_DeviceDetailState value)? $default, {
    TResult Function(SelectedMobile value)? selectedMobile,
    required TResult orElse(),
  }) {
    if (selectedMobile != null) {
      return selectedMobile(this);
    }
    return orElse();
  }
}

abstract class SelectedMobile implements DeviceDetailState {
  const factory SelectedMobile(final String mobileId) = _$SelectedMobile;

  String get mobileId;
  @JsonKey(ignore: true)
  _$$SelectedMobileCopyWith<_$SelectedMobile> get copyWith =>
      throw _privateConstructorUsedError;
}
