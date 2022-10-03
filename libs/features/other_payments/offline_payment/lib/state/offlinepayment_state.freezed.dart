// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'offlinepayment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OfflinePaymentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context,
            String error,
            bool isLoading,
            num paymentReceivedOffline,
            num loanApproved,
            num loanCreated)
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading,
            num paymentReceivedOffline, num loanApproved, num loanCreated)?
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading,
            num paymentReceivedOffline, num loanApproved, num loanCreated)?
        ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(OfflinePaymentStateReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(OfflinePaymentStateReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(OfflinePaymentStateReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflinePaymentStateCopyWith<$Res> {
  factory $OfflinePaymentStateCopyWith(
          OfflinePaymentState value, $Res Function(OfflinePaymentState) then) =
      _$OfflinePaymentStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$OfflinePaymentStateCopyWithImpl<$Res>
    implements $OfflinePaymentStateCopyWith<$Res> {
  _$OfflinePaymentStateCopyWithImpl(this._value, this._then);

  final OfflinePaymentState _value;
  // ignore: unused_field
  final $Res Function(OfflinePaymentState) _then;
}

/// @nodoc
abstract class _$$InitialStateCopyWith<$Res> {
  factory _$$InitialStateCopyWith(
          _$InitialState value, $Res Function(_$InitialState) then) =
      __$$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateCopyWithImpl<$Res>
    extends _$OfflinePaymentStateCopyWithImpl<$Res>
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
    return 'OfflinePaymentState.initialState()';
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
            BuildContext context,
            String error,
            bool isLoading,
            num paymentReceivedOffline,
            num loanApproved,
            num loanCreated)
        ready,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading,
            num paymentReceivedOffline, num loanApproved, num loanCreated)?
        ready,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading,
            num paymentReceivedOffline, num loanApproved, num loanCreated)?
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
    required TResult Function(OfflinePaymentStateReady value) ready,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(OfflinePaymentStateReady value)? ready,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(OfflinePaymentStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class InitialState implements OfflinePaymentState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class _$$OfflinePaymentStateReadyCopyWith<$Res> {
  factory _$$OfflinePaymentStateReadyCopyWith(_$OfflinePaymentStateReady value,
          $Res Function(_$OfflinePaymentStateReady) then) =
      __$$OfflinePaymentStateReadyCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      String error,
      bool isLoading,
      num paymentReceivedOffline,
      num loanApproved,
      num loanCreated});
}

/// @nodoc
class __$$OfflinePaymentStateReadyCopyWithImpl<$Res>
    extends _$OfflinePaymentStateCopyWithImpl<$Res>
    implements _$$OfflinePaymentStateReadyCopyWith<$Res> {
  __$$OfflinePaymentStateReadyCopyWithImpl(_$OfflinePaymentStateReady _value,
      $Res Function(_$OfflinePaymentStateReady) _then)
      : super(_value, (v) => _then(v as _$OfflinePaymentStateReady));

  @override
  _$OfflinePaymentStateReady get _value =>
      super._value as _$OfflinePaymentStateReady;

  @override
  $Res call({
    Object? context = freezed,
    Object? error = freezed,
    Object? isLoading = freezed,
    Object? paymentReceivedOffline = freezed,
    Object? loanApproved = freezed,
    Object? loanCreated = freezed,
  }) {
    return _then(_$OfflinePaymentStateReady(
      context: context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentReceivedOffline: paymentReceivedOffline == freezed
          ? _value.paymentReceivedOffline
          : paymentReceivedOffline // ignore: cast_nullable_to_non_nullable
              as num,
      loanApproved: loanApproved == freezed
          ? _value.loanApproved
          : loanApproved // ignore: cast_nullable_to_non_nullable
              as num,
      loanCreated: loanCreated == freezed
          ? _value.loanCreated
          : loanCreated // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc

class _$OfflinePaymentStateReady implements OfflinePaymentStateReady {
  const _$OfflinePaymentStateReady(
      {required this.context,
      this.error = '',
      this.isLoading = false,
      this.paymentReceivedOffline = 0,
      this.loanApproved = 0,
      this.loanCreated = 0});

  @override
  final BuildContext context;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final num paymentReceivedOffline;
  @override
  @JsonKey()
  final num loanApproved;
  @override
  @JsonKey()
  final num loanCreated;

  @override
  String toString() {
    return 'OfflinePaymentState.ready(context: $context, error: $error, isLoading: $isLoading, paymentReceivedOffline: $paymentReceivedOffline, loanApproved: $loanApproved, loanCreated: $loanCreated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflinePaymentStateReady &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.paymentReceivedOffline, paymentReceivedOffline) &&
            const DeepCollectionEquality()
                .equals(other.loanApproved, loanApproved) &&
            const DeepCollectionEquality()
                .equals(other.loanCreated, loanCreated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(paymentReceivedOffline),
      const DeepCollectionEquality().hash(loanApproved),
      const DeepCollectionEquality().hash(loanCreated));

  @JsonKey(ignore: true)
  @override
  _$$OfflinePaymentStateReadyCopyWith<_$OfflinePaymentStateReady>
      get copyWith =>
          __$$OfflinePaymentStateReadyCopyWithImpl<_$OfflinePaymentStateReady>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context,
            String error,
            bool isLoading,
            num paymentReceivedOffline,
            num loanApproved,
            num loanCreated)
        ready,
  }) {
    return ready(context, error, isLoading, paymentReceivedOffline,
        loanApproved, loanCreated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading,
            num paymentReceivedOffline, num loanApproved, num loanCreated)?
        ready,
  }) {
    return ready?.call(context, error, isLoading, paymentReceivedOffline,
        loanApproved, loanCreated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(BuildContext context, String error, bool isLoading,
            num paymentReceivedOffline, num loanApproved, num loanCreated)?
        ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(context, error, isLoading, paymentReceivedOffline,
          loanApproved, loanCreated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(OfflinePaymentStateReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(OfflinePaymentStateReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(OfflinePaymentStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class OfflinePaymentStateReady implements OfflinePaymentState {
  const factory OfflinePaymentStateReady(
      {required final BuildContext context,
      final String error,
      final bool isLoading,
      final num paymentReceivedOffline,
      final num loanApproved,
      final num loanCreated}) = _$OfflinePaymentStateReady;

  BuildContext get context;
  String get error;
  bool get isLoading;
  num get paymentReceivedOffline;
  num get loanApproved;
  num get loanCreated;
  @JsonKey(ignore: true)
  _$$OfflinePaymentStateReadyCopyWith<_$OfflinePaymentStateReady>
      get copyWith => throw _privateConstructorUsedError;
}
