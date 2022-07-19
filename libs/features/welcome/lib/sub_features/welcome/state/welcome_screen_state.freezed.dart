// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'welcome_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$WelcomeScreenStateTearOff {
  const _$WelcomeScreenStateTearOff();

  _WelcomeScreenState call({String currentLanguageCode = 'en'}) {
    return _WelcomeScreenState(
      currentLanguageCode: currentLanguageCode,
    );
  }
}

/// @nodoc
const $WelcomeScreenState = _$WelcomeScreenStateTearOff();

/// @nodoc
mixin _$WelcomeScreenState {
  String get currentLanguageCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WelcomeScreenStateCopyWith<WelcomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WelcomeScreenStateCopyWith<$Res> {
  factory $WelcomeScreenStateCopyWith(
          WelcomeScreenState value, $Res Function(WelcomeScreenState) then) =
      _$WelcomeScreenStateCopyWithImpl<$Res>;
  $Res call({String currentLanguageCode});
}

/// @nodoc
class _$WelcomeScreenStateCopyWithImpl<$Res>
    implements $WelcomeScreenStateCopyWith<$Res> {
  _$WelcomeScreenStateCopyWithImpl(this._value, this._then);

  final WelcomeScreenState _value;
  // ignore: unused_field
  final $Res Function(WelcomeScreenState) _then;

  @override
  $Res call({
    Object? currentLanguageCode = freezed,
  }) {
    return _then(_value.copyWith(
      currentLanguageCode: currentLanguageCode == freezed
          ? _value.currentLanguageCode
          : currentLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$WelcomeScreenStateCopyWith<$Res>
    implements $WelcomeScreenStateCopyWith<$Res> {
  factory _$WelcomeScreenStateCopyWith(
          _WelcomeScreenState value, $Res Function(_WelcomeScreenState) then) =
      __$WelcomeScreenStateCopyWithImpl<$Res>;
  @override
  $Res call({String currentLanguageCode});
}

/// @nodoc
class __$WelcomeScreenStateCopyWithImpl<$Res>
    extends _$WelcomeScreenStateCopyWithImpl<$Res>
    implements _$WelcomeScreenStateCopyWith<$Res> {
  __$WelcomeScreenStateCopyWithImpl(
      _WelcomeScreenState _value, $Res Function(_WelcomeScreenState) _then)
      : super(_value, (v) => _then(v as _WelcomeScreenState));

  @override
  _WelcomeScreenState get _value => super._value as _WelcomeScreenState;

  @override
  $Res call({
    Object? currentLanguageCode = freezed,
  }) {
    return _then(_WelcomeScreenState(
      currentLanguageCode: currentLanguageCode == freezed
          ? _value.currentLanguageCode
          : currentLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_WelcomeScreenState implements _WelcomeScreenState {
  const _$_WelcomeScreenState({this.currentLanguageCode = 'en'});

  @JsonKey()
  @override
  final String currentLanguageCode;

  @override
  String toString() {
    return 'WelcomeScreenState(currentLanguageCode: $currentLanguageCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WelcomeScreenState &&
            const DeepCollectionEquality()
                .equals(other.currentLanguageCode, currentLanguageCode));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(currentLanguageCode));

  @JsonKey(ignore: true)
  @override
  _$WelcomeScreenStateCopyWith<_WelcomeScreenState> get copyWith =>
      __$WelcomeScreenStateCopyWithImpl<_WelcomeScreenState>(this, _$identity);
}

abstract class _WelcomeScreenState implements WelcomeScreenState {
  const factory _WelcomeScreenState({String currentLanguageCode}) =
      _$_WelcomeScreenState;

  @override
  String get currentLanguageCode;
  @override
  @JsonKey(ignore: true)
  _$WelcomeScreenStateCopyWith<_WelcomeScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}
