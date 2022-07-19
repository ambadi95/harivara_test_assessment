import 'package:flutter/material.dart';

typedef DoneCallback = void Function();

typedef OnChangeCallback = void Function(
  dynamic date,
);



typedef TransactionFilteringCallBack = void Function(
  DateTime? startDate,
  DateTime? endDate,
);

typedef TapDownDetailsCallBack = void Function(TapDownDetails details);
