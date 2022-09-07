import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/mobile_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_library/utils/icon_utils.dart';

class InputNumberDeviceFieldWithLabel extends StatelessWidget {
  final String label;
  final String? errorText;
  final TextEditingController? controller;

  final List<TextInputFormatter>? inputFormatters;
  final bool autofocus;
  final bool showCursor;
  final TextAlign textAlign;
  final TextInputType keyboardType;

  final TextStyle labelStyle;
  final TextStyle textInputStyle;
  final TextStyle errorTextStyle;
  final String hintText;
  final TextCapitalization textCapitalization;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function()? onScanIconTap;
  final int maxLines;

  InputNumberDeviceFieldWithLabel({
    this.controller,
    required this.label,
    this.onChanged,
    this.errorText,
    this.hintText = '',
    this.labelStyle = SU_label_style,
    this.keyboardType = TextInputType.text,
    this.textAlign = TextAlign.start,
    this.showCursor = true,
    this.autofocus = false,
    this.errorTextStyle = label_input_error_style,
    this.inputFormatters,
    this.textInputStyle = SU_text_input_style,
    this.onTap,
    this.onScanIconTap,
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
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          textAlign: textAlign,
          autofocus: autofocus,
          showCursor: showCursor,
          inputFormatters: inputFormatters,
          style: textInputStyle,
          decoration: InputDecoration(
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
            hintStyle: const  TextStyle(color: Color(0xFFA3A3A3), fontFamily: 'Montserrat' , fontSize:14),
            suffixIcon:
            GestureDetector(
              onTap:onScanIconTap,
              child: SizedBox(
                width: 60,
                child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: getSvg(ST_scan_icon)
                ),
              ),
            ),
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