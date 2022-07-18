import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CrayonPaymentPadding {
  final double left;
  final double right;
  final double top;
  final double bottom;
  final double? width;
  final double height;

  const CrayonPaymentPadding({
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.width,
    this.height = 44,
  });

  const CrayonPaymentPadding.all(double padding)
      : left = padding,
        right = padding,
        top = padding,
        bottom = padding,
        width = 44,
        height = 44;

  EdgeInsets toEdgeInsets() {
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }
}
