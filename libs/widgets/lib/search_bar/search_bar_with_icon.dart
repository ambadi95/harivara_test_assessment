import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';

import 'search_bar_widget.dart';
import 'search_bar_widget_model.dart';

class SearchBarWithIcon extends StatelessWidget {
  final Function(String)? onTextChanged;
  final Function(String)? onSearch;
  final int? debounceDuration;
  final String? hint;
  final String? onErrorInputText;

  SearchBarWithIcon({
    this.onTextChanged,
    this.onSearch,
    this.debounceDuration,
    this.hint,
    this.onErrorInputText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchBarWidget(
      key: const Key('search-bar-with-icon'),
      debounceDuration: debounceDuration,
      onSearch: onSearch,
      onTextChanged: onTextChanged,
      onErrorInputText: onErrorInputText,
      attributes: SearchBarAttributes(
        dataModel: hint != null ? SearchBarDataModel(hint: hint) : null,
        appearance: SearchBarAppearance(
          prefixIcon: Icon(
            Icons.search,
            key: Key('Icon-Widget'),
            color: CrayonPaymentColors.crayonPaymentDarkGray,
          ),
          cornerRadius: 8,
        ),
      ),
    );
  }
}
