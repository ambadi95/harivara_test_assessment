import 'package:country_list_pick/country_selection_theme.dart';
import 'package:country_list_pick/support/code_country.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';

class SelectionList extends StatefulWidget {
  const SelectionList(
      this.elements,
      this.initialSelection, {
        Key? key,
        this.theme,
        this.countryBuilder,
      }) : super(key: key);

  final List elements;
  final CountryCode? initialSelection;
  final CountryTheme? theme;

  final Widget Function(BuildContext context, CountryCode)? countryBuilder;

  @override
  _SelectionListState createState() => _SelectionListState();
}

class _SelectionListState extends State<SelectionList> {
  late List countries;
  final TextEditingController _controller = TextEditingController();
  ScrollController? _controllerScroll;
  var diff = 0.0;
  var posSelected = 0;
  bool isShow = true;

  @override
  void initState() {
    countries = widget.elements;
    countries.sort((a, b) {
      return a.name.toString().compareTo(b.name.toString());
    });
    _controllerScroll = ScrollController();
    super.initState();
  }

  void _sendDataBack(BuildContext context, CountryCode initialSelection) {
    Navigator.pop(context, initialSelection);
  }

  Widget _backButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: CrayonPaymentDimensions.inlineFieldsMargin,
              right: CrayonPaymentDimensions.inlineFieldsMargin,
              top: CrayonPaymentDimensions.marginFourtyEight,
            ),
            child: Text(
              'cancel'.tr,
              style: const TextStyle(
                color: Color(0xff007AFF),
                fontSize: 17,
                height: 1.5,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: CrayonPaymentDimensions.inlineFieldsMargin,
              right: CrayonPaymentDimensions.inlineFieldsMargin,
              top: CrayonPaymentDimensions.defaultMargin,
              bottom: CrayonPaymentDimensions.marginTen,
            ),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(118, 118, 128, 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: _controller,
              style: const TextStyle(fontSize: 16.0, color: Color(0xff040505)),
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                prefixStyle: const TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  size: 24,
                  color: Color(0xffA3A3A3),
                ),
                hintStyle: const TextStyle(
                  fontSize: 17.0,
                  height: 1.4,
                  color: Color(0xffA3A3A3),
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: 'lang-search'.tr,
              ),
              onChanged: _filterElements,
            ),
          ),
          Divider(height: 1, color: CrayonPaymentColors.otpUnderlineColor),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget scaffold = Scaffold(
      body: Column(
        children: [
          _backButton(context),
          Expanded(
            child: Container(
              color: Colors.white,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: <Widget>[
                      CustomScrollView(
                        controller: _controllerScroll,
                        physics: const AlwaysScrollableScrollPhysics(),
                        slivers: [
                          SliverList(
                            delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                return widget.countryBuilder != null
                                    ? widget.countryBuilder!(
                                  context,
                                  countries.elementAt(index),
                                )
                                    : getListCountry(
                                  countries.elementAt(index),
                                );
                              },
                              childCount: countries.length,
                            ),
                          )
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
    return scaffold;
  }

  Widget getListCountry(CountryCode e) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Material(
            color: Colors.transparent,
            child: ListTile(
              horizontalTitleGap: 1.0,
              dense: true,
              leading: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                child: Image.asset(
                  e.flagUri!,
                  package: 'country_list_pick',
                  width: 24.0,
                  height: 24.0,
                  fit: BoxFit.fill,
                ),
              ),
              title: Text(
                e.name!,
                style: const TextStyle(
                  color: Color(0xff676767),
                  fontSize: 18.0,
                ),
              ),
              subtitle: Text(
                e.dialCode!,
                style: const TextStyle(
                  color: Color(0xffA3A3A3),
                  fontSize: 17.0,
                ),
              ),
              onTap: () {
                _sendDataBack(context, e);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 56),
            child: const Divider(
              color: Color(0xffd1cfc9),
            ),
          )
        ],
      ),
    );
  }

  void _filterElements(String s) {
    s = s.toUpperCase();
    setState(() {
      countries = widget.elements
          .where(
            (e) =>
        e.code.contains(s) ||
            e.dialCode.contains(s) ||
            e.name.toUpperCase().contains(s),
      )
          .toList();
    });
  }
}
