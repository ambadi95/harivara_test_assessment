import 'package:flutter/material.dart';

class ReusableTitle extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;

  const ReusableTitle({
    Key? key,
    required this.text,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: Key('ReusableTitle'),
      style: textStyle ?? Theme.of(context).textTheme.headline5,
    );
  }
}
