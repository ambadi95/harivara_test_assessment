import 'package:flutter/cupertino.dart';

class ButtonOptions {
  final String text;
  final void Function() onPressed;
  final bool textButton;
  final Color buttonColor;

  ButtonOptions(
    this.buttonColor,
    this.text,
    this.onPressed, [
    this.textButton = true,
  ]);
}
