import 'package:flutter/material.dart';

class CrayonPaymentBackButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? color;
  final IconData? customIcon;
  final double? size;

  const CrayonPaymentBackButton({
    Key? key,
    this.onPressed,
    this.color,
    this.customIcon,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.0,
      height: 58.0,
      child: GestureDetector(
        key: Key('BackArrowButton_IconButton'),
        onTap: onPressed ??
            () {
              Navigator.of(context).pop();
            },
        child: Container(
          child: Icon(
            customIcon ?? Icons.arrow_back,
            key: Key('BackArrowButtonIcon'),
            color: color ?? Theme.of(context).secondaryHeaderColor,
            size: size,
          ),
        ),
      ),
    );
  }
}
