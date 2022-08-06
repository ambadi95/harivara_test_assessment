import 'package:flutter/material.dart';
import 'package:widget_library/padding.dart';

class InfoBubbleAttributes {
  final CrayonPaymentPadding bubblePadding;
  final IconAttributes? leadingIconAttributes;
  final IconAttributes? trailingIconAttributes;

  final Color backgroundColor;
  final List<String> texts;

  InfoBubbleAttributes({
    this.leadingIconAttributes,
    this.trailingIconAttributes,
    this.bubblePadding = const CrayonPaymentPadding(left: 30, right: 30),
    required this.backgroundColor,
    required this.texts,
  });
}

class IconAttributes {
  final String iconName;
  final CrayonPaymentPadding iconSizeWithPadding;
  final VoidCallback? onTap;

  IconAttributes({
    required this.iconName,
    this.iconSizeWithPadding =
        const CrayonPaymentPadding(width: 40, height: 40),
    this.onTap,
  });
}
