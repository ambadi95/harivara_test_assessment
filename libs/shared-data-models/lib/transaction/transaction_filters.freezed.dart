// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_filters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionFilters {
  DateTime? get endDate => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  String get walletId => throw _privateConstructorUsedError;
  String get operationType => throw _privateConstructorUsedError;
  TransactionType? get transactionsType => throw _privateConstructorUsedError;
  int get pageNo => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime? endDate,
            DateTime? startDate,
            String walletId,
            String operationType,
            TransactionType? transactionsType,
            int pageNo,
            int size)
        filterInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            DateTime? endDate,
            DateTime? startDate,
            String walletId,
            String operationType,
            TransactionType? transactionsType,
            int pageNo,
            int size)?
        filterInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime? endDate,
            DateTime? startDate,
            String walletId,
            String operationType,
            TransactionType? transactionsType,
            int pageNo,
            int size)?
        filterInput,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilterInput value) filterInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FilterInput value)? filterInput,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterInput value)? filterInput,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionFiltersCopyWith<TransactionFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionFiltersCopyWith<$Res> {
  factory $TransactionFiltersCopyWith(
          TransactionFilters value, $Res Function(TransactionFilters) then) =
      _$TransactionFiltersCopyWithImpl<$Res>;
  $Res call(
      {DateTime? endDate,
      DateTime? startDate,
      String walletId,
      String operationType,
      TransactionType? transactionsType,
      int pageNo,
      int size});

  $TransactionTypeCopyWith<$Res>? get transactionsType;
}

/// @nodoc
class _$TransactionFiltersCopyWithImpl<$Res>
    implements $TransactionFiltersCopyWith<$Res> {
  _$TransactionFiltersCopyWithImpl(this._value, this._then);

  final TransactionFilters _value;
  // ignore: unused_field
  final $Res Function(TransactionFilters) _then;

  @override
  $Res call({
    Object? endDate = freezed,
    Object? startDate = freezed,
    Object? walletId = freezed,
    Object? operationType = freezed,
    Object? transactionsType = freezed,
    Object? pageNo = freezed,
    Object? size = freezed,
  }) {
    return _then(_value.copyWith(
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      walletId: walletId == freezed
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      operationType: operationType == freezed
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as String,
      transactionsType: transactionsType == freezed
          ? _value.transactionsType
          : transactionsType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      pageNo: pageNo == freezed
          ? _value.pageNo
          : pageNo // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  @override
  $TransactionTypeCopyWith<$Res>? get transactionsType {
    if (_value.transactionsType == null) {
      return null;
    }

    return $TransactionTypeCopyWith<$Res>(_value.transactionsType!, (value) {
      return _then(_value.copyWith(transactionsType: value));
    });
  }
}

/// @nodoc
abstract class _$$FilterInputCopyWith<$Res>
    implements $TransactionFiltersCopyWith<$Res> {
  factory _$$FilterInputCopyWith(
          _$FilterInput value, $Res Function(_$FilterInput) then) =
      __$$FilterInputCopyWithImpl<$Res>;
  @override
  $Res call(
      {DateTime? endDate,
      DateTime? startDate,
      String walletId,
      String operationType,
      TransactionType? transactionsType,
      int pageNo,
      int size});

  @override
  $TransactionTypeCopyWith<$Res>? get transactionsType;
}

/// @nodoc
class __$$FilterInputCopyWithImpl<$Res>
    extends _$TransactionFiltersCopyWithImpl<$Res>
    implements _$$FilterInputCopyWith<$Res> {
  __$$FilterInputCopyWithImpl(
      _$FilterInput _value, $Res Function(_$FilterInput) _then)
      : super(_value, (v) => _then(v as _$FilterInput));

  @override
  _$FilterInput get _value => super._value as _$FilterInput;

  @override
  $Res call({
    Object? endDate = freezed,
    Object? startDate = freezed,
    Object? walletId = freezed,
    Object? operationType = freezed,
    Object? transactionsType = freezed,
    Object? pageNo = freezed,
    Object? size = freezed,
  }) {
    return _then(_$FilterInput(
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      walletId: walletId == freezed
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as String,
      operationType: operationType == freezed
          ? _value.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as String,
      transactionsType: transactionsType == freezed
          ? _value.transactionsType
          : transactionsType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      pageNo: pageNo == freezed
          ? _value.pageNo
          : pageNo // ignore: cast_nullable_to_non_nullable
              as int,
      size: size == freezed
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$FilterInput extends FilterInput {
  const _$FilterInput(
      {this.endDate,
      this.startDate,
      this.walletId = '12',
      this.operationType = 'COMPLETED',
      this.transactionsType = null,
      this.pageNo = 1,
      this.size = 10})
      : super._();

  @override
  final DateTime? endDate;
  @override
  final DateTime? startDate;
  @override
  @JsonKey()
  final String walletId;
  @override
  @JsonKey()
  final String operationType;
  @override
  @JsonKey()
  final TransactionType? transactionsType;
  @override
  @JsonKey()
  final int pageNo;
  @override
  @JsonKey()
  final int size;

  @override
  String toString() {
    return 'TransactionFilters.filterInput(endDate: $endDate, startDate: $startDate, walletId: $walletId, operationType: $operationType, transactionsType: $transactionsType, pageNo: $pageNo, size: $size)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterInput &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality().equals(other.startDate, startDate) &&
            const DeepCollectionEquality().equals(other.walletId, walletId) &&
            const DeepCollectionEquality()
                .equals(other.operationType, operationType) &&
            const DeepCollectionEquality()
                .equals(other.transactionsType, transactionsType) &&
            const DeepCollectionEquality().equals(other.pageNo, pageNo) &&
            const DeepCollectionEquality().equals(other.size, size));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(endDate),
      const DeepCollectionEquality().hash(startDate),
      const DeepCollectionEquality().hash(walletId),
      const DeepCollectionEquality().hash(operationType),
      const DeepCollectionEquality().hash(transactionsType),
      const DeepCollectionEquality().hash(pageNo),
      const DeepCollectionEquality().hash(size));

  @JsonKey(ignore: true)
  @override
  _$$FilterInputCopyWith<_$FilterInput> get copyWith =>
      __$$FilterInputCopyWithImpl<_$FilterInput>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime? endDate,
            DateTime? startDate,
            String walletId,
            String operationType,
            TransactionType? transactionsType,
            int pageNo,
            int size)
        filterInput,
  }) {
    return filterInput(endDate, startDate, walletId, operationType,
        transactionsType, pageNo, size);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            DateTime? endDate,
            DateTime? startDate,
            String walletId,
            String operationType,
            TransactionType? transactionsType,
            int pageNo,
            int size)?
        filterInput,
  }) {
    return filterInput?.call(endDate, startDate, walletId, operationType,
        transactionsType, pageNo, size);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            DateTime? endDate,
            DateTime? startDate,
            String walletId,
            String operationType,
            TransactionType? transactionsType,
            int pageNo,
            int size)?
        filterInput,
    required TResult orElse(),
  }) {
    if (filterInput != null) {
      return filterInput(endDate, startDate, walletId, operationType,
          transactionsType, pageNo, size);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilterInput value) filterInput,
  }) {
    return filterInput(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(FilterInput value)? filterInput,
  }) {
    return filterInput?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterInput value)? filterInput,
    required TResult orElse(),
  }) {
    if (filterInput != null) {
      return filterInput(this);
    }
    return orElse();
  }
}

abstract class FilterInput extends TransactionFilters {
  const factory FilterInput(
      {final DateTime? endDate,
      final DateTime? startDate,
      final String walletId,
      final String operationType,
      final TransactionType? transactionsType,
      final int pageNo,
      final int size}) = _$FilterInput;
  const FilterInput._() : super._();

  @override
  DateTime? get endDate;
  @override
  DateTime? get startDate;
  @override
  String get walletId;
  @override
  String get operationType;
  @override
  TransactionType? get transactionsType;
  @override
  int get pageNo;
  @override
  int get size;
  @override
  @JsonKey(ignore: true)
  _$$FilterInputCopyWith<_$FilterInput> get copyWith =>
      throw _privateConstructorUsedError;
}
