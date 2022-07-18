import 'package:core/translation/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/utils/icon_utils.dart';

class AlertBottomSheet extends StatelessWidget {
  static const viewPath = '/alertBottomSheet';
  final String packageName;
  final String alertTitle;
  final String alertMessage;
  final String? alertIcon;
  final Function? onClose;
  final Function? onBottomButtonPress;
  final String? bottomButtonText;

  const AlertBottomSheet({
    Key? key,
    required this.packageName,
    required this.alertTitle,
    required this.alertMessage,
    this.alertIcon,
    this.onClose,
    this.onBottomButtonPress,
    this.bottomButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: double.infinity,
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 47, bottom: 68),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  if (alertIcon != null)
                    getSvg('$packageName:assets/icons/$alertIcon.svg'),
                  SizedBox(
                    height: 36,
                  ),
                  Text(
                    alertTitle.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      height: 1.15,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    alertMessage.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.15,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff676767),
                    ),
                  ),
                  if (onBottomButtonPress != null &&
                      bottomButtonText!.isNotEmpty)
                    SizedBox(
                      height: 32,
                    ),
                  if (onBottomButtonPress != null &&
                      bottomButtonText!.isNotEmpty)
                    _requestOtpButton(context, bottomButtonText)
                ],
              ),
              if (onClose != null)
                Align(
                  // ignore: sort_child_properties_last
                  child: GestureDetector(
                    onTap: () => onClose!(),
                    child: Icon(Icons.close),
                  ),
                  alignment: Alignment.topRight,
                )
            ],
          ),
        ),
      ],
    );
  }

  Widget _requestOtpButton(BuildContext context, String? onBottomButtonText) {
    return CrayonPaymentDockedButton(
      title: AppLocalizations.of(context)!.translate(onBottomButtonText!),
      buttonColor: const Color(0xff23211E),
      onPressed: () => onBottomButtonPress!(),
    );
  }
}
