// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'home_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeScreenState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context, String error, bool isAgent, bool isLoading)
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context, String error, bool isAgent, bool isLoading)?
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context, String error, bool isAgent, bool isLoading)?
        ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(HomeScreenReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(HomeScreenReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(HomeScreenReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeScreenStateCopyWith<$Res> {
  factory $HomeScreenStateCopyWith(
          HomeScreenState value, $Res Function(HomeScreenState) then) =
      _$HomeScreenStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$HomeScreenStateCopyWithImpl<$Res>
    implements $HomeScreenStateCopyWith<$Res> {
  _$HomeScreenStateCopyWithImpl(this._value, this._then);

  final HomeScreenState _value;
  // ignore: unused_field
  final $Res Function(HomeScreenState) _then;
}

/// @nodoc
abstract class _$$InitialStateCopyWith<$Res> {
  factory _$$InitialStateCopyWith(
          _$InitialState value, $Res Function(_$InitialState) then) =
      __$$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res>
    implements _$$InitialStateCopyWith<$Res> {
  __$$InitialStateCopyWithImpl(
      _$InitialState _value, $Res Function(_$InitialState) _then)
      : super(_value, (v) => _then(v as _$InitialState));

  @override
  _$InitialState get _value => super._value as _$InitialState;
}

/// @nodoc

class _$InitialState implements InitialState {
  const _$InitialState();

  @override
  String toString() {
    return 'HomeScreenState.initialState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context, String error, bool isAgent, bool isLoading)
        ready,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context, String error, bool isAgent, bool isLoading)?
        ready,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context, String error, bool isAgent, bool isLoading)?
        ready,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(HomeScreenReady value) ready,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(HomeScreenReady value)? ready,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(HomeScreenReady value)? ready,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class InitialState implements HomeScreenState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class _$$HomeScreenReadyCopyWith<$Res> {
  factory _$$HomeScreenReadyCopyWith(
          _$HomeScreenReady value, $Res Function(_$HomeScreenReady) then) =
      __$$HomeScreenReadyCopyWithImpl<$Res>;
  $Res call({BuildContext context, String error, bool isAgent, bool isLoading});
}

/// @nodoc
class __$$HomeScreenReadyCopyWithImpl<$Res>
    extends _$HomeScreenStateCopyWithImpl<$Res>
    implements _$$HomeScreenReadyCopyWith<$Res> {
  __$$HomeScreenReadyCopyWithImpl(
      _$HomeScreenReady _value, $Res Function(_$HomeScreenReady) _then)
      : super(_value, (v) => _then(v as _$HomeScreenReady));

  @override
  _$HomeScreenReady get _value => super._value as _$HomeScreenReady;

  @override
  $Res call({
    Object? context = freezed,
    Object? error = freezed,
    Object? isAgent = freezed,
    Object? isLoading = freezed,
  }) {
    return _then(_$HomeScreenReady(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isAgent: isAgent == freezed
          ? _value.isAgent
          : isAgent // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeScreenReady implements HomeScreenReady {
  const _$HomeScreenReady(
      {required this.context,
      this.error = '',
      this.isAgent = false,
      this.isLoading = false});

  @override
  final BuildContext context;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final bool isAgent;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'HomeScreenState.ready(context: $context, error: $error, isAgent: $isAgent, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeScreenReady &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.isAgent, isAgent) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(isAgent),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  _$$HomeScreenReadyCopyWith<_$HomeScreenReady> get copyWith =>
      __$$HomeScreenReadyCopyWithImpl<_$HomeScreenReady>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context, String error, bool isAgent, bool isLoading)
        ready,
  }) {
    return ready(context, error, isAgent, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context, String error, bool isAgent, bool isLoading)?
        ready,
  }) {
    return ready?.call(context, error, isAgent, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context, String error, bool isAgent, bool isLoading)?
        ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(context, error, isAgent, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(HomeScreenReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(HomeScreenReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(HomeScreenReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class HomeScreenReady implements HomeScreenState {
  const factory HomeScreenReady(
      {required final BuildContext context,
      final String error,
      final bool isAgent,
      final bool isLoading}) = _$HomeScreenReady;

  BuildContext get context;
  String get error;
  bool get isAgent;
  bool get isLoading;
  @JsonKey(ignore: true)
  _$$HomeScreenReadyCopyWith<_$HomeScreenReady> get copyWith =>
      throw _privateConstructorUsedError;
}
