import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

@immutable
class CrayonPaymentAlertDialogue {
  static Future<bool?> showNativeAlert({
    required BuildContext context,
    required String title,
    required String content,
    required String defaultActionText,
    String? cancelActionText,
  }) {
    if (Platform.isAndroid) {
      return _showMaterialAlert(
        context: context,
        title: title,
        content: content,
        defaultActionText: defaultActionText,
        cancelActionText: cancelActionText,
      );
    } else if (Platform.isIOS) {
      return _showCupertinoAlert(
        context: context,
        title: title,
        content: content,
        defaultActionText: defaultActionText,
        cancelActionText: cancelActionText,
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
  static Future<bool?> _showMaterialAlert({
    required BuildContext context,
    required String title,
    required String content,
    required String defaultActionText,
    String? cancelActionText,
  }) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          if (cancelActionText != null)
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelActionText),
            ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(defaultActionText),
          ),
        ],
      ),
    );
  }

  /// Creates an iOS Cupertino alert dialogue and displays it to the user.
  /// The dialogue will return a boolean representing whether the success action was
  /// chosen or the cancel action.
  static Future<bool?> _showCupertinoAlert({
    required BuildContext context,
    required String title,
    required String content,
    required String defaultActionText,
    String? cancelActionText,
  }) {
    return showCupertinoDialog<bool>(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(title),
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
