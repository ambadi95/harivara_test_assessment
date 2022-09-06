import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/search_bar/search_bar_widget_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/debouncer.dart';
import 'package:widget_library/utils/icon_utils.dart';

class SearchBarWidget extends StatefulWidget {
  final void Function(String)? onSearch;
  final void Function()? onEditingComplete;
  final void Function(String)? onTextChanged;
  final List<TextInputFormatter>? inputFormatters;
  final int _debounceDuration;
  final SearchBarAttributes _attributes;
  final TextInputType? textInputType;
  final String? onErrorInputText;

  SearchBarWidget({
    this.onSearch,
    Key? key,
    this.onTextChanged,
    this.onEditingComplete,
    int? debounceDuration,
    SearchBarAttributes? attributes,
    this.textInputType,
    this.inputFormatters,
    this.onErrorInputText,
  })  : _debounceDuration = debounceDuration ?? 300,
        _attributes = attributes ?? SearchBarAttributes(),
        super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState(
        debouncer: Debouncer(
          delay: Duration(milliseconds: _debounceDuration),
        ),
      );
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _textFieldController = TextEditingController();
  final Debouncer debouncer;

  _SearchBarWidgetState({required this.debouncer});

  SearchBarAppearance get _appearance => widget._attributes.appearance;

  @override
  Widget build(BuildContext context) {
    if (widget.onErrorInputText != null) {
      _textFieldController.text = widget.onErrorInputText!;
    }
    return Container(
      key: Key('SearchBarWidget_Container'),
      height: _appearance.height,
      child: TextField(
        inputFormatters: widget.inputFormatters,
        key: Key('SearchBarWidget_TextField'),
        style: (widget._attributes.dataModel.variant != null)
            ? buildTextStyle(
                context: context,
                variant: widget._attributes.dataModel.variant!,
              )
            : Theme.of(context).textTheme.bodyText2,
        decoration: _buildInputDecoration,
        onChanged: (predicate) {
          debouncer.run(() {
            widget.onTextChanged?.call(predicate);
          });
        },
        onEditingComplete: widget.onEditingComplete,
        cursorColor: CrayonPaymentColors.crayonPaymentGold,
        controller: _textFieldController,
        keyboardType: widget.textInputType ?? TextInputType.name,
        onSubmitted: widget.onSearch,
      ),
    );
  }

  InputDecoration get _buildInputDecoration {
    return InputDecoration(
      contentPadding: EdgeInsets.all(_appearance.contentPadding),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      filled: true,
      fillColor: Colors.white,
      enabledBorder: _buildOutlineInputBorder,
      focusedBorder: _buildOutlineInputBorder,
      border: _buildOutlineInputBorder,
      labelText: widget._attributes.dataModel.hint?.tr ?? 'search'.tr,
      labelStyle: Theme.of(context).inputDecorationTheme.hintStyle,
      prefixIcon: widget._attributes.appearance.prefixIcon,
      suffixIcon: widget._attributes.appearance.suffixIcon == null
          ? null
          : IconButton(
              key: Key('SearchBarWidget_IconButton'),
              onPressed: _callOnSearch,
              icon: getSvg(
                _appearance.suffixIcon!,
                width: (_appearance.iconWidth ?? 22),
              ),
            ),
    );
  }

  void _callOnSearch() {
    widget.onSearch?.call(_textFieldController.text);
  }

  OutlineInputBorder get _buildOutlineInputBorder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(
          _appearance.cornerRadius,
        ),
      ),
      borderSide:
          BorderSide(color: CrayonPaymentColors.crayonPaymentGray, width: 1.0),
    );
  }
}
