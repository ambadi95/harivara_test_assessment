import 'package:flutter/material.dart';

class RoundedIconButton extends StatefulWidget {
  RoundedIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  final Icon icon;
  final void Function() onPressed;

  @override
  _RoundedIconButtonState createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: RawMaterialButton(
        onPressed: widget.onPressed,
        shape: CircleBorder(),
        child: widget.icon,
      ),
    );
  }
}
