import 'package:flutter/material.dart';
import 'package:widget_library/utils/icon_utils.dart';

class CrayonPaymentSvgImageModel {
  final String iconPath;
  final EdgeInsets padding;
  final double width;
  final double? height;
  final Color? color;

  CrayonPaymentSvgImageModel({
    required this.iconPath,
    this.padding = const EdgeInsets.all(0),
    this.width = 100,
    this.height,
    this.color,
  });
}

class CrayonPaymentSvgImage extends StatelessWidget {
  final CrayonPaymentSvgImageModel crayonPaymentSvgImageModelSvgImageModel;

  CrayonPaymentSvgImage(this.crayonPaymentSvgImageModelSvgImageModel);

  @override
  Widget build(BuildContext context) => Padding(
        key: Key('CrayonPaymentSvgImage_Padding'),
        padding: crayonPaymentSvgImageModelSvgImageModel.padding,
        child: getSvg(
          crayonPaymentSvgImageModelSvgImageModel.iconPath,
          width: crayonPaymentSvgImageModelSvgImageModel.width,
          height: crayonPaymentSvgImageModelSvgImageModel.height,
          color: crayonPaymentSvgImageModelSvgImageModel.color,
        ),
      );
}
