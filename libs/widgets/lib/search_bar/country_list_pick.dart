import 'package:country_list_pick/country_selection_theme.dart';
import 'package:country_list_pick/selection_list.dart';
import 'package:country_list_pick/support/code_countries_en.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:country_list_pick/support/code_countrys.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';

class CountryListPick extends StatefulWidget {
  const CountryListPick({
    Key? key,
    this.onChanged,
    this.initialSelection,
    required this.showEnglishName,
    this.showDownIcon = true,
  }) : super(key: key);

  final bool showEnglishName;
  final bool showDownIcon;
  final String? initialSelection;
  final ValueChanged<CountryCode?>? onChanged;

  @override
  _CountryListPickState createState() {
    return _CountryListPickState();
  }
}

class _CountryListPickState extends State<CountryListPick> {
  CountryCode? selectedItem;
  late final List<CountryCode> elements;

  _CountryListPickState();

  @override
  void initState() {
    elements = _getAllCountryCodes();
    _setInitialSelectedItem();
    super.initState();
  }

  List<CountryCode> _getAllCountryCodes() {
    final jsonList = widget.showEnglishName ? countriesEnglish : codes;
    return jsonList
        .map(
          (s) => CountryCode(
            name: s['name'],
            code: s['code'],
            dialCode: s['dial_code'],
            flagUri: 'flags/${s['code'].toLowerCase()}.png',
          ),
        )
        .toList();
  }

  void _setInitialSelectedItem() {
    if (widget.initialSelection != null) {
      selectedItem = elements.firstWhere(
        (e) =>
            (e.code?.toUpperCase() == widget.initialSelection!.toUpperCase()) ||
            (e.dialCode == widget.initialSelection),
        orElse: () => elements[0],
      );
    } else {
      selectedItem = elements[0];
    }
  }

  void _navigateToSelectionScreen(BuildContext context) async {
    /*
      TODO:
        - Refactor required to remove navigation in view file
        - Stop using Thirdparty UI 'SelectionList'
     */
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectionList(
          elements,
          selectedItem,
          theme: CountryTheme(isDownIcon: widget.showDownIcon),
          useSafeArea: true,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        selectedItem = result;
        widget.onChanged!(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8),
      child: GestureDetector(
        onTap: () => _navigateToSelectionScreen(context),
        child: widget.showDownIcon
            ? Row(
                children: [
                  _buildCountryIcon,
                  Icon(
                    Icons.keyboard_arrow_down,
                    color: CrayonPaymentColors.countryPickerArrowColor,
                  ),
                ],
              )
            : _buildCountryIcon,
      ),
    );
  }

  ClipRRect get _buildCountryIcon {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(CrayonPaymentDimensions.cornerRadiusFour),
      ),
      child: Image.asset(
        selectedItem!.flagUri!,
        package: 'country_list_pick',
        width: 24.0,
        height: 16.0,
      ),
    );
  }
}
