import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BorderedButton extends StatelessWidget {
  @override
  final Key? key;
  final VoidCallback? onTap;
  final String title;
  final Color? foreGroundColor;
  final EdgeInsets padding;
  final double height;
  final double cornerRadius;
  final TextStyle? buttonTextStyle;

  BorderedButton({
    this.key,
    this.title = '',
    this.foreGroundColor,
    this.onTap,
    this.padding = const EdgeInsets.all(8.0),
    this.height = 48.0,
    this.cornerRadius = 24.0,
    this.buttonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    Color? color = foreGroundColor ?? Theme.of(context).primaryColor;
    return InkWell(
      key: Key('BorderedButton_InkWell'),
      onTap: onTap,
      child: Container(
        key: Key('BorderedButton_Container'),
        height: height,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.all(
            Radius.circular(cornerRadius),
          ),
        ),
        child: Padding(
          key: Key('BorderedButton_Padding'),
          padding: padding,
          child: Text(
            title.tr,
            key: Key('BorderedButton_Text'),
            textAlign: TextAlign.center,
            style: buttonTextStyle ?? TextStyle(color: color),
          ),
        ),
      ),
    );
  }
}
