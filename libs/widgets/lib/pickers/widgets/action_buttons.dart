import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:get/get.dart';

const EdgeInsets _buttonPadding = EdgeInsets.only(
  top: 20,
);

class CancelButton extends StatelessWidget {
  final VoidCallback? onCancelCallback;
  final String identifier;

  CancelButton({required this.identifier, this.onCancelCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key('${identifier}_Cancel'),
      onTap: () => onCancelCallback?.call(),
      child: Padding(
        padding: _buttonPadding,
        child: Text(
          'cancel-button'.tr,
          key: Key('${identifier}_Cancel_Text'),
          style: Theme.of(context)
              .textTheme
              .button
              ?.copyWith(color: CrayonPaymentColors.crayonPaymentBlack),
        ),
      ),
    );
  }
}

class DoneButton extends StatelessWidget {
  final VoidCallback? onDoneCallback;
  final String identifier;

  DoneButton({required this.identifier, this.onDoneCallback});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: Key('${identifier}_Done'),
      onTap: () => onDoneCallback?.call(),
      child: Padding(
        padding: _buttonPadding,
        child: Text(
          'done-button'.tr,
          key: Key('${identifier}_Done_Text'),
          style: Theme.of(context)
              .textTheme
              .button
              ?.copyWith(color: CrayonPaymentColors.crayonPaymentGold),
        ),
      ),
    );
  }
}
