import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final Color? fillcolor;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final double width;
  final BorderRadius borderRadius;
  final VoidCallback? onTap;
  final Color backgroundColor;

  const CardButton({
    Key? key,
    required this.text,
    required this.icon,
    this.fillcolor,
    this.padding = const EdgeInsets.all(20),
    this.margin = const EdgeInsets.symmetric(horizontal: 15),
    this.width = 120,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.onTap,
    this.backgroundColor = Colors.transparent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? color = fillcolor ?? Theme.of(context).primaryColor;
    return GestureDetector(
      key: Key('CrayonPaymentCardButton_CardButton'),
      onTap: onTap,
      child: Container(
        color: backgroundColor,
        child: Row(
          children: [
            Container(
              padding: padding,
              margin: margin,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(color: color),
                borderRadius: borderRadius,
              ),
              child: icon,
            ),
            Text(text)
          ],
        ),
      ),
    );
  }
}
