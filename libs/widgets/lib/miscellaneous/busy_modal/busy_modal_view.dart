import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';

class CrayonPaymentBusyView extends StatelessWidget {
  static const viewPath = 'src/busy_modal';

  @override
  Widget build(BuildContext context) {
    return Builder(
      key: Key('CrayonPaymentBusyViewBuilder'),
      builder: (context) {
        return Center(
          key: Key('CrayonPaymentBusyViewCenter'),
          child: Container(
            key: Key('CrayonPaymentBusyViewContainer'),
            width: 140.0,
            height: 140.0,
            child: CenteredCircularProgressBar(
              color: CrayonPaymentColors.crayonPaymentGold,
            ),
          ),
        );
      },
    );
  }
}
