import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';

class CenteredCircularProgressBar extends StatelessWidget {
  final Color? color;
  final double strokeWidth;
  final double progressIndicatorSize;

  const CenteredCircularProgressBar({
    this.color,
    this.strokeWidth = 4.0,
    this.progressIndicatorSize = 40.0,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        key: Key('progress_bar'),
        height: progressIndicatorSize,
        width: progressIndicatorSize,
        child: CircularProgressIndicator(
          strokeWidth: strokeWidth,
          valueColor: AlwaysStoppedAnimation<Color>(
            color ?? CrayonPaymentColors.crayonPaymentGold,
          ),
        ),
      ),
    );
  }
}
