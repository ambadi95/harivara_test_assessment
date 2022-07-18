import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:widget_library/info_bubble/info_bubble_widget.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';

const defaultLeftIcon = 'app_mobile_login:assets/images/ic_success.svg';
const defaultToastTheme = 'toast';

OverlaySupportEntry showToast({
  String? title,
  String? message,
  String leftIcon = defaultLeftIcon,
  bool closeButton = true,
  Duration duration = Duration.zero,
  String theme = defaultToastTheme,
}) {
  return showOverlayNotification(
    (context) {
      return Theme(
        data: CrayonPaymentTheme().themeFor(theme),
        child: InfoBubbleWidgetOverlayWrapper(
          message: message,
          title: title,
          iconLeftPath: leftIcon,
          closeButton: closeButton,
        ),
      );
    },
    duration: duration,
  );
}
