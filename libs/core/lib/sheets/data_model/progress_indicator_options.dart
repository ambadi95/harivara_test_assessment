import 'package:flutter/material.dart';

class ProgressIndicatorOptions {
  final Color progressIconColor;
  final double strokeWidth;
  final double progressIndicatorSize;

  const ProgressIndicatorOptions({
    this.strokeWidth = 4.0,
    this.progressIconColor = Colors.black,
    this.progressIndicatorSize = 40.0,
  });
}
