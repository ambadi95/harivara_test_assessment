// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionCategory {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() purchase,
    required TResult Function() refund,
    required TResult Function() addedFunds,
    required TResult Function() receivedFunds,
    required TResult Function() sentFunds,
    required TResult Function() subscription,
    required TResult Function() p2m,
    required TResult Function() notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseCategory value) purchase,
    required TResult Function(RefundCategory value) refund,
    required TResult Function(AddedFundsCategory value) addedFunds,
    required TResult Function(ReceivedFundsCategory value) receivedFunds,
    required TResult Function(SentFundsCategory value) sentFunds,
    required TResult Function(SubscriptionCategory value) subscription,
    required TResult Function(P2MCategory value) p2m,
    required TResult Function(NotAvailable value) notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCategoryCopyWith<$Res> {
  factory $TransactionCategoryCopyWith(
          TransactionCategory value, $Res Function(TransactionCategory) then) =
      _$TransactionCategoryCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionCategoryCopyWithImpl<$Res>
    implements $TransactionCategoryCopyWith<$Res> {
  _$TransactionCategoryCopyWithImpl(this._value, this._then);

  final TransactionCategory _value;
  // ignore: unused_field
  final $Res Function(TransactionCategory) _then;
}

/// @nodoc
abstract class _$$PurchaseCategoryCopyWith<$Res> {
  factory _$$PurchaseCategoryCopyWith(
          _$PurchaseCategory value, $Res Function(_$PurchaseCategory) then) =
      __$$PurchaseCategoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PurchaseCategoryCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res>
    implements _$$PurchaseCategoryCopyWith<$Res> {
  __$$PurchaseCategoryCopyWithImpl(
      _$PurchaseCategory _value, $Res Function(_$PurchaseCategory) _then)
      : super(_value, (v) => _then(v as _$PurchaseCategory));

  @override
  _$PurchaseCategory get _value => super._value as _$PurchaseCategory;
}

/// @nodoc

class _$PurchaseCategory extends PurchaseCategory {
  const _$PurchaseCategory() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PurchaseCategory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() purchase,
    required TResult Function() refund,
    required TResult Function() addedFunds,
    required TResult Function() receivedFunds,
    required TResult Function() sentFunds,
    required TResult Function() subscription,
    required TResult Function() p2m,
    required TResult Function() notAvailable,
  }) {
    return purchase();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
  }) {
    return purchase?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (purchase != null) {
      return purchase();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseCategory value) purchase,
    required TResult Function(RefundCategory value) refund,
    required TResult Function(AddedFundsCategory value) addedFunds,
    required TResult Function(ReceivedFundsCategory value) receivedFunds,
    required TResult Function(SentFundsCategory value) sentFunds,
    required TResult Function(SubscriptionCategory value) subscription,
    required TResult Function(P2MCategory value) p2m,
    required TResult Function(NotAvailable value) notAvailable,
  }) {
    return purchase(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
  }) {
    return purchase?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (purchase != null) {
      return purchase(this);
    }
    return orElse();
  }
}

abstract class PurchaseCategory extends TransactionCategory {
  const factory PurchaseCategory() = _$PurchaseCategory;
  const PurchaseCategory._() : super._();
}

/// @nodoc
abstract class _$$RefundCategoryCopyWith<$Res> {
  factory _$$RefundCategoryCopyWith(
          _$RefundCategory value, $Res Function(_$RefundCategory) then) =
      __$$RefundCategoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefundCategoryCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res>
    implements _$$RefundCategoryCopyWith<$Res> {
  __$$RefundCategoryCopyWithImpl(
      _$RefundCategory _value, $Res Function(_$RefundCategory) _then)
      : super(_value, (v) => _then(v as _$RefundCategory));

  @override
  _$RefundCategory get _value => super._value as _$RefundCategory;
}

/// @nodoc

class _$RefundCategory extends RefundCategory {
  const _$RefundCategory() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefundCategory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() purchase,
    required TResult Function() refund,
    required TResult Function() addedFunds,
    required TResult Function() receivedFunds,
    required TResult Function() sentFunds,
    required TResult Function() subscription,
    required TResult Function() p2m,
    required TResult Function() notAvailable,
  }) {
    return refund();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
  }) {
    return refund?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (refund != null) {
      return refund();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseCategory value) purchase,
    required TResult Function(RefundCategory value) refund,
    required TResult Function(AddedFundsCategory value) addedFunds,
    required TResult Function(ReceivedFundsCategory value) receivedFunds,
    required TResult Function(SentFundsCategory value) sentFunds,
    required TResult Function(SubscriptionCategory value) subscription,
    required TResult Function(P2MCategory value) p2m,
    required TResult Function(NotAvailable value) notAvailable,
  }) {
    return refund(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
  }) {
    return refund?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (refund != null) {
      return refund(this);
    }
    return orElse();
  }
}

abstract class RefundCategory extends TransactionCategory {
  const factory RefundCategory() = _$RefundCategory;
  const RefundCategory._() : super._();
}

/// @nodoc
abstract class _$$AddedFundsCategoryCopyWith<$Res> {
  factory _$$AddedFundsCategoryCopyWith(_$AddedFundsCategory value,
          $Res Function(_$AddedFundsCategory) then) =
      __$$AddedFundsCategoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddedFundsCategoryCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res>
    implements _$$AddedFundsCategoryCopyWith<$Res> {
  __$$AddedFundsCategoryCopyWithImpl(
      _$AddedFundsCategory _value, $Res Function(_$AddedFundsCategory) _then)
      : super(_value, (v) => _then(v as _$AddedFundsCategory));

  @override
  _$AddedFundsCategory get _value => super._value as _$AddedFundsCategory;
}

/// @nodoc

class _$AddedFundsCategory extends AddedFundsCategory {
  const _$AddedFundsCategory() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddedFundsCategory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() purchase,
    required TResult Function() refund,
    required TResult Function() addedFunds,
    required TResult Function() receivedFunds,
    required TResult Function() sentFunds,
    required TResult Function() subscription,
    required TResult Function() p2m,
    required TResult Function() notAvailable,
  }) {
    return addedFunds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
  }) {
    return addedFunds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (addedFunds != null) {
      return addedFunds();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseCategory value) purchase,
    required TResult Function(RefundCategory value) refund,
    required TResult Function(AddedFundsCategory value) addedFunds,
    required TResult Function(ReceivedFundsCategory value) receivedFunds,
    required TResult Function(SentFundsCategory value) sentFunds,
    required TResult Function(SubscriptionCategory value) subscription,
    required TResult Function(P2MCategory value) p2m,
    required TResult Function(NotAvailable value) notAvailable,
  }) {
    return addedFunds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
  }) {
    return addedFunds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (addedFunds != null) {
      return addedFunds(this);
    }
    return orElse();
  }
}

abstract class AddedFundsCategory extends TransactionCategory {
  const factory AddedFundsCategory() = _$AddedFundsCategory;
  const AddedFundsCategory._() : super._();
}

/// @nodoc
abstract class _$$ReceivedFundsCategoryCopyWith<$Res> {
  factory _$$ReceivedFundsCategoryCopyWith(_$ReceivedFundsCategory value,
          $Res Function(_$ReceivedFundsCategory) then) =
      __$$ReceivedFundsCategoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReceivedFundsCategoryCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res>
    implements _$$ReceivedFundsCategoryCopyWith<$Res> {
  __$$ReceivedFundsCategoryCopyWithImpl(_$ReceivedFundsCategory _value,
      $Res Function(_$ReceivedFundsCategory) _then)
      : super(_value, (v) => _then(v as _$ReceivedFundsCategory));

  @override
  _$ReceivedFundsCategory get _value => super._value as _$ReceivedFundsCategory;
}

/// @nodoc

class _$ReceivedFundsCategory extends ReceivedFundsCategory {
  const _$ReceivedFundsCategory() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReceivedFundsCategory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() purchase,
    required TResult Function() refund,
    required TResult Function() addedFunds,
    required TResult Function() receivedFunds,
    required TResult Function() sentFunds,
    required TResult Function() subscription,
    required TResult Function() p2m,
    required TResult Function() notAvailable,
  }) {
    return receivedFunds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
  }) {
    return receivedFunds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (receivedFunds != null) {
      return receivedFunds();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseCategory value) purchase,
    required TResult Function(RefundCategory value) refund,
    required TResult Function(AddedFundsCategory value) addedFunds,
    required TResult Function(ReceivedFundsCategory value) receivedFunds,
    required TResult Function(SentFundsCategory value) sentFunds,
    required TResult Function(SubscriptionCategory value) subscription,
    required TResult Function(P2MCategory value) p2m,
    required TResult Function(NotAvailable value) notAvailable,
  }) {
    return receivedFunds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
  }) {
    return receivedFunds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (receivedFunds != null) {
      return receivedFunds(this);
    }
    return orElse();
  }
}

abstract class ReceivedFundsCategory extends TransactionCategory {
  const factory ReceivedFundsCategory() = _$ReceivedFundsCategory;
  const ReceivedFundsCategory._() : super._();
}

/// @nodoc
abstract class _$$SentFundsCategoryCopyWith<$Res> {
  factory _$$SentFundsCategoryCopyWith(
          _$SentFundsCategory value, $Res Function(_$SentFundsCategory) then) =
      __$$SentFundsCategoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SentFundsCategoryCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res>
    implements _$$SentFundsCategoryCopyWith<$Res> {
  __$$SentFundsCategoryCopyWithImpl(
      _$SentFundsCategory _value, $Res Function(_$SentFundsCategory) _then)
      : super(_value, (v) => _then(v as _$SentFundsCategory));

  @override
  _$SentFundsCategory get _value => super._value as _$SentFundsCategory;
}

/// @nodoc

class _$SentFundsCategory extends SentFundsCategory {
  const _$SentFundsCategory() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SentFundsCategory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() purchase,
    required TResult Function() refund,
    required TResult Function() addedFunds,
    required TResult Function() receivedFunds,
    required TResult Function() sentFunds,
    required TResult Function() subscription,
    required TResult Function() p2m,
    required TResult Function() notAvailable,
  }) {
    return sentFunds();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
  }) {
    return sentFunds?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (sentFunds != null) {
      return sentFunds();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseCategory value) purchase,
    required TResult Function(RefundCategory value) refund,
    required TResult Function(AddedFundsCategory value) addedFunds,
    required TResult Function(ReceivedFundsCategory value) receivedFunds,
    required TResult Function(SentFundsCategory value) sentFunds,
    required TResult Function(SubscriptionCategory value) subscription,
    required TResult Function(P2MCategory value) p2m,
    required TResult Function(NotAvailable value) notAvailable,
  }) {
    return sentFunds(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
  }) {
    return sentFunds?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (sentFunds != null) {
      return sentFunds(this);
    }
    return orElse();
  }
}

abstract class SentFundsCategory extends TransactionCategory {
  const factory SentFundsCategory() = _$SentFundsCategory;
  const SentFundsCategory._() : super._();
}

/// @nodoc
abstract class _$$SubscriptionCategoryCopyWith<$Res> {
  factory _$$SubscriptionCategoryCopyWith(_$SubscriptionCategory value,
          $Res Function(_$SubscriptionCategory) then) =
      __$$SubscriptionCategoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubscriptionCategoryCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res>
    implements _$$SubscriptionCategoryCopyWith<$Res> {
  __$$SubscriptionCategoryCopyWithImpl(_$SubscriptionCategory _value,
      $Res Function(_$SubscriptionCategory) _then)
      : super(_value, (v) => _then(v as _$SubscriptionCategory));

  @override
  _$SubscriptionCategory get _value => super._value as _$SubscriptionCategory;
}

/// @nodoc

class _$SubscriptionCategory extends SubscriptionCategory {
  const _$SubscriptionCategory() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubscriptionCategory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() purchase,
    required TResult Function() refund,
    required TResult Function() addedFunds,
    required TResult Function() receivedFunds,
    required TResult Function() sentFunds,
    required TResult Function() subscription,
    required TResult Function() p2m,
    required TResult Function() notAvailable,
  }) {
    return subscription();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
  }) {
    return subscription?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (subscription != null) {
      return subscription();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseCategory value) purchase,
    required TResult Function(RefundCategory value) refund,
    required TResult Function(AddedFundsCategory value) addedFunds,
    required TResult Function(ReceivedFundsCategory value) receivedFunds,
    required TResult Function(SentFundsCategory value) sentFunds,
    required TResult Function(SubscriptionCategory value) subscription,
    required TResult Function(P2MCategory value) p2m,
    required TResult Function(NotAvailable value) notAvailable,
  }) {
    return subscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
  }) {
    return subscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (subscription != null) {
      return subscription(this);
    }
    return orElse();
  }
}

abstract class SubscriptionCategory extends TransactionCategory {
  const factory SubscriptionCategory() = _$SubscriptionCategory;
  const SubscriptionCategory._() : super._();
}

/// @nodoc
abstract class _$$P2MCategoryCopyWith<$Res> {
  factory _$$P2MCategoryCopyWith(
          _$P2MCategory value, $Res Function(_$P2MCategory) then) =
      __$$P2MCategoryCopyWithImpl<$Res>;
}

/// @nodoc
class __$$P2MCategoryCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res>
    implements _$$P2MCategoryCopyWith<$Res> {
  __$$P2MCategoryCopyWithImpl(
      _$P2MCategory _value, $Res Function(_$P2MCategory) _then)
      : super(_value, (v) => _then(v as _$P2MCategory));

  @override
  _$P2MCategory get _value => super._value as _$P2MCategory;
}

/// @nodoc

class _$P2MCategory extends P2MCategory {
  const _$P2MCategory() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$P2MCategory);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() purchase,
    required TResult Function() refund,
    required TResult Function() addedFunds,
    required TResult Function() receivedFunds,
    required TResult Function() sentFunds,
    required TResult Function() subscription,
    required TResult Function() p2m,
    required TResult Function() notAvailable,
  }) {
    return p2m();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
  }) {
    return p2m?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (p2m != null) {
      return p2m();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseCategory value) purchase,
    required TResult Function(RefundCategory value) refund,
    required TResult Function(AddedFundsCategory value) addedFunds,
    required TResult Function(ReceivedFundsCategory value) receivedFunds,
    required TResult Function(SentFundsCategory value) sentFunds,
    required TResult Function(SubscriptionCategory value) subscription,
    required TResult Function(P2MCategory value) p2m,
    required TResult Function(NotAvailable value) notAvailable,
  }) {
    return p2m(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
  }) {
    return p2m?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (p2m != null) {
      return p2m(this);
    }
    return orElse();
  }
}

abstract class P2MCategory extends TransactionCategory {
  const factory P2MCategory() = _$P2MCategory;
  const P2MCategory._() : super._();
}

/// @nodoc
abstract class _$$NotAvailableCopyWith<$Res> {
  factory _$$NotAvailableCopyWith(
          _$NotAvailable value, $Res Function(_$NotAvailable) then) =
      __$$NotAvailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotAvailableCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res>
    implements _$$NotAvailableCopyWith<$Res> {
  __$$NotAvailableCopyWithImpl(
      _$NotAvailable _value, $Res Function(_$NotAvailable) _then)
      : super(_value, (v) => _then(v as _$NotAvailable));

  @override
  _$NotAvailable get _value => super._value as _$NotAvailable;
}

/// @nodoc

class _$NotAvailable extends NotAvailable {
  const _$NotAvailable() : super._();

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotAvailable);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() purchase,
    required TResult Function() refund,
    required TResult Function() addedFunds,
    required TResult Function() receivedFunds,
    required TResult Function() sentFunds,
    required TResult Function() subscription,
    required TResult Function() p2m,
    required TResult Function() notAvailable,
  }) {
    return notAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
  }) {
    return notAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? purchase,
    TResult Function()? refund,
    TResult Function()? addedFunds,
    TResult Function()? receivedFunds,
    TResult Function()? sentFunds,
    TResult Function()? subscription,
    TResult Function()? p2m,
    TResult Function()? notAvailable,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(PurchaseCategory value) purchase,
    required TResult Function(RefundCategory value) refund,
    required TResult Function(AddedFundsCategory value) addedFunds,
    required TResult Function(ReceivedFundsCategory value) receivedFunds,
    required TResult Function(SentFundsCategory value) sentFunds,
    required TResult Function(SubscriptionCategory value) subscription,
    required TResult Function(P2MCategory value) p2m,
    required TResult Function(NotAvailable value) notAvailable,
  }) {
    return notAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
  }) {
    return notAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(PurchaseCategory value)? purchase,
    TResult Function(RefundCategory value)? refund,
    TResult Function(AddedFundsCategory value)? addedFunds,
    TResult Function(ReceivedFundsCategory value)? receivedFunds,
    TResult Function(SentFundsCategory value)? sentFunds,
    TResult Function(SubscriptionCategory value)? subscription,
    TResult Function(P2MCategory value)? p2m,
    TResult Function(NotAvailable value)? notAvailable,
    required TResult orElse(),
  }) {
    if (notAvailable != null) {
      return notAvailable(this);
    }
    return orElse();
  }
}

abstract class NotAvailable extends TransactionCategory {
  const factory NotAvailable() = _$NotAvailable;
  const NotAvailable._() : super._();
}
