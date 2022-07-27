import 'package:flutter/material.dart';
import 'package:shared_data_models/date_filter/date_filter_type.dart';

typedef DoneCallback = void Function();

typedef OnChangeCallback = void Function(
  dynamic date,
);

typedef TransactionsFilterTypeCallBack = void Function(
    DateFilterType filterType,
    );

typedef FilterTransactionsCallBack = void Function(
    List<dynamic> filters,
    );

typedef TransactionFilteringCallBack = void Function(
  DateTime? startDate,
  DateTime? endDate,
);

typedef TapDownDetailsCallBack = void Function(TapDownDetails details);
