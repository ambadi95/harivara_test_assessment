import 'package:core/typedefs/callback_typedefs.dart';
import 'package:shared_data_models/date_filter/date_filter_type.dart';

class FilterDateButtonOptions {
  final String text;
  final DateFilterType filterType;
  final DateFilterType selectedFilterType;
  final TransactionsFilterTypeCallBack onPressed;

  FilterDateButtonOptions(
    this.text,
    this.filterType,
    this.selectedFilterType,
    this.onPressed,
  );
}
