import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_library/formatter/spaced_text_input_formatter.dart';

class DefaultInputField extends StatelessWidget {
  static const double _hintBottomPadding = 8;
  static const double _height = 56;
  static const double _errorTextSize = 10;
  static const Color _hintColor = Color(0xFF565451);
  static const double _textSize = 16;
  static const Color _textColor = Color(0xFF040505);
  static const double _horizontalPadding = 15;
  static const double _verticalPadding = 10;
  static const Color _errorBorderColor = Color(0xFFE03C31);
  static const Color _borderColor = Color(0xFFBAB8B2);
  static const Color _focusedBorderColor = Color(0xFFDAAA00);
  static const String _identifier = 'DefaultInputField';
  final double height;
  final Color labelColor;
  final double textSize;
  final double errorTextSize;
  final Color textColor;
  final double contentHorizontalPadding;
  final double contentVerticalPadding;
  final Color errorBorderColor;
  final Color borderColor;
  final Color focusedBorderColor;
  final Widget? suffixWidget;
  final Widget? suffixHintWidget;
  final Widget? suffixContentWidget;
  final String label;
  final String? hint;
  final TextEditingController? editingController;
  final List<TextInputFormatter>? inputFormatters;
  final String? error;
  final TextInputType? textInputType;
  final FocusNode? focusNode;
  final bool obscureText;
  final Key? widgetKey;
  final bool forcedFocus;

  const DefaultInputField({
    required this.label,
    this.error,
    this.editingController,
    this.suffixWidget,
    this.suffixHintWidget,
    this.suffixContentWidget,
    this.inputFormatters,
    this.textInputType,
    this.focusNode,
    this.obscureText = false,
    this.widgetKey,
    double? height,
    Color? hintTextColor,
    double? textSize,
    Color? textFontColor,
    double? contentHorizontalPadding,
    double? contentVerticalPadding,
    Color? errorBorderColor,
    Color? defaultBorderColor,
    Color? focusedBorderColor,
    double? errorTextSize,
    bool? forcedFocus,
    this.hint,
  })  : height = height ?? _height,
        labelColor = hintTextColor ?? _hintColor,
        textSize = textSize ?? _textSize,
        textColor = textFontColor ?? _textColor,
        contentHorizontalPadding =
            contentHorizontalPadding ?? _horizontalPadding,
        contentVerticalPadding = contentVerticalPadding ?? _verticalPadding,
        errorBorderColor = errorBorderColor ?? _errorBorderColor,
        borderColor = defaultBorderColor ?? _borderColor,
        errorTextSize = errorTextSize ?? _errorTextSize,
        focusedBorderColor = focusedBorderColor ?? _focusedBorderColor,
        forcedFocus = forcedFocus ?? false;

  factory DefaultInputField.cardInputField(
    String hint, {
    Widget? trailingWidget,
    TextEditingController? controller,
    String? error,
    Key? key,
    LengthLimitingTextInputFormatter? lengthFormatter,
    FocusNode? focusNode,
  }) {
    List<TextInputFormatter> formatters = [
      SpacedTextInputFormatter(divider: '-', chunk: 4),
      FilteringTextInputFormatter.allow(
        RegExp(r'[0-9]'),
        replacementString: '-',
      ),
      // 16 + 3 spaces
    ];
    formatters.add(lengthFormatter ?? LengthLimitingTextInputFormatter(19));
    return DefaultInputField(
      label: hint,
      error: error,
      focusNode: focusNode,
      suffixWidget: trailingWidget,
      editingController: controller,
      textInputType: TextInputType.number,
      widgetKey: key,
      inputFormatters: formatters,
    );
  }

  factory DefaultInputField.cvvInputField(
    String label,
    bool obscureText,
    FocusNode focusNode, {
    String? hint,
    Widget? trailingHintWidget,
    TextEditingController? controller,
    String? error,
    Key? key,
    LengthLimitingTextInputFormatter? lengthFormatter,
  }) {
    List<TextInputFormatter> formatters = [
      SpacedTextInputFormatter(),
      FilteringTextInputFormatter.allow(
        RegExp(r'[0-9]'),
        replacementString: ' ',
      ),
    ];
    formatters.add(lengthFormatter ?? LengthLimitingTextInputFormatter(4));
    return DefaultInputField(
      label: label,
      hint: hint,
      error: error,
      focusNode: focusNode,
      widgetKey: key,
      obscureText: obscureText,
      suffixHintWidget: trailingHintWidget,
      editingController: controller,
      textInputType: TextInputType.number,
      inputFormatters: formatters,
    );
  }

  factory DefaultInputField.nicknameInputField(
    String hint, {
    TextEditingController? controller,
    FocusNode? focusNode,
    Widget? labelSuffix,
    String? error,
    Key? key,
  }) {
    return DefaultInputField(
      label: hint,
      focusNode: focusNode,
      suffixHintWidget: labelSuffix,
      widgetKey: key,
      editingController: controller,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
          RegExp('[a-zA-Z0-9\u0621-\u064a-\ ]'),
          replacementString: '',
        ),
        LengthLimitingTextInputFormatter(15),
        UpperCaseTextFormatter(),
      ],
      error: error,
    );
  }

  factory DefaultInputField.expirationDate(
    String label,
    String hint,
    Widget suffixContentWidget, {
    TextEditingController? controller,
    String? error,
    bool? forceFocus,
    Key? key,
  }) {
    return DefaultInputField(
      label: label,
      hint: hint,
      error: error,
      forcedFocus: forceFocus,
      suffixContentWidget: suffixContentWidget,
      editingController: controller,
      widgetKey: key,
      textInputType: TextInputType.number,
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget labelWidget = Text(
      label,
      overflow: TextOverflow.ellipsis,
      key: const Key('${_identifier}_hint'),
      style: Theme.of(context).textTheme.headline4?.copyWith(color: labelColor),
    );

    return Column(
      key: widgetKey,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: _hintBottomPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(child: labelWidget),
              if (suffixHintWidget != null)
                Container(
                  alignment: Alignment.centerLeft,
                  key: const Key('${_identifier}_accessory_hint_container'),
                  child: suffixHintWidget,
                )
            ],
          ),
        ),
        Container(
          height: height,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  textCapitalization: TextCapitalization.words,
                  obscureText: obscureText,
                  focusNode: focusNode,
                  cursorColor: Colors.black,
                  key: const Key('${_identifier}_text_field'),
                  keyboardType: textInputType,
                  controller: editingController,
                  inputFormatters: inputFormatters,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: textSize, color: textColor),
                  decoration: InputDecoration(
                    errorText: error,
                    suffixIconConstraints:
                        BoxConstraints(maxWidth: 30, maxHeight: 20),
                    hintText: hint,
                    suffixIcon: _suffixIcon(),
                    errorStyle: TextStyle(height: 0, color: Colors.transparent),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: contentHorizontalPadding,
                      vertical: contentVerticalPadding,
                    ),
                    focusedErrorBorder: _focusedErrorBorder,
                    errorBorder: _focusedErrorBorder,
                    disabledBorder: _defaultBorder,
                    enabledBorder:
                        forcedFocus ? _focusedBorder : _defaultBorder,
                    focusedBorder: _focusedBorder,
                  ),
                ),
              ),
              if (suffixWidget != null)
                Container(
                  width: 30,
                  alignment: Alignment.centerLeft,
                  key: const Key('${_identifier}_accessory_container'),
                  margin: EdgeInsetsDirectional.only(start: 12),
                  child: suffixWidget,
                )
            ],
          ),
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: error != null,
          child: Text(
            error ?? '',
            key: const Key('${_identifier}_error_text'),
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(fontSize: errorTextSize, color: _errorBorderColor),
          ),
        )
      ],
    );
  }

  Container? _suffixIcon() {
    if (suffixContentWidget != null) {
      return Container(
        height: 30,
        alignment: Alignment.center,
        child: suffixContentWidget,
      );
    }
    return null;
  }

  InputBorder get _focusedErrorBorder => OutlineInputBorder(
        borderSide: BorderSide(
          color: errorBorderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(8),
      );

  InputBorder get _defaultBorder => OutlineInputBorder(
        borderSide: BorderSide(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(8),
      );

  InputBorder get _focusedBorder => OutlineInputBorder(
        borderSide: BorderSide(color: focusedBorderColor, width: 2),
        borderRadius: BorderRadius.circular(8),
      );
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text.trimLeft();
    if (text.isEmpty) {
      return TextEditingValue(
        text: '',
        selection: TextSelection.collapsed(offset: 0),
      );
    }
    text = text.split(' ').map((e) {
      if (e.length > 1) {
        return '${e.substring(0, 1).toUpperCase()}${e.substring(1).toLowerCase()}';
      }
      return e.toUpperCase();
    }).join(' ');
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
