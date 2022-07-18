import 'package:flutter/material.dart';

class CrayonPaymentAddCardHolder extends StatelessWidget {
  final Function()? onTapCallback;
  final IconData? icon;
  final String text;
  final Color? color;

  const CrayonPaymentAddCardHolder({
    Key? key,
    this.onTapCallback,
    this.icon,
    required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('CrayonPaymentAddCardHolder_AddCardHolder'),
      onTap: onTapCallback,
      child: Container(
        height: 188,
        decoration: BoxDecoration(
          color: color ?? Colors.grey,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          gradient: LinearGradient(
            // This introduces a 45 degree angle.
            // Laura said it's ok, but if needed we can modify it.
            begin: Alignment(-1.0, -1),
            end: Alignment(1.0, 1),
            colors: [
              Color(0xFF969696),
              Color(0xFF676767),
            ],
          ),
        ),
        child: Row(
          key: const Key('CrayonPaymentAddCardRow_AddCardRow'),
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.add,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
