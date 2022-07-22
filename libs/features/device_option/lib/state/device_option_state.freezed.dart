// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'device_option_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeviceOptionState {
  List<DeviceOptionModel> get DeviceOptionList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DeviceOptionStateCopyWith<DeviceOptionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceOptionStateCopyWith<$Res> {
  factory $DeviceOptionStateCopyWith(
          DeviceOptionState value, $Res Function(DeviceOptionState) then) =
      _$DeviceOptionStateCopyWithImpl<$Res>;
  $Res call({List<DeviceOptionModel> DeviceOptionList});
}

/// @nodoc
class _$DeviceOptionStateCopyWithImpl<$Res>
    implements $DeviceOptionStateCopyWith<$Res> {
  _$DeviceOptionStateCopyWithImpl(this._value, this._then);

  final DeviceOptionState _value;
  // ignore: unused_field
  final $Res Function(DeviceOptionState) _then;

  @override
  $Res call({
    Object? DeviceOptionList = freezed,
  }) {
    return _then(_value.copyWith(
      DeviceOptionList: DeviceOptionList == freezed
          ? _value.DeviceOptionList
          : DeviceOptionList // ignore: cast_nullable_to_non_nullable
              as List<DeviceOptionModel>,
    ));
  }
}

/// @nodoc
abstract class _$$_DeviceOptionStateCopyWith<$Res>
    implements $DeviceOptionStateCopyWith<$Res> {
  factory _$$_DeviceOptionStateCopyWith(_$_DeviceOptionState value,
          $Res Function(_$_DeviceOptionState) then) =
      __$$_DeviceOptionStateCopyWithImpl<$Res>;
  @override
  $Res call({List<DeviceOptionModel> DeviceOptionList});
}

/// @nodoc
class __$$_DeviceOptionStateCopyWithImpl<$Res>
    extends _$DeviceOptionStateCopyWithImpl<$Res>
    implements _$$_DeviceOptionStateCopyWith<$Res> {
  __$$_DeviceOptionStateCopyWithImpl(
      _$_DeviceOptionState _value, $Res Function(_$_DeviceOptionState) _then)
      : super(_value, (v) => _then(v as _$_DeviceOptionState));

  @override
  _$_DeviceOptionState get _value => super._value as _$_DeviceOptionState;

  @override
  $Res call({
    Object? DeviceOptionList = freezed,
  }) {
    return _then(_$_DeviceOptionState(
      DeviceOptionList: DeviceOptionList == freezed
          ? _value._DeviceOptionList
          : DeviceOptionList // ignore: cast_nullable_to_non_nullable
              as List<DeviceOptionModel>,
    ));
  }
}

/// @nodoc

class _$_DeviceOptionState implements _DeviceOptionState {
  const _$_DeviceOptionState(
      {final List<DeviceOptionModel> DeviceOptionList = const []})
      : _DeviceOptionList = DeviceOptionList;

  final List<DeviceOptionModel> _DeviceOptionList;
  @override
  @JsonKey()
  List<DeviceOptionModel> get DeviceOptionList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_DeviceOptionList);
  }

  @override
  String toString() {
    return 'DeviceOptionState(DeviceOptionList: $DeviceOptionList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeviceOptionState &&
            const DeepCollectionEquality()
                .equals(other._DeviceOptionList, _DeviceOptionList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_DeviceOptionList));

  @JsonKey(ignore: true)
  @override
  _$$_DeviceOptionStateCopyWith<_$_DeviceOptionState> get copyWith =>
      __$$_DeviceOptionStateCopyWithImpl<_$_DeviceOptionState>(
          this, _$identity);
}

abstract class _DeviceOptionState implements DeviceOptionState {
  const factory _DeviceOptionState(
      {final List<DeviceOptionModel> DeviceOptionList}) = _$_DeviceOptionState;

  @override
  List<DeviceOptionModel> get DeviceOptionList;
  @override
  @JsonKey(ignore: true)
  _$$_DeviceOptionStateCopyWith<_$_DeviceOptionState> get copyWith =>
      throw _privateConstructorUsedError;
}
