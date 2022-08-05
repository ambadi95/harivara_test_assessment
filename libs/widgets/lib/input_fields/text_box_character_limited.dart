import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:get/get.dart';

class TextBoxCharacterLimited extends StatefulWidget {
  final String title;
  final int maxCharacters;
  final Function(String) onTextChangedCallback;
  final TextStyle? textStyle;

  const TextBoxCharacterLimited({
    required this.title,
    required this.maxCharacters,
    required this.onTextChangedCallback,
    this.textStyle,
    Key? key,
  }) : super(key: key);

  @override
  _CharacterLimitedTextInputFieldState createState() =>
      _CharacterLimitedTextInputFieldState();
}

class _CharacterLimitedTextInputFieldState
    extends State<TextBoxCharacterLimited> {
  int _numOfTypedChars = 0;

  TextStyle? get _textStyle =>
      widget.textStyle ?? Theme.of(context).textTheme.bodyText2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTopRow,
        spaceH10(),
        _buildTextField,
      ],
    );
  }

  Widget get _buildTextField {
    return TextField(
      key: const Key('text-field'),
      inputFormatters: [LengthLimitingTextInputFormatter(widget.maxCharacters)],
      onChanged: _onTextChanged,
      decoration: InputDecoration(
        border: _buildBorder,
        focusedBorder: _buildBorder,
        hintText: 'enter-text'.tr,
        hintStyle:
            _textStyle!.copyWith(color: CrayonPaymentColors.crayonPaymentGray),
      ),
      style: _textStyle,
    );
  }

  void _onTextChanged(String value) {
    setState(() => _numOfTypedChars = value.length);
    widget.onTextChangedCallback(value);
  }

  OutlineInputBorder get _buildBorder {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide:
          BorderSide(color: CrayonPaymentColors.crayonPaymentGray, width: 1.0),
    );
  }

  Row get _buildTopRow {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildText(text: widget.title, keyValue: 'title'),
        _buildText(
          text: '${_numOfTypedChars}/${widget.maxCharacters}',
          keyValue: 'count-value',
        ),
      ],
    );
  }

  CrayonPaymentText _buildText({
    required String text,
    required String keyValue,
  }) {
    return CrayonPaymentText(
      key: Key(keyValue),
      text: TextUIDataModel(
        text,
        styleVariant: CrayonPaymentTextStyleVariant.bodyText2,
        color: CrayonPaymentColors.crayonPaymentDarkGray,
      ),
    );
  }
}
