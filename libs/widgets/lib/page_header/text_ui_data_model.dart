import 'package:flutter/material.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class TextUIDataModel {
  final String text;
  final Color? color;
  final CrayonPaymentTextStyleVariant? styleVariant;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;

  const TextUIDataModel(
    this.text, {
    this.color,
    this.styleVariant,
    this.overflow = TextOverflow.clip,
    this.textAlign = TextAlign.start,
    this.maxLines,
  });

  TextUIDataModel copyWith({
    final String? text,
    final CrayonPaymentTextStyleVariant? styleVariant,
    final TextOverflow? overflow,
    final TextAlign? textAlign,
    final int? maxLines,
  }) =>
      TextUIDataModel(
        text ?? this.text,
        styleVariant: styleVariant ?? this.styleVariant,
        overflow: overflow ?? this.overflow,
        textAlign: textAlign ?? this.textAlign,
        maxLines: maxLines ?? this.maxLines,
      );
}
