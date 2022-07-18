import 'package:flutter/material.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class CrayonPaymentIconAvatar extends StatelessWidget {
  final String _title;
  final Color _baseColor;
  final Color _textColor;
  final Widget? displayIconTile;

  const CrayonPaymentIconAvatar(
    this._title,
    this._baseColor,
    this._textColor, {
    this.displayIconTile,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: const Key('circle_image'),
      alignment: Alignment.center,
      width: CrayonPaymentDimensions.marginFourtyfour,
      height: CrayonPaymentDimensions.marginFourtyfour,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _baseColor,
      ),
      child: displayIconTile ??
          CrayonPaymentText(
            text: TextUIDataModel(
              _title.substring(0, 1).toUpperCase(),
              color: _textColor,
              styleVariant: CrayonPaymentTextStyleVariant.headline4,
            ),
          ),
    );
  }
}
