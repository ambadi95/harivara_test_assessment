import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

import 'crayon_payment_list_tile.dart';

class CrayonPaymentListTileWithHighlightText extends CrayonPaymentListTile {
  CrayonPaymentListTileWithHighlightText(
    String title,
    String subtitle, {
    Widget? displayIcon,
  }) : super(
          CrayonPaymentText(
            text: TextUIDataModel(
              title,
              styleVariant: CrayonPaymentTextStyleVariant.headline4,
              color: CrayonPaymentColors.crayonPaymentBlack,
            ),
            key: Key('title'),
          ),
          CrayonPaymentText(
            text: TextUIDataModel(
              subtitle,
              styleVariant: CrayonPaymentTextStyleVariant.headline5,
              color: CrayonPaymentColors.crayonPaymentDarkGray,
            ),
            key: Key('subtitle'),
          ),
          displayIcon: displayIcon,
        );
}
