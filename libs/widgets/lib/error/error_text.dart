import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorText extends StatelessWidget {
  final String? _errorText;

  const ErrorText(this._errorText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_errorText == null) {
      return const SizedBox(
        key: Key('sizedBox'),
      );
    } else {
      return Text(
        (_errorText)!.tr,
        textAlign: TextAlign.center,
        key: const Key('errorText'),
        style:
            Theme.of(context).textTheme.bodyText2!.copyWith(color: Colors.red),
      );
    }
  }
}
