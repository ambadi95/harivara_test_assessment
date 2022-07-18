import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

extension StringExtentions on String {
  String get iconPath => split(':').first;

  String? get iconPackage => split(':').last;

  SvgPicture get toSvg {
    final list = split(':');
    if (list.length > 1) {
      return SvgPicture.asset(
        list[1],
        package: list[0],
      );
    }
    return SvgPicture.asset(list.first);
  }

  SvgPicture getSvg({Color? color, Size? size}) {
    final list = split(':');
    if (list.length > 1) {
      return SvgPicture.asset(
        list[1],
        key: Key('getSvgSvgPicture'),
        package: list[0],
        color: color,
        width: size?.width,
        height: size?.height,
      );
    }
    return SvgPicture.asset(list.first, key: Key('getSvgFirstSvgPicture'),);
  }
}
