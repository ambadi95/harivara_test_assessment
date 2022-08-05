// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'date_filter_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DateFilterType {
  bool get selectionState => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool selectionState) currentMonth,
    required TResult Function(bool selectionState) previousMonth,
    required TResult Function(bool selectionState) lastThreeMonths,
    required TResult Function(bool selectionState) lastYear,
    required TResult Function(bool selectionState) allTransactions,
    required TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)
        selectDates,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentMonth value) currentMonth,
    required TResult Function(PreviousMonth value) previousMonth,
    required TResult Function(LastThreeMotnhs value) lastThreeMonths,
    required TResult Function(LastYear value) lastYear,
    required TResult Function(AllTransactions value) allTransactions,
    required TResult Function(SelectDates value) selectDates,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DateFilterTypeCopyWith<DateFilterType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DateFilterTypeCopyWith<$Res> {
  factory $DateFilterTypeCopyWith(
          DateFilterType value, $Res Function(DateFilterType) then) =
      _$DateFilterTypeCopyWithImpl<$Res>;
  $Res call({bool selectionState});
}

/// @nodoc
class _$DateFilterTypeCopyWithImpl<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  _$DateFilterTypeCopyWithImpl(this._value, this._then);

  final DateFilterType _value;
  // ignore: unused_field
  final $Res Function(DateFilterType) _then;

  @override
  $Res call({
    Object? selectionState = freezed,
  }) {
    return _then(_value.copyWith(
      selectionState: selectionState == freezed
          ? _value.selectionState
          : selectionState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$$CurrentMonthCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory _$$CurrentMonthCopyWith(
          _$CurrentMonth value, $Res Function(_$CurrentMonth) then) =
      __$$CurrentMonthCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState});
}

/// @nodoc
class __$$CurrentMonthCopyWithImpl<$Res>
    extends _$DateFilterTypeCopyWithImpl<$Res>
    implements _$$CurrentMonthCopyWith<$Res> {
  __$$CurrentMonthCopyWithImpl(
      _$CurrentMonth _value, $Res Function(_$CurrentMonth) _then)
      : super(_value, (v) => _then(v as _$CurrentMonth));

  @override
  _$CurrentMonth get _value => super._value as _$CurrentMonth;

  @override
  $Res call({
    Object? selectionState = freezed,
  }) {
    return _then(_$CurrentMonth(
      selectionState: selectionState == freezed
          ? _value.selectionState
          : selectionState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CurrentMonth extends CurrentMonth {
  const _$CurrentMonth({this.selectionState = true}) : super._();

  @override
  @JsonKey()
  final bool selectionState;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentMonth &&
            const DeepCollectionEquality()
                .equals(other.selectionState, selectionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectionState));

  @JsonKey(ignore: true)
  @override
  _$$CurrentMonthCopyWith<_$CurrentMonth> get copyWith =>
      __$$CurrentMonthCopyWithImpl<_$CurrentMonth>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool selectionState) currentMonth,
    required TResult Function(bool selectionState) previousMonth,
    required TResult Function(bool selectionState) lastThreeMonths,
    required TResult Function(bool selectionState) lastYear,
    required TResult Function(bool selectionState) allTransactions,
    required TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)
        selectDates,
  }) {
    return currentMonth(selectionState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
  }) {
    return currentMonth?.call(selectionState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
    required TResult orElse(),
  }) {
    if (currentMonth != null) {
      return currentMonth(selectionState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentMonth value) currentMonth,
    required TResult Function(PreviousMonth value) previousMonth,
    required TResult Function(LastThreeMotnhs value) lastThreeMonths,
    required TResult Function(LastYear value) lastYear,
    required TResult Function(AllTransactions value) allTransactions,
    required TResult Function(SelectDates value) selectDates,
  }) {
    return currentMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
  }) {
    return currentMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
    required TResult orElse(),
  }) {
    if (currentMonth != null) {
      return currentMonth(this);
    }
    return orElse();
  }
}

abstract class CurrentMonth extends DateFilterType {
  const factory CurrentMonth({final bool selectionState}) = _$CurrentMonth;
  const CurrentMonth._() : super._();

  @override
  bool get selectionState;
  @override
  @JsonKey(ignore: true)
  _$$CurrentMonthCopyWith<_$CurrentMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PreviousMonthCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory _$$PreviousMonthCopyWith(
          _$PreviousMonth value, $Res Function(_$PreviousMonth) then) =
      __$$PreviousMonthCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState});
}

/// @nodoc
class __$$PreviousMonthCopyWithImpl<$Res>
    extends _$DateFilterTypeCopyWithImpl<$Res>
    implements _$$PreviousMonthCopyWith<$Res> {
  __$$PreviousMonthCopyWithImpl(
      _$PreviousMonth _value, $Res Function(_$PreviousMonth) _then)
      : super(_value, (v) => _then(v as _$PreviousMonth));

  @override
  _$PreviousMonth get _value => super._value as _$PreviousMonth;

  @override
  $Res call({
    Object? selectionState = freezed,
  }) {
    return _then(_$PreviousMonth(
      selectionState: selectionState == freezed
          ? _value.selectionState
          : selectionState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$PreviousMonth extends PreviousMonth {
  const _$PreviousMonth({this.selectionState = false}) : super._();

  @override
  @JsonKey()
  final bool selectionState;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreviousMonth &&
            const DeepCollectionEquality()
                .equals(other.selectionState, selectionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectionState));

  @JsonKey(ignore: true)
  @override
  _$$PreviousMonthCopyWith<_$PreviousMonth> get copyWith =>
      __$$PreviousMonthCopyWithImpl<_$PreviousMonth>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool selectionState) currentMonth,
    required TResult Function(bool selectionState) previousMonth,
    required TResult Function(bool selectionState) lastThreeMonths,
    required TResult Function(bool selectionState) lastYear,
    required TResult Function(bool selectionState) allTransactions,
    required TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)
        selectDates,
  }) {
    return previousMonth(selectionState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
  }) {
    return previousMonth?.call(selectionState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
    required TResult orElse(),
  }) {
    if (previousMonth != null) {
      return previousMonth(selectionState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentMonth value) currentMonth,
    required TResult Function(PreviousMonth value) previousMonth,
    required TResult Function(LastThreeMotnhs value) lastThreeMonths,
    required TResult Function(LastYear value) lastYear,
    required TResult Function(AllTransactions value) allTransactions,
    required TResult Function(SelectDates value) selectDates,
  }) {
    return previousMonth(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
  }) {
    return previousMonth?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
    required TResult orElse(),
  }) {
    if (previousMonth != null) {
      return previousMonth(this);
    }
    return orElse();
  }
}

abstract class PreviousMonth extends DateFilterType {
  const factory PreviousMonth({final bool selectionState}) = _$PreviousMonth;
  const PreviousMonth._() : super._();

  @override
  bool get selectionState;
  @override
  @JsonKey(ignore: true)
  _$$PreviousMonthCopyWith<_$PreviousMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LastThreeMotnhsCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory _$$LastThreeMotnhsCopyWith(
          _$LastThreeMotnhs value, $Res Function(_$LastThreeMotnhs) then) =
      __$$LastThreeMotnhsCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState});
}

/// @nodoc
class __$$LastThreeMotnhsCopyWithImpl<$Res>
    extends _$DateFilterTypeCopyWithImpl<$Res>
    implements _$$LastThreeMotnhsCopyWith<$Res> {
  __$$LastThreeMotnhsCopyWithImpl(
      _$LastThreeMotnhs _value, $Res Function(_$LastThreeMotnhs) _then)
      : super(_value, (v) => _then(v as _$LastThreeMotnhs));

  @override
  _$LastThreeMotnhs get _value => super._value as _$LastThreeMotnhs;

  @override
  $Res call({
    Object? selectionState = freezed,
  }) {
    return _then(_$LastThreeMotnhs(
      selectionState: selectionState == freezed
          ? _value.selectionState
          : selectionState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LastThreeMotnhs extends LastThreeMotnhs {
  const _$LastThreeMotnhs({this.selectionState = false}) : super._();

  @override
  @JsonKey()
  final bool selectionState;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastThreeMotnhs &&
            const DeepCollectionEquality()
                .equals(other.selectionState, selectionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectionState));

  @JsonKey(ignore: true)
  @override
  _$$LastThreeMotnhsCopyWith<_$LastThreeMotnhs> get copyWith =>
      __$$LastThreeMotnhsCopyWithImpl<_$LastThreeMotnhs>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool selectionState) currentMonth,
    required TResult Function(bool selectionState) previousMonth,
    required TResult Function(bool selectionState) lastThreeMonths,
    required TResult Function(bool selectionState) lastYear,
    required TResult Function(bool selectionState) allTransactions,
    required TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)
        selectDates,
  }) {
    return lastThreeMonths(selectionState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
  }) {
    return lastThreeMonths?.call(selectionState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
    required TResult orElse(),
  }) {
    if (lastThreeMonths != null) {
      return lastThreeMonths(selectionState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentMonth value) currentMonth,
    required TResult Function(PreviousMonth value) previousMonth,
    required TResult Function(LastThreeMotnhs value) lastThreeMonths,
    required TResult Function(LastYear value) lastYear,
    required TResult Function(AllTransactions value) allTransactions,
    required TResult Function(SelectDates value) selectDates,
  }) {
    return lastThreeMonths(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
  }) {
    return lastThreeMonths?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
    required TResult orElse(),
  }) {
    if (lastThreeMonths != null) {
      return lastThreeMonths(this);
    }
    return orElse();
  }
}

abstract class LastThreeMotnhs extends DateFilterType {
  const factory LastThreeMotnhs({final bool selectionState}) =
      _$LastThreeMotnhs;
  const LastThreeMotnhs._() : super._();

  @override
  bool get selectionState;
  @override
  @JsonKey(ignore: true)
  _$$LastThreeMotnhsCopyWith<_$LastThreeMotnhs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LastYearCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory _$$LastYearCopyWith(
          _$LastYear value, $Res Function(_$LastYear) then) =
      __$$LastYearCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState});
}

/// @nodoc
class __$$LastYearCopyWithImpl<$Res> extends _$DateFilterTypeCopyWithImpl<$Res>
    implements _$$LastYearCopyWith<$Res> {
  __$$LastYearCopyWithImpl(_$LastYear _value, $Res Function(_$LastYear) _then)
      : super(_value, (v) => _then(v as _$LastYear));

  @override
  _$LastYear get _value => super._value as _$LastYear;

  @override
  $Res call({
    Object? selectionState = freezed,
  }) {
    return _then(_$LastYear(
      selectionState: selectionState == freezed
          ? _value.selectionState
          : selectionState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LastYear extends LastYear {
  const _$LastYear({this.selectionState = false}) : super._();

  @override
  @JsonKey()
  final bool selectionState;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastYear &&
            const DeepCollectionEquality()
                .equals(other.selectionState, selectionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectionState));

  @JsonKey(ignore: true)
  @override
  _$$LastYearCopyWith<_$LastYear> get copyWith =>
      __$$LastYearCopyWithImpl<_$LastYear>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool selectionState) currentMonth,
    required TResult Function(bool selectionState) previousMonth,
    required TResult Function(bool selectionState) lastThreeMonths,
    required TResult Function(bool selectionState) lastYear,
    required TResult Function(bool selectionState) allTransactions,
    required TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)
        selectDates,
  }) {
    return lastYear(selectionState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
  }) {
    return lastYear?.call(selectionState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
    required TResult orElse(),
  }) {
    if (lastYear != null) {
      return lastYear(selectionState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentMonth value) currentMonth,
    required TResult Function(PreviousMonth value) previousMonth,
    required TResult Function(LastThreeMotnhs value) lastThreeMonths,
    required TResult Function(LastYear value) lastYear,
    required TResult Function(AllTransactions value) allTransactions,
    required TResult Function(SelectDates value) selectDates,
  }) {
    return lastYear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
  }) {
    return lastYear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
    required TResult orElse(),
  }) {
    if (lastYear != null) {
      return lastYear(this);
    }
    return orElse();
  }
}

abstract class LastYear extends DateFilterType {
  const factory LastYear({final bool selectionState}) = _$LastYear;
  const LastYear._() : super._();

  @override
  bool get selectionState;
  @override
  @JsonKey(ignore: true)
  _$$LastYearCopyWith<_$LastYear> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AllTransactionsCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory _$$AllTransactionsCopyWith(
          _$AllTransactions value, $Res Function(_$AllTransactions) then) =
      __$$AllTransactionsCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState});
}

/// @nodoc
class __$$AllTransactionsCopyWithImpl<$Res>
    extends _$DateFilterTypeCopyWithImpl<$Res>
    implements _$$AllTransactionsCopyWith<$Res> {
  __$$AllTransactionsCopyWithImpl(
      _$AllTransactions _value, $Res Function(_$AllTransactions) _then)
      : super(_value, (v) => _then(v as _$AllTransactions));

  @override
  _$AllTransactions get _value => super._value as _$AllTransactions;

  @override
  $Res call({
    Object? selectionState = freezed,
  }) {
    return _then(_$AllTransactions(
      selectionState: selectionState == freezed
          ? _value.selectionState
          : selectionState // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AllTransactions extends AllTransactions {
  const _$AllTransactions({this.selectionState = false}) : super._();

  @override
  @JsonKey()
  final bool selectionState;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AllTransactions &&
            const DeepCollectionEquality()
                .equals(other.selectionState, selectionState));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(selectionState));

  @JsonKey(ignore: true)
  @override
  _$$AllTransactionsCopyWith<_$AllTransactions> get copyWith =>
      __$$AllTransactionsCopyWithImpl<_$AllTransactions>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool selectionState) currentMonth,
    required TResult Function(bool selectionState) previousMonth,
    required TResult Function(bool selectionState) lastThreeMonths,
    required TResult Function(bool selectionState) lastYear,
    required TResult Function(bool selectionState) allTransactions,
    required TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)
        selectDates,
  }) {
    return allTransactions(selectionState);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
  }) {
    return allTransactions?.call(selectionState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
    required TResult orElse(),
  }) {
    if (allTransactions != null) {
      return allTransactions(selectionState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentMonth value) currentMonth,
    required TResult Function(PreviousMonth value) previousMonth,
    required TResult Function(LastThreeMotnhs value) lastThreeMonths,
    required TResult Function(LastYear value) lastYear,
    required TResult Function(AllTransactions value) allTransactions,
    required TResult Function(SelectDates value) selectDates,
  }) {
    return allTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
  }) {
    return allTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
    required TResult orElse(),
  }) {
    if (allTransactions != null) {
      return allTransactions(this);
    }
    return orElse();
  }
}

abstract class AllTransactions extends DateFilterType {
  const factory AllTransactions({final bool selectionState}) =
      _$AllTransactions;
  const AllTransactions._() : super._();

  @override
  bool get selectionState;
  @override
  @JsonKey(ignore: true)
  _$$AllTransactionsCopyWith<_$AllTransactions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectDatesCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory _$$SelectDatesCopyWith(
          _$SelectDates value, $Res Function(_$SelectDates) then) =
      __$$SelectDatesCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState, DateTime? endDate, DateTime? startDate});
}

/// @nodoc
class __$$SelectDatesCopyWithImpl<$Res>
    extends _$DateFilterTypeCopyWithImpl<$Res>
    implements _$$SelectDatesCopyWith<$Res> {
  __$$SelectDatesCopyWithImpl(
      _$SelectDates _value, $Res Function(_$SelectDates) _then)
      : super(_value, (v) => _then(v as _$SelectDates));

  @override
  _$SelectDates get _value => super._value as _$SelectDates;

  @override
  $Res call({
    Object? selectionState = freezed,
    Object? endDate = freezed,
    Object? startDate = freezed,
  }) {
    return _then(_$SelectDates(
      selectionState: selectionState == freezed
          ? _value.selectionState
          : selectionState // ignore: cast_nullable_to_non_nullable
              as bool,
      endDate: endDate == freezed
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startDate: startDate == freezed
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$SelectDates extends SelectDates {
  const _$SelectDates(
      {this.selectionState = false, this.endDate, this.startDate})
      : super._();

  @override
  @JsonKey()
  final bool selectionState;
  @override
  final DateTime? endDate;
  @override
  final DateTime? startDate;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectDates &&
            const DeepCollectionEquality()
                .equals(other.selectionState, selectionState) &&
            const DeepCollectionEquality().equals(other.endDate, endDate) &&
            const DeepCollectionEquality().equals(other.startDate, startDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectionState),
      const DeepCollectionEquality().hash(endDate),
      const DeepCollectionEquality().hash(startDate));

  @JsonKey(ignore: true)
  @override
  _$$SelectDatesCopyWith<_$SelectDates> get copyWith =>
      __$$SelectDatesCopyWithImpl<_$SelectDates>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool selectionState) currentMonth,
    required TResult Function(bool selectionState) previousMonth,
    required TResult Function(bool selectionState) lastThreeMonths,
    required TResult Function(bool selectionState) lastYear,
    required TResult Function(bool selectionState) allTransactions,
    required TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)
        selectDates,
  }) {
    return selectDates(selectionState, endDate, startDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
  }) {
    return selectDates?.call(selectionState, endDate, startDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool selectionState)? currentMonth,
    TResult Function(bool selectionState)? previousMonth,
    TResult Function(bool selectionState)? lastThreeMonths,
    TResult Function(bool selectionState)? lastYear,
    TResult Function(bool selectionState)? allTransactions,
    TResult Function(
            bool selectionState, DateTime? endDate, DateTime? startDate)?
        selectDates,
    required TResult orElse(),
  }) {
    if (selectDates != null) {
      return selectDates(selectionState, endDate, startDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CurrentMonth value) currentMonth,
    required TResult Function(PreviousMonth value) previousMonth,
    required TResult Function(LastThreeMotnhs value) lastThreeMonths,
    required TResult Function(LastYear value) lastYear,
    required TResult Function(AllTransactions value) allTransactions,
    required TResult Function(SelectDates value) selectDates,
  }) {
    return selectDates(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
  }) {
    return selectDates?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CurrentMonth value)? currentMonth,
    TResult Function(PreviousMonth value)? previousMonth,
    TResult Function(LastThreeMotnhs value)? lastThreeMonths,
    TResult Function(LastYear value)? lastYear,
    TResult Function(AllTransactions value)? allTransactions,
    TResult Function(SelectDates value)? selectDates,
    required TResult orElse(),
  }) {
    if (selectDates != null) {
      return selectDates(this);
    }
    return orElse();
  }
}

abstract class SelectDates extends DateFilterType {
  const factory SelectDates(
      {final bool selectionState,
      final DateTime? endDate,
      final DateTime? startDate}) = _$SelectDates;
  const SelectDates._() : super._();

  @override
  bool get selectionState;
  DateTime? get endDate;
  DateTime? get startDate;
  @override
  @JsonKey(ignore: true)
  _$$SelectDatesCopyWith<_$SelectDates> get copyWith =>
      throw _privateConstructorUsedError;
}
