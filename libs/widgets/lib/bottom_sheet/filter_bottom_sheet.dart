import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/translation/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/utils/icon_utils.dart';

class FilterBottomSheet extends StatelessWidget {
  static const viewPath = '/filterBottomSheet';
  final String packageName;
  final String alertTitle;
  final String? alertIcon;
  final Function? onClose;
  final Function? onBottomButtonPress;
  final String? bottomButtonText;
  final String? additionalText;
  final List<Widget>? widget;

  const FilterBottomSheet({
    Key? key,
    required this.packageName,
    required this.alertTitle,
    this.alertIcon,
    this.onClose,
    this.onBottomButtonPress,
    this.bottomButtonText,
    this.additionalText,
    this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Wrap(
      children: [
        Container(
          width: double.infinity,
          height: height * 3,
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
                  Text(
                    alertTitle.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      height: 1.15,
                      letterSpacing: 0.15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Column(
                    children: widget!,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  if (additionalText != null)
                    Text(
                    '$additionalText',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.0,
                      height: 1.15,
                      letterSpacing: 0.15,
                      fontFamily: 'Montserrat',
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
            color: SU_button_color,
            borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Text(
            onBottomButtonText!.tr,
            style: SU_button_text_style,
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
