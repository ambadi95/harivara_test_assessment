import 'dart:io';

import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

@immutable
class CrayonPaymentAlertDialogue {
  static Future<bool?> showNativeAlert({
    required BuildContext context,
    String? title,
    required String content,
    required String defaultActionText,
    String? cancelActionText,
    required bool isColumn,
  }) {
    if (Platform.isAndroid) {
      return showMaterialAlert(
        context: context,
        title: title,
        content: content,
        defaultActionText: defaultActionText,
        cancelActionText: cancelActionText,
        isColumn: isColumn,
      );
    } else if (Platform.isIOS) {
      return _showCupertinoAlert(
        context: context,
        title: title,
        content: content,
        defaultActionText: defaultActionText,
        cancelActionText: cancelActionText,
        isColumn: isColumn,
      );
    } else {
      throw Exception(
        'Platform is not supported. Please only run on iOS or Android devices.',
      );
    }
  }

  /// Creates an Android material alert dialogue and displays it to the user.
  /// The dialogue will return a boolean representing whether the success action was
  /// chosen or the cancel action.
  static Future<bool?> showMaterialAlert({
    required BuildContext context,
    String? title,
    required String content,
    required String defaultActionText,
    String? cancelActionText,
    required bool isColumn,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12.0))),
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (title != null)
              Text(
                title,
                style: label_input_error_red_style,
              ),
            SizedBox(
              height: 20,
            ),
            Text(
              content,
              textAlign: TextAlign.center,
              style: label_input_error_18_style,
            ),
            SizedBox(
              height: 30,
            ),
            // TextButton(
            //   onPressed: () => Navigator.of(context).pop(false),
            //   child: Text(
            //     defaultActionText,
            //     style: SU_text_input_style,
            //   ),
            // ),
            isColumn
                ? SizedBox()
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (cancelActionText != null)
                        CrayonPaymentDockedButton(
                          width: MediaQuery.of(context).size.width * 0.3,
                          borderRadius: 8,
                          title: cancelActionText,
                          buttonColor: Colors.white,
                          borderColor: Colors.black,
                          textColor: Colors.black,
                          onPressed: () => Navigator.of(context).pop(false),
                        ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.04,
                      ),
                      CrayonPaymentDockedButton(
                        width: MediaQuery.of(context).size.width * 0.3,
                        title: defaultActionText,
                        borderRadius: 8,
                        buttonColor: PRIMARY_COLOR,
                        onPressed: () => Navigator.of(context).pop(true),
                      ),
                    ],
                  ),
          ],
        ),
        alignment: Alignment.center,
        actions: <Widget>[
          if (cancelActionText != null)
            isColumn
                ? CrayonPaymentDockedButton(
                    title: cancelActionText,
                    buttonColor: PRIMARY_COLOR,
                    onPressed: () => Navigator.of(context).pop(false),
                  )
                : SizedBox(),
          isColumn
              ? SizedBox(
                  height: 15,
                )
              : SizedBox(),
          isColumn
              ? CrayonPaymentDockedButton(
                  title: defaultActionText,
                  buttonColor: PRIMARY_COLOR,
                  onPressed: () => Navigator.of(context).pop(true),
                )
              : SizedBox(),
          isColumn
              ? SizedBox(
                  height: 20,
                )
              : SizedBox(),
        ],
      ),
    );
  }

  /// Creates an iOS Cupertino alert dialogue and displays it to the user.
  /// The dialogue will return a boolean representing whether the success action was
  /// chosen or the cancel action.
  static Future<bool?> _showCupertinoAlert(
      {required BuildContext context,
      String? title,
      required String content,
      required String defaultActionText,
      String? cancelActionText,
      required bool isColumn}) {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: title != null ? Text(title) : SizedBox(),
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelActionText),
            ),
          CupertinoDialogAction(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(defaultActionText),
          ),
        ],
      ),
    );
  }
}
