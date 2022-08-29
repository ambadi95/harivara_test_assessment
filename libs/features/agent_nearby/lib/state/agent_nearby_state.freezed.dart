// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'agent_nearby_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AgentNearByState {
  List<Datum> get agentNearbyList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isFetchingLocation => throw _privateConstructorUsedError;
  bool get isLocationVerified => throw _privateConstructorUsedError;
  String get locationError => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AgentNearByStateCopyWith<AgentNearByState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgentNearByStateCopyWith<$Res> {
  factory $AgentNearByStateCopyWith(
          AgentNearByState value, $Res Function(AgentNearByState) then) =
      _$AgentNearByStateCopyWithImpl<$Res>;
  $Res call(
      {List<Datum> agentNearbyList,
      bool isLoading,
      bool isFetchingLocation,
      bool isLocationVerified,
      String locationError});
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
    Object? isLoading = freezed,
    Object? isFetchingLocation = freezed,
    Object? isLocationVerified = freezed,
    Object? locationError = freezed,
  }) {
    return _then(_value.copyWith(
      agentNearbyList: agentNearbyList == freezed
          ? _value.agentNearbyList
          : agentNearbyList // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingLocation: isFetchingLocation == freezed
          ? _value.isFetchingLocation
          : isFetchingLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocationVerified: isLocationVerified == freezed
          ? _value.isLocationVerified
          : isLocationVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      locationError: locationError == freezed
          ? _value.locationError
          : locationError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AgentNearByStateCopyWith<$Res>
    implements $AgentNearByStateCopyWith<$Res> {
  factory _$$_AgentNearByStateCopyWith(
          _$_AgentNearByState value, $Res Function(_$_AgentNearByState) then) =
      __$$_AgentNearByStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<Datum> agentNearbyList,
      bool isLoading,
      bool isFetchingLocation,
      bool isLocationVerified,
      String locationError});
}

/// @nodoc
class __$$_AgentNearByStateCopyWithImpl<$Res>
    extends _$AgentNearByStateCopyWithImpl<$Res>
    implements _$$_AgentNearByStateCopyWith<$Res> {
  __$$_AgentNearByStateCopyWithImpl(
      _$_AgentNearByState _value, $Res Function(_$_AgentNearByState) _then)
      : super(_value, (v) => _then(v as _$_AgentNearByState));

  @override
  _$_AgentNearByState get _value => super._value as _$_AgentNearByState;

  @override
  $Res call({
    Object? agentNearbyList = freezed,
    Object? isLoading = freezed,
    Object? isFetchingLocation = freezed,
    Object? isLocationVerified = freezed,
    Object? locationError = freezed,
  }) {
    return _then(_$_AgentNearByState(
      agentNearbyList: agentNearbyList == freezed
          ? _value._agentNearbyList
          : agentNearbyList // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isFetchingLocation: isFetchingLocation == freezed
          ? _value.isFetchingLocation
          : isFetchingLocation // ignore: cast_nullable_to_non_nullable
              as bool,
      isLocationVerified: isLocationVerified == freezed
          ? _value.isLocationVerified
          : isLocationVerified // ignore: cast_nullable_to_non_nullable
              as bool,
      locationError: locationError == freezed
          ? _value.locationError
          : locationError // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AgentNearByState implements _AgentNearByState {
  const _$_AgentNearByState(
      {final List<Datum> agentNearbyList = const [],
      this.isLoading = false,
      this.isFetchingLocation = false,
      this.isLocationVerified = false,
      this.locationError = ''})
      : _agentNearbyList = agentNearbyList;

  final List<Datum> _agentNearbyList;
  @override
  @JsonKey()
  List<Datum> get agentNearbyList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_agentNearbyList);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isFetchingLocation;
  @override
  @JsonKey()
  final bool isLocationVerified;
  @override
  @JsonKey()
  final String locationError;

  @override
  String toString() {
    return 'AgentNearByState(agentNearbyList: $agentNearbyList, isLoading: $isLoading, isFetchingLocation: $isFetchingLocation, isLocationVerified: $isLocationVerified, locationError: $locationError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AgentNearByState &&
            const DeepCollectionEquality()
                .equals(other._agentNearbyList, _agentNearbyList) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.isFetchingLocation, isFetchingLocation) &&
            const DeepCollectionEquality()
                .equals(other.isLocationVerified, isLocationVerified) &&
            const DeepCollectionEquality()
                .equals(other.locationError, locationError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_agentNearbyList),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(isFetchingLocation),
      const DeepCollectionEquality().hash(isLocationVerified),
      const DeepCollectionEquality().hash(locationError));

  @JsonKey(ignore: true)
  @override
  _$$_AgentNearByStateCopyWith<_$_AgentNearByState> get copyWith =>
      __$$_AgentNearByStateCopyWithImpl<_$_AgentNearByState>(this, _$identity);
}

abstract class _AgentNearByState implements AgentNearByState {
  const factory _AgentNearByState(
      {final List<Datum> agentNearbyList,
      final bool isLoading,
      final bool isFetchingLocation,
      final bool isLocationVerified,
      final String locationError}) = _$_AgentNearByState;

  @override
  List<Datum> get agentNearbyList;
  @override
  bool get isLoading;
  @override
  bool get isFetchingLocation;
  @override
  bool get isLocationVerified;
  @override
  String get locationError;
  @override
  @JsonKey(ignore: true)
  _$$_AgentNearByStateCopyWith<_$_AgentNearByState> get copyWith =>
      throw _privateConstructorUsedError;
}
