import 'package:flutter/material.dart';

class ModalBottomSheet {
  final BuildContext context;

  /// Set the height to null to obtain dynamic height
  final double? height;
  final bool useRootNavigator;

  final bool isScrollControlled;
  final bool isDismissible;
  final Color backgroundColor;

  ModalBottomSheet({
    required this.context,
    this.height = 0.8,
    this.useRootNavigator = true,
    this.backgroundColor = Colors.transparent,
    this.isScrollControlled = true,
    this.isDismissible = true,
  });
}
