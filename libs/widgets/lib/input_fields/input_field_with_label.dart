import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/mobile_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFieldWithLabel extends StatelessWidget {
  final String label;
  final String? errorText;
  final TextEditingController? controller;

  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final bool showCursor;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final bool enabled;
  final TextStyle labelStyle;
  final TextStyle textInputStyle;
  final TextStyle errorTextStyle;
  final InputDecoration decoration;
  final String hintText;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final Function()? onTap;
  final int maxLines;

  InputFieldWithLabel({
    this.controller,
    required this.label,
    this.onChanged,
    this.enabled = true,
    this.hintText = '',
    this.errorText,
    this.decoration = SU_text_input_border_style,
    this.labelStyle = SU_label_style,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.showCursor = true,
    this.autofocus = false,
    this.errorTextStyle = label_input_error_style,
    this.inputFormatters,
    this.textInputStyle = SU_text_input_style,
    this.onTap,
    this.textCapitalization = TextCapitalization.words,
    this.maxLines = 1,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: labelStyle),
        const SizedBox(
          height: 8,
        ),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textAlign: textAlign,
          autofocus: autofocus,
          showCursor: showCursor,
          inputFormatters: inputFormatters,
          enabled: enabled,
          style: textInputStyle,
          decoration: InputDecoration(
            filled: true,
            fillColor: enabled == true ? SU_button_text_color : SU_border_color.withOpacity(0.3),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: errorText.isEmptyOrNull
                    ? SU_border_color
                    : HS_NotificationCountColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: errorText.isEmptyOrNull
                    ? SU_border_color
                    : HS_NotificationCountColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              borderSide: BorderSide(
                color: errorText.isEmptyOrNull
                    ? SU_border_color
                    : HS_NotificationCountColor,
                width: errorText.isEmptyOrNull ? 1 : 2,
              ),
            ),
            hintText: hintText,
          ),
          onChanged: onChanged,
          textCapitalization: textCapitalization,
          onTap: onTap,
          maxLines: maxLines,
        ),
        errorText.isNotEmptyOrNull
            ? Column(
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  Text(errorText!, style: errorTextStyle),
                ],
              )
            : Container(),
      ],
    );
  }
}
