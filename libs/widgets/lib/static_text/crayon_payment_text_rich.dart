import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/icon_utils.dart';

/// The data model to configure a [Text] src
class CrayonPaymentTextDataModel {
  final TextUIDataModel? text;
  final String? iconPath;

  final EdgeInsets? padding;

  CrayonPaymentTextDataModel({
    required this.text,
    this.padding,
  }) : iconPath = null;

  /// Create a data model for icon details. Note that the colours and
  /// icon size are driven from the text styles
  CrayonPaymentTextDataModel.icon({
    required this.iconPath,
    this.padding,
  }) : text = null;
}

/// The data model to configure a [TextSpan] as part of the [CrayonPaymentTextRich] src.
class CrayonPaymentTextSpanDataModel {
  /// A callback when the [TextSpan] is clicked
  VoidCallback? onPressed;

  CrayonPaymentTextDataModel crayonPaymentTextDataModel;

  /// The color used for links, defaults to the theme's color for button links.
  Color? linkColor;

  CrayonPaymentTextSpanDataModel(this.crayonPaymentTextDataModel,
      {this.onPressed, this.linkColor});
}

/// The data model to support [CrayonPaymentTextRich]
class CrayonPaymentTextRichDataModel {
  /// A list of data_models to render the [TextSpan] src
  List<CrayonPaymentTextSpanDataModel> textSpanDataModels;

  /// Any padding the src requires.
  EdgeInsets? padding;

  CrayonPaymentTextRichDataModel(
      {required this.textSpanDataModels, this.padding});
}

/// A wrapper around [Text.rich] that can be configured via
/// a [CrayonPaymentTextRichDataModel]. The spans support styles and callback links
class CrayonPaymentTextRich extends StatelessWidget {
  final CrayonPaymentTextRichDataModel model;
  CrayonPaymentTextRich(this.model);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: Key('CrayonPaymentTextRich_Padding'),
      padding: model.padding ?? const EdgeInsets.all(0),
      child: Text.rich(
        TextSpan(
          children: model.textSpanDataModels.map<InlineSpan>(
            (textSpanDataModel) {
              GestureRecognizer? recognizer;
              if (textSpanDataModel.onPressed != null) {
                recognizer = TapGestureRecognizer()
                  ..onTap = () => textSpanDataModel.onPressed?.call();
                // Links want to be same as button links, so override the color
              }
              if (textSpanDataModel.crayonPaymentTextDataModel.text != null) {
                return TextSpan(
                  text: textSpanDataModel
                      .crayonPaymentTextDataModel.text!.text.tr,
                  style: buildTextStyle(
                    context: context,
                    variant: textSpanDataModel
                            .crayonPaymentTextDataModel.text!.styleVariant ??
                        CrayonPaymentTextStyleVariant.normal,
                  ),
                  recognizer: recognizer,
                );
              }
              return WidgetSpan(
                child: getSvg(
                  textSpanDataModel.crayonPaymentTextDataModel.iconPath!,
                  color: Theme.of(context).iconTheme.color,
                  width: Theme.of(context).iconTheme.size,
                ),
              );
            },
          ).toList(),
        ),
        key: Key('CrayonPaymentTextRich_TextRich'),
      ),
    );
  }
}
