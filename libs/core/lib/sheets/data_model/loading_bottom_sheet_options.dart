import 'package:core/sheets/data_model/button_options.dart';
import 'package:flutter/material.dart';

class LoadingBottomSheetOptions extends ButtonOptions {
  LoadingBottomSheetOptions(
    String text,
    Color buttonColor,
    void Function() onPressed, [
    bool textButton = true,
  ]) : super(
          buttonColor,
          text,
          onPressed,
          textButton,
        );
}
