import 'package:flutter/material.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class TextUIDataModel {
  final String text;
  final Color? color;
  final CrayonPaymentTextStyleVariant? styleVariant;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontWeight? fontWeight;


  const TextUIDataModel(
    this.text, {
    this.color,
    this.styleVariant,
    this.overflow = TextOverflow.clip,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.fontWeight,

  });

  TextUIDataModel copyWith({
    final String? text,
    final CrayonPaymentTextStyleVariant? styleVariant,
    final TextOverflow? overflow,
    final TextAlign? textAlign,
    final int? maxLines,
    final FontWeight? fontWeight,
  }) =>
      TextUIDataModel(
        text ?? this.text,
        styleVariant: styleVariant ?? this.styleVariant,
        overflow: overflow ?? this.overflow,
        textAlign: textAlign ?? this.textAlign,
        maxLines: maxLines ?? this.maxLines,
        fontWeight: fontWeight ?? this.fontWeight,
      );
}

