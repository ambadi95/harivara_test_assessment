import 'package:flutter/material.dart';
import 'package:widget_library/progress_bar/crayon_payment_progress_bar.dart';
import 'package:config/Colors.dart' as config_color;

class OnBoardingProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;

  const OnBoardingProgressBar({
    Key? key,
    required this.totalSteps,
    required this.currentStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var percentageInProgress = currentStep / totalSteps;
    var percentageCompleted = (currentStep - 1) / totalSteps;
    if (currentStep > totalSteps) {
      percentageInProgress = 1.0;
      percentageCompleted = 1.0;
    }
    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CrayonPaymentProgressBar(
                  value: percentageInProgress,
                  height: 4,
                  valueColor: config_color.PRIMARY_COLOR,
                  backgroundColor: Color(0xffEFEEE9),
                ),
              ),
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: CrayonPaymentProgressBar(
                  value: percentageCompleted,
                  height: 4,
                  valueColor: currentStep > totalSteps
                      ? Color(0xff006845)
                      : Color(0xff000000),
                  backgroundColor: Color(0x01ffffff),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 2),
        Icon(
          Icons.check,
          color:
              currentStep > totalSteps ? Color(0xff006845) : Color(0xffEFEEE9),
        ),
        const SizedBox(width: 4),
        Text(
          '${currentStep > 4 ? 4 : currentStep}/$totalSteps',
          style: const TextStyle(
            color: Color(0xff413E3C),
            fontWeight: FontWeight.w500,
            fontSize: 16,
            height: 1.5,
          ),
        )
      ],
    );
  }
}
