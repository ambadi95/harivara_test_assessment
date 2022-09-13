import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/translation/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/utils/icon_utils.dart';

class AlertBottomSheetOutlineButton extends StatelessWidget {
  static const viewPath = '/alertBottomSheetOutLineButton';
  final String packageName;
  final String alertTitle;
  final String alertMessage;
  final String? alertIcon;
  final Function? onClose;
  final Function? onBottomButtonPress;
  final String? bottomButtonText;

  const AlertBottomSheetOutlineButton({
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
              const EdgeInsets.only(left: 30, right: 30, top: 47, bottom: 33),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
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
                    Image.asset(
                      '$alertIcon',
                      scale: 1.0,
                    ),
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
                    height: 25,
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
                  if (onBottomButtonPress != null && bottomButtonText!.isNotEmpty
                     )
                    SizedBox(
                      height: 32,
                    ),
                  if (onBottomButtonPress != null && bottomButtonText!.isNotEmpty
                     )
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
    return GestureDetector(
      onTap:() => onBottomButtonPress!(),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(width: 1.5,color: Colors.black)),
        child: Center(
          child: Text(
            onBottomButtonText!,
            style: HO_bottom_sheet_button_text_style,
          ),
        ),
      ),
    );
    // return CrayonPaymentDockedButton(
    //   title: onBottomButtonText!,
    //   buttonColor: const Color(0xff23211E),
    //   onPressed: () => onBottomButtonPress!(),
    // );
  }
}
