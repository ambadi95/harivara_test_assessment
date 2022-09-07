// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payment_status_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaymentStatusState {
  String? get timer => throw _privateConstructorUsedError;
  String get amount => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? timer, String amount)
        paymentStatusTimerState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? timer, String amount)? paymentStatusTimerState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? timer, String amount)? paymentStatusTimerState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentStatusTimerState value)
        paymentStatusTimerState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentStatusTimerState value)? paymentStatusTimerState,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentStatusTimerState value)? paymentStatusTimerState,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentStatusStateCopyWith<PaymentStatusState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentStatusStateCopyWith<$Res> {
  factory $PaymentStatusStateCopyWith(
          PaymentStatusState value, $Res Function(PaymentStatusState) then) =
      _$PaymentStatusStateCopyWithImpl<$Res>;
  $Res call({String? timer, String amount});
}

/// @nodoc
class _$PaymentStatusStateCopyWithImpl<$Res>
    implements $PaymentStatusStateCopyWith<$Res> {
  _$PaymentStatusStateCopyWithImpl(this._value, this._then);

  final PaymentStatusState _value;
  // ignore: unused_field
  final $Res Function(PaymentStatusState) _then;

  @override
  $Res call({
    Object? timer = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      timer: timer == freezed
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$PaymentStatusTimerStateCopyWith<$Res>
    implements $PaymentStatusStateCopyWith<$Res> {
  factory _$$PaymentStatusTimerStateCopyWith(_$PaymentStatusTimerState value,
          $Res Function(_$PaymentStatusTimerState) then) =
      __$$PaymentStatusTimerStateCopyWithImpl<$Res>;
  @override
  $Res call({String? timer, String amount});
}

/// @nodoc
class __$$PaymentStatusTimerStateCopyWithImpl<$Res>
    extends _$PaymentStatusStateCopyWithImpl<$Res>
    implements _$$PaymentStatusTimerStateCopyWith<$Res> {
  __$$PaymentStatusTimerStateCopyWithImpl(_$PaymentStatusTimerState _value,
      $Res Function(_$PaymentStatusTimerState) _then)
      : super(_value, (v) => _then(v as _$PaymentStatusTimerState));

  @override
  _$PaymentStatusTimerState get _value =>
      super._value as _$PaymentStatusTimerState;

  @override
  $Res call({
    Object? timer = freezed,
    Object? amount = freezed,
  }) {
    return _then(_$PaymentStatusTimerState(
      timer: timer == freezed
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PaymentStatusTimerState implements PaymentStatusTimerState {
  const _$PaymentStatusTimerState({required this.timer, required this.amount});

  @override
  final String? timer;
  @override
  final String amount;

  @override
  String toString() {
    return 'PaymentStatusState.paymentStatusTimerState(timer: $timer, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentStatusTimerState &&
            const DeepCollectionEquality().equals(other.timer, timer) &&
            const DeepCollectionEquality().equals(other.amount, amount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(timer),
      const DeepCollectionEquality().hash(amount));

  @JsonKey(ignore: true)
  @override
  _$$PaymentStatusTimerStateCopyWith<_$PaymentStatusTimerState> get copyWith =>
      __$$PaymentStatusTimerStateCopyWithImpl<_$PaymentStatusTimerState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? timer, String amount)
        paymentStatusTimerState,
  }) {
    return paymentStatusTimerState(timer, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String? timer, String amount)? paymentStatusTimerState,
  }) {
    return paymentStatusTimerState?.call(timer, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? timer, String amount)? paymentStatusTimerState,
    required TResult orElse(),
  }) {
    if (paymentStatusTimerState != null) {
      return paymentStatusTimerState(timer, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PaymentStatusTimerState value)
        paymentStatusTimerState,
  }) {
    return paymentStatusTimerState(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PaymentStatusTimerState value)? paymentStatusTimerState,
  }) {
    return paymentStatusTimerState?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PaymentStatusTimerState value)? paymentStatusTimerState,
    required TResult orElse(),
  }) {
    if (paymentStatusTimerState != null) {
      return paymentStatusTimerState(this);
    }
    return orElse();
  }
}

abstract class PaymentStatusTimerState implements PaymentStatusState {
  const factory PaymentStatusTimerState(
      {required final String? timer,
      required final String amount}) = _$PaymentStatusTimerState;

  @override
  String? get timer;
  @override
  String get amount;
  @override
  @JsonKey(ignore: true)
  _$$PaymentStatusTimerStateCopyWith<_$PaymentStatusTimerState> get copyWith =>
      throw _privateConstructorUsedError;
}
