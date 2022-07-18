import 'package:flutter/material.dart';
import 'package:shared_data_models/transaction/transactions_filter_type.dart';

typedef DoneCallback = void Function();

typedef OnChangeCallback = void Function(
  dynamic date,
);

typedef TransactionsFilterTypeCallBack = void Function(
  TransactionsFilterType filterType,
);

typedef TransactionFilteringCallBack = void Function(
  DateTime? startDate,
  DateTime? endDate,
);

typedef TapDownDetailsCallBack = void Function(TapDownDetails details);
