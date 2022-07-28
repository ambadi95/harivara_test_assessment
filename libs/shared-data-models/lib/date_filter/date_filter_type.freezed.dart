// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'date_filter_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DateFilterTypeTearOff {
  const _$DateFilterTypeTearOff();

  CurrentMonth currentMonth({bool selectionState = true}) {
    return CurrentMonth(
      selectionState: selectionState,
    );
  }

  PreviousMonth previousMonth({bool selectionState = false}) {
    return PreviousMonth(
      selectionState: selectionState,
    );
  }

  LastThreeMotnhs lastThreeMonths({bool selectionState = false}) {
    return LastThreeMotnhs(
      selectionState: selectionState,
    );
  }

  LastYear lastYear({bool selectionState = false}) {
    return LastYear(
      selectionState: selectionState,
    );
  }

  AllTransactions allTransactions({bool selectionState = false}) {
    return AllTransactions(
      selectionState: selectionState,
    );
  }

  SelectDates selectDates(
      {bool selectionState = false, DateTime? endDate, DateTime? startDate}) {
    return SelectDates(
      selectionState: selectionState,
      endDate: endDate,
      startDate: startDate,
    );
  }
}

/// @nodoc
const $DateFilterType = _$DateFilterTypeTearOff();

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
abstract class $CurrentMonthCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory $CurrentMonthCopyWith(
          CurrentMonth value, $Res Function(CurrentMonth) then) =
      _$CurrentMonthCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState});
}

/// @nodoc
class _$CurrentMonthCopyWithImpl<$Res>
    extends _$DateFilterTypeCopyWithImpl<$Res>
    implements $CurrentMonthCopyWith<$Res> {
  _$CurrentMonthCopyWithImpl(
      CurrentMonth _value, $Res Function(CurrentMonth) _then)
      : super(_value, (v) => _then(v as CurrentMonth));

  @override
  CurrentMonth get _value => super._value as CurrentMonth;

  @override
  $Res call({
    Object? selectionState = freezed,
  }) {
    return _then(CurrentMonth(
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

  @JsonKey(defaultValue: true)
  @override
  final bool selectionState;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CurrentMonth &&
            (identical(other.selectionState, selectionState) ||
                const DeepCollectionEquality()
                    .equals(other.selectionState, selectionState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectionState);

  @JsonKey(ignore: true)
  @override
  $CurrentMonthCopyWith<CurrentMonth> get copyWith =>
      _$CurrentMonthCopyWithImpl<CurrentMonth>(this, _$identity);

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
  const factory CurrentMonth({bool selectionState}) = _$CurrentMonth;
  const CurrentMonth._() : super._();

  @override
  bool get selectionState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $CurrentMonthCopyWith<CurrentMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreviousMonthCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory $PreviousMonthCopyWith(
          PreviousMonth value, $Res Function(PreviousMonth) then) =
      _$PreviousMonthCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState});
}

/// @nodoc
class _$PreviousMonthCopyWithImpl<$Res>
    extends _$DateFilterTypeCopyWithImpl<$Res>
    implements $PreviousMonthCopyWith<$Res> {
  _$PreviousMonthCopyWithImpl(
      PreviousMonth _value, $Res Function(PreviousMonth) _then)
      : super(_value, (v) => _then(v as PreviousMonth));

  @override
  PreviousMonth get _value => super._value as PreviousMonth;

  @override
  $Res call({
    Object? selectionState = freezed,
  }) {
    return _then(PreviousMonth(
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

  @JsonKey(defaultValue: false)
  @override
  final bool selectionState;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PreviousMonth &&
            (identical(other.selectionState, selectionState) ||
                const DeepCollectionEquality()
                    .equals(other.selectionState, selectionState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectionState);

  @JsonKey(ignore: true)
  @override
  $PreviousMonthCopyWith<PreviousMonth> get copyWith =>
      _$PreviousMonthCopyWithImpl<PreviousMonth>(this, _$identity);

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
  const factory PreviousMonth({bool selectionState}) = _$PreviousMonth;
  const PreviousMonth._() : super._();

  @override
  bool get selectionState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $PreviousMonthCopyWith<PreviousMonth> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastThreeMotnhsCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory $LastThreeMotnhsCopyWith(
          LastThreeMotnhs value, $Res Function(LastThreeMotnhs) then) =
      _$LastThreeMotnhsCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState});
}

/// @nodoc
class _$LastThreeMotnhsCopyWithImpl<$Res>
    extends _$DateFilterTypeCopyWithImpl<$Res>
    implements $LastThreeMotnhsCopyWith<$Res> {
  _$LastThreeMotnhsCopyWithImpl(
      LastThreeMotnhs _value, $Res Function(LastThreeMotnhs) _then)
      : super(_value, (v) => _then(v as LastThreeMotnhs));

  @override
  LastThreeMotnhs get _value => super._value as LastThreeMotnhs;

  @override
  $Res call({
    Object? selectionState = freezed,
  }) {
    return _then(LastThreeMotnhs(
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

  @JsonKey(defaultValue: false)
  @override
  final bool selectionState;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LastThreeMotnhs &&
            (identical(other.selectionState, selectionState) ||
                const DeepCollectionEquality()
                    .equals(other.selectionState, selectionState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectionState);

  @JsonKey(ignore: true)
  @override
  $LastThreeMotnhsCopyWith<LastThreeMotnhs> get copyWith =>
      _$LastThreeMotnhsCopyWithImpl<LastThreeMotnhs>(this, _$identity);

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
  const factory LastThreeMotnhs({bool selectionState}) = _$LastThreeMotnhs;
  const LastThreeMotnhs._() : super._();

  @override
  bool get selectionState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $LastThreeMotnhsCopyWith<LastThreeMotnhs> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastYearCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory $LastYearCopyWith(LastYear value, $Res Function(LastYear) then) =
      _$LastYearCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState});
}

/// @nodoc
class _$LastYearCopyWithImpl<$Res> extends _$DateFilterTypeCopyWithImpl<$Res>
    implements $LastYearCopyWith<$Res> {
  _$LastYearCopyWithImpl(LastYear _value, $Res Function(LastYear) _then)
      : super(_value, (v) => _then(v as LastYear));

  @override
  LastYear get _value => super._value as LastYear;

  @override
  $Res call({
    Object? selectionState = freezed,
  }) {
    return _then(LastYear(
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

  @JsonKey(defaultValue: false)
  @override
  final bool selectionState;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LastYear &&
            (identical(other.selectionState, selectionState) ||
                const DeepCollectionEquality()
                    .equals(other.selectionState, selectionState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectionState);

  @JsonKey(ignore: true)
  @override
  $LastYearCopyWith<LastYear> get copyWith =>
      _$LastYearCopyWithImpl<LastYear>(this, _$identity);

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
  const factory LastYear({bool selectionState}) = _$LastYear;
  const LastYear._() : super._();

  @override
  bool get selectionState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $LastYearCopyWith<LastYear> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AllTransactionsCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory $AllTransactionsCopyWith(
          AllTransactions value, $Res Function(AllTransactions) then) =
      _$AllTransactionsCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState});
}

/// @nodoc
class _$AllTransactionsCopyWithImpl<$Res>
    extends _$DateFilterTypeCopyWithImpl<$Res>
    implements $AllTransactionsCopyWith<$Res> {
  _$AllTransactionsCopyWithImpl(
      AllTransactions _value, $Res Function(AllTransactions) _then)
      : super(_value, (v) => _then(v as AllTransactions));

  @override
  AllTransactions get _value => super._value as AllTransactions;

  @override
  $Res call({
    Object? selectionState = freezed,
  }) {
    return _then(AllTransactions(
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

  @JsonKey(defaultValue: false)
  @override
  final bool selectionState;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AllTransactions &&
            (identical(other.selectionState, selectionState) ||
                const DeepCollectionEquality()
                    .equals(other.selectionState, selectionState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectionState);

  @JsonKey(ignore: true)
  @override
  $AllTransactionsCopyWith<AllTransactions> get copyWith =>
      _$AllTransactionsCopyWithImpl<AllTransactions>(this, _$identity);

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
  const factory AllTransactions({bool selectionState}) = _$AllTransactions;
  const AllTransactions._() : super._();

  @override
  bool get selectionState => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $AllTransactionsCopyWith<AllTransactions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectDatesCopyWith<$Res>
    implements $DateFilterTypeCopyWith<$Res> {
  factory $SelectDatesCopyWith(
          SelectDates value, $Res Function(SelectDates) then) =
      _$SelectDatesCopyWithImpl<$Res>;
  @override
  $Res call({bool selectionState, DateTime? endDate, DateTime? startDate});
}

/// @nodoc
class _$SelectDatesCopyWithImpl<$Res> extends _$DateFilterTypeCopyWithImpl<$Res>
    implements $SelectDatesCopyWith<$Res> {
  _$SelectDatesCopyWithImpl(
      SelectDates _value, $Res Function(SelectDates) _then)
      : super(_value, (v) => _then(v as SelectDates));

  @override
  SelectDates get _value => super._value as SelectDates;

  @override
  $Res call({
    Object? selectionState = freezed,
    Object? endDate = freezed,
    Object? startDate = freezed,
  }) {
    return _then(SelectDates(
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

  @JsonKey(defaultValue: false)
  @override
  final bool selectionState;
  @override
  final DateTime? endDate;
  @override
  final DateTime? startDate;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SelectDates &&
            (identical(other.selectionState, selectionState) ||
                const DeepCollectionEquality()
                    .equals(other.selectionState, selectionState)) &&
            (identical(other.endDate, endDate) ||
                const DeepCollectionEquality()
                    .equals(other.endDate, endDate)) &&
            (identical(other.startDate, startDate) ||
                const DeepCollectionEquality()
                    .equals(other.startDate, startDate)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(selectionState) ^
      const DeepCollectionEquality().hash(endDate) ^
      const DeepCollectionEquality().hash(startDate);

  @JsonKey(ignore: true)
  @override
  $SelectDatesCopyWith<SelectDates> get copyWith =>
      _$SelectDatesCopyWithImpl<SelectDates>(this, _$identity);

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
      {bool selectionState,
      DateTime? endDate,
      DateTime? startDate}) = _$SelectDates;
  const SelectDates._() : super._();

  @override
  bool get selectionState => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $SelectDatesCopyWith<SelectDates> get copyWith =>
      throw _privateConstructorUsedError;
}
