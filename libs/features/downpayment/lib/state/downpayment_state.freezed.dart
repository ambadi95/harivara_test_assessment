// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'downpayment_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DownPaymentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context,
            String error,
            bool isLoading,
            bool paymentRequested,
            bool waitForPayment,
            bool paymentReceived,
            bool loanApproved,
            bool loanActivated)
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            String error,
            bool isLoading,
            bool paymentRequested,
            bool waitForPayment,
            bool paymentReceived,
            bool loanApproved,
            bool loanActivated)?
        ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            String error,
            bool isLoading,
            bool paymentRequested,
            bool waitForPayment,
            bool paymentReceived,
            bool loanApproved,
            bool loanActivated)?
        ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(DownPaymentStateReady value) ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(DownPaymentStateReady value)? ready,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(DownPaymentStateReady value)? ready,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownPaymentStateCopyWith<$Res> {
  factory $DownPaymentStateCopyWith(
          DownPaymentState value, $Res Function(DownPaymentState) then) =
      _$DownPaymentStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DownPaymentStateCopyWithImpl<$Res>
    implements $DownPaymentStateCopyWith<$Res> {
  _$DownPaymentStateCopyWithImpl(this._value, this._then);

  final DownPaymentState _value;
  // ignore: unused_field
  final $Res Function(DownPaymentState) _then;
}

/// @nodoc
abstract class _$$InitialStateCopyWith<$Res> {
  factory _$$InitialStateCopyWith(
          _$InitialState value, $Res Function(_$InitialState) then) =
      __$$InitialStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialStateCopyWithImpl<$Res>
    extends _$DownPaymentStateCopyWithImpl<$Res>
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
    return 'DownPaymentState.initialState()';
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
            bool paymentRequested,
            bool waitForPayment,
            bool paymentReceived,
            bool loanApproved,
            bool loanActivated)
        ready,
  }) {
    return initialState();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            String error,
            bool isLoading,
            bool paymentRequested,
            bool waitForPayment,
            bool paymentReceived,
            bool loanApproved,
            bool loanActivated)?
        ready,
  }) {
    return initialState?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            String error,
            bool isLoading,
            bool paymentRequested,
            bool waitForPayment,
            bool paymentReceived,
            bool loanApproved,
            bool loanActivated)?
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
    required TResult Function(DownPaymentStateReady value) ready,
  }) {
    return initialState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(DownPaymentStateReady value)? ready,
  }) {
    return initialState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(DownPaymentStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (initialState != null) {
      return initialState(this);
    }
    return orElse();
  }
}

abstract class InitialState implements DownPaymentState {
  const factory InitialState() = _$InitialState;
}

/// @nodoc
abstract class _$$DownPaymentStateReadyCopyWith<$Res> {
  factory _$$DownPaymentStateReadyCopyWith(_$DownPaymentStateReady value,
          $Res Function(_$DownPaymentStateReady) then) =
      __$$DownPaymentStateReadyCopyWithImpl<$Res>;
  $Res call(
      {BuildContext context,
      String error,
      bool isLoading,
      bool paymentRequested,
      bool waitForPayment,
      bool paymentReceived,
      bool loanApproved,
      bool loanActivated});
}

/// @nodoc
class __$$DownPaymentStateReadyCopyWithImpl<$Res>
    extends _$DownPaymentStateCopyWithImpl<$Res>
    implements _$$DownPaymentStateReadyCopyWith<$Res> {
  __$$DownPaymentStateReadyCopyWithImpl(_$DownPaymentStateReady _value,
      $Res Function(_$DownPaymentStateReady) _then)
      : super(_value, (v) => _then(v as _$DownPaymentStateReady));

  @override
  _$DownPaymentStateReady get _value => super._value as _$DownPaymentStateReady;

  @override
  $Res call({
    Object? context = freezed,
    Object? error = freezed,
    Object? isLoading = freezed,
    Object? paymentRequested = freezed,
    Object? waitForPayment = freezed,
    Object? paymentReceived = freezed,
    Object? loanApproved = freezed,
    Object? loanActivated = freezed,
  }) {
    return _then(_$DownPaymentStateReady(
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
      paymentRequested: paymentRequested == freezed
          ? _value.paymentRequested
          : paymentRequested // ignore: cast_nullable_to_non_nullable
              as bool,
      waitForPayment: waitForPayment == freezed
          ? _value.waitForPayment
          : waitForPayment // ignore: cast_nullable_to_non_nullable
              as bool,
      paymentReceived: paymentReceived == freezed
          ? _value.paymentReceived
          : paymentReceived // ignore: cast_nullable_to_non_nullable
              as bool,
      loanApproved: loanApproved == freezed
          ? _value.loanApproved
          : loanApproved // ignore: cast_nullable_to_non_nullable
              as bool,
      loanActivated: loanActivated == freezed
          ? _value.loanActivated
          : loanActivated // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$DownPaymentStateReady implements DownPaymentStateReady {
  const _$DownPaymentStateReady(
      {required this.context,
      this.error = '',
      this.isLoading = false,
      this.paymentRequested = false,
      this.waitForPayment = false,
      this.paymentReceived = false,
      this.loanApproved = false,
      this.loanActivated = false});

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
  final bool paymentRequested;
  @override
  @JsonKey()
  final bool waitForPayment;
  @override
  @JsonKey()
  final bool paymentReceived;
  @override
  @JsonKey()
  final bool loanApproved;
  @override
  @JsonKey()
  final bool loanActivated;

  @override
  String toString() {
    return 'DownPaymentState.ready(context: $context, error: $error, isLoading: $isLoading, paymentRequested: $paymentRequested, waitForPayment: $waitForPayment, paymentReceived: $paymentReceived, loanApproved: $loanApproved, loanActivated: $loanActivated)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownPaymentStateReady &&
            const DeepCollectionEquality().equals(other.context, context) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading) &&
            const DeepCollectionEquality()
                .equals(other.paymentRequested, paymentRequested) &&
            const DeepCollectionEquality()
                .equals(other.waitForPayment, waitForPayment) &&
            const DeepCollectionEquality()
                .equals(other.paymentReceived, paymentReceived) &&
            const DeepCollectionEquality()
                .equals(other.loanApproved, loanApproved) &&
            const DeepCollectionEquality()
                .equals(other.loanActivated, loanActivated));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(context),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(isLoading),
      const DeepCollectionEquality().hash(paymentRequested),
      const DeepCollectionEquality().hash(waitForPayment),
      const DeepCollectionEquality().hash(paymentReceived),
      const DeepCollectionEquality().hash(loanApproved),
      const DeepCollectionEquality().hash(loanActivated));

  @JsonKey(ignore: true)
  @override
  _$$DownPaymentStateReadyCopyWith<_$DownPaymentStateReady> get copyWith =>
      __$$DownPaymentStateReadyCopyWithImpl<_$DownPaymentStateReady>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialState,
    required TResult Function(
            BuildContext context,
            String error,
            bool isLoading,
            bool paymentRequested,
            bool waitForPayment,
            bool paymentReceived,
            bool loanApproved,
            bool loanActivated)
        ready,
  }) {
    return ready(context, error, isLoading, paymentRequested, waitForPayment,
        paymentReceived, loanApproved, loanActivated);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            String error,
            bool isLoading,
            bool paymentRequested,
            bool waitForPayment,
            bool paymentReceived,
            bool loanApproved,
            bool loanActivated)?
        ready,
  }) {
    return ready?.call(context, error, isLoading, paymentRequested,
        waitForPayment, paymentReceived, loanApproved, loanActivated);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialState,
    TResult Function(
            BuildContext context,
            String error,
            bool isLoading,
            bool paymentRequested,
            bool waitForPayment,
            bool paymentReceived,
            bool loanApproved,
            bool loanActivated)?
        ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(context, error, isLoading, paymentRequested, waitForPayment,
          paymentReceived, loanApproved, loanActivated);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitialState value) initialState,
    required TResult Function(DownPaymentStateReady value) ready,
  }) {
    return ready(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(DownPaymentStateReady value)? ready,
  }) {
    return ready?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitialState value)? initialState,
    TResult Function(DownPaymentStateReady value)? ready,
    required TResult orElse(),
  }) {
    if (ready != null) {
      return ready(this);
    }
    return orElse();
  }
}

abstract class DownPaymentStateReady implements DownPaymentState {
  const factory DownPaymentStateReady(
      {required final BuildContext context,
      final String error,
      final bool isLoading,
      final bool paymentRequested,
      final bool waitForPayment,
      final bool paymentReceived,
      final bool loanApproved,
      final bool loanActivated}) = _$DownPaymentStateReady;

  BuildContext get context;
  String get error;
  bool get isLoading;
  bool get paymentRequested;
  bool get waitForPayment;
  bool get paymentReceived;
  bool get loanApproved;
  bool get loanActivated;
  @JsonKey(ignore: true)
  _$$DownPaymentStateReadyCopyWith<_$DownPaymentStateReady> get copyWith =>
      throw _privateConstructorUsedError;
}
