import 'package:core/typedefs/callback_typedefs.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class MultiSelectionCategory {
  /// [supportsMultiSelection] allows multi selection in the same category
  final bool supportsMultiSelection;

  /// [category] can be a certain category of elements that encapsulates
  /// a list of those elements called `filters`.
  /// Each filter should provide a `selectionState` member.
  /// In order to support dynamic categories, the naming should be the same
  /// e.g. category.filters and filter.selectionState
  final Category category;
  final Key? key;

  MultiSelectionCategory({
    this.supportsMultiSelection = true,
    required this.category,
    this.key,
  });
}

class MultiSelectionButton {
  final String text;
  final FilterTransactionsCallBack onPressed;
  final bool textButton;

  MultiSelectionButton(
    this.text,
    this.onPressed, [
    this.textButton = true,
  ]);
}

abstract class Filter {
  bool get selectionState;

  const Filter();

  Filter withNewSelectionState({bool? selectionState});
}

abstract class Category {
  const Category();

  List<Filter> get filters;

  Category withNewFilters({List<Filter>? filters});
}
