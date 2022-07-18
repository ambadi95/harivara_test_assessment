import 'package:flutter/material.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';

class CrayonPaymentImageAvatar extends StatelessWidget {
  final ImageProvider<Object> avatarImage;

  const CrayonPaymentImageAvatar({
    required this.avatarImage,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('circle_image'),
      width: CrayonPaymentDimensions.marginFourtyfour,
      height: CrayonPaymentDimensions.marginFourtyfour,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: avatarImage,
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
