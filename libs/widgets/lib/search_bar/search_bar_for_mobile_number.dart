import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'country_list_pick.dart';
import 'package:get/get.dart';

import 'search_bar_widget.dart';
import 'search_bar_widget_model.dart';

class SearchBarForMobileNumber extends StatefulWidget {
  final Function(String)? onTextChanged;
  final Function(String)? onCountryCodeChanged;
  final int? debounceDuration;
  final String? onErrorInputText;

  const SearchBarForMobileNumber({
    this.onTextChanged,
    this.onCountryCodeChanged,
    this.debounceDuration,
    this.onErrorInputText,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBarForMobileNumber> createState() =>
      _SearchBarForMobileNumberState();
}

class _SearchBarForMobileNumberState extends State<SearchBarForMobileNumber> {
  final TextEditingController _mobileNumberController = TextEditingController();
  String _selectedCountryCode = '+966';
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _mobileNumberController.dispose();
    _focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SearchBarWidget(
      key: const Key('search-bar-for-mobile'),
      debounceDuration: widget.debounceDuration,
      textInputType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      onErrorInputText: widget.onErrorInputText,
      onTextChanged: (value) {
        widget.onTextChanged!(value != '' ? _selectedCountryCode + value : '');
      },
      attributes: SearchBarAttributes(
        dataModel: SearchBarDataModel(
          hint: 'enter-mobile-number'.tr,
          variant: _textStyle,
        ),
        appearance: _buildSearchBarAppearance(context),
      ),
    );
  }

  SearchBarAppearance _buildSearchBarAppearance(BuildContext context) {
    return SearchBarAppearance(
      prefixIcon: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          _countryCodePicker(context),
          CrayonPaymentText(
            edgeInsets: EdgeInsets.only(bottom: 2),
            text: TextUIDataModel(
              _selectedCountryCode,
              styleVariant: _textStyle,
            ),
          ),
          SizedBox(width: 4)
        ],
      ),
      cornerRadius: 8,
    );
  }

  CrayonPaymentTextStyleVariant get _textStyle =>
      CrayonPaymentTextStyleVariant.bodyText2;

  Widget _countryCodePicker(BuildContext context) {
    return CountryListPick(
      key: const Key('country_List_Pick'),
      showEnglishName: true,
      initialSelection: _selectedCountryCode,
      onChanged: (countryCode) {
        if (countryCode != null) {
          setState(() {
            _selectedCountryCode = countryCode.dialCode!;
          });
          widget.onCountryCodeChanged?.call(_selectedCountryCode);
        }
      },
    );
  }
}
