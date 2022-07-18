import 'package:flutter/cupertino.dart';

class CrayonPaymentSafeScrollContainer extends SingleChildScrollView {
  CrayonPaymentSafeScrollContainer({
    required Widget child,
    required BoxConstraints constraint,
  }) : super(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraint.maxHeight),
            child: IntrinsicHeight(
              child: child,
            ),
          ),
        );
}
