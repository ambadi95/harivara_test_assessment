// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'agent_nearby_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AgentNearByStateTearOff {
  const _$AgentNearByStateTearOff();

  _AgentNearByState call({List<AgentNearbyModel> agentNearbyList = const []}) {
    return _AgentNearByState(
      agentNearbyList: agentNearbyList,
    );
  }
}

/// @nodoc
const $AgentNearByState = _$AgentNearByStateTearOff();

/// @nodoc
mixin _$AgentNearByState {
  List<AgentNearbyModel> get agentNearbyList =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AgentNearByStateCopyWith<AgentNearByState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentNearByStateCopyWith<$Res> {
  factory $AgentNearByStateCopyWith(
          AgentNearByState value, $Res Function(AgentNearByState) then) =
      _$AgentNearByStateCopyWithImpl<$Res>;
  $Res call({List<AgentNearbyModel> agentNearbyList});
}

/// @nodoc
class _$AgentNearByStateCopyWithImpl<$Res>
    implements $AgentNearByStateCopyWith<$Res> {
  _$AgentNearByStateCopyWithImpl(this._value, this._then);

  final AgentNearByState _value;
  // ignore: unused_field
  final $Res Function(AgentNearByState) _then;

  @override
  $Res call({
    Object? agentNearbyList = freezed,
  }) {
    return _then(_value.copyWith(
      agentNearbyList: agentNearbyList == freezed
          ? _value.agentNearbyList
          : agentNearbyList // ignore: cast_nullable_to_non_nullable
              as List<AgentNearbyModel>,
    ));
  }
}

/// @nodoc
abstract class _$AgentNearByStateCopyWith<$Res>
    implements $AgentNearByStateCopyWith<$Res> {
  factory _$AgentNearByStateCopyWith(
          _AgentNearByState value, $Res Function(_AgentNearByState) then) =
      __$AgentNearByStateCopyWithImpl<$Res>;
  @override
  $Res call({List<AgentNearbyModel> agentNearbyList});
}

/// @nodoc
class __$AgentNearByStateCopyWithImpl<$Res>
    extends _$AgentNearByStateCopyWithImpl<$Res>
    implements _$AgentNearByStateCopyWith<$Res> {
  __$AgentNearByStateCopyWithImpl(
      _AgentNearByState _value, $Res Function(_AgentNearByState) _then)
      : super(_value, (v) => _then(v as _AgentNearByState));

  @override
  _AgentNearByState get _value => super._value as _AgentNearByState;

  @override
  $Res call({
    Object? agentNearbyList = freezed,
  }) {
    return _then(_AgentNearByState(
      agentNearbyList: agentNearbyList == freezed
          ? _value.agentNearbyList
          : agentNearbyList // ignore: cast_nullable_to_non_nullable
              as List<AgentNearbyModel>,
    ));
  }
}

/// @nodoc

class _$_AgentNearByState implements _AgentNearByState {
  const _$_AgentNearByState({this.agentNearbyList = const []});

  @JsonKey()
  @override
  final List<AgentNearbyModel> agentNearbyList;

  @override
  String toString() {
    return 'AgentNearByState(agentNearbyList: $agentNearbyList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AgentNearByState &&
            const DeepCollectionEquality()
                .equals(other.agentNearbyList, agentNearbyList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(agentNearbyList));

  @JsonKey(ignore: true)
  @override
  _$AgentNearByStateCopyWith<_AgentNearByState> get copyWith =>
      __$AgentNearByStateCopyWithImpl<_AgentNearByState>(this, _$identity);
}

abstract class _AgentNearByState implements AgentNearByState {
  const factory _AgentNearByState({List<AgentNearbyModel> agentNearbyList}) =
      _$_AgentNearByState;

  @override
  List<AgentNearbyModel> get agentNearbyList;
  @override
  @JsonKey(ignore: true)
  _$AgentNearByStateCopyWith<_AgentNearByState> get copyWith =>
      throw _privateConstructorUsedError;
}
