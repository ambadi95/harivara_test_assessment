import 'package:flutter/material.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/icon_utils.dart';
import 'page_header_text_under_icon_widget_attributes.dart';

class CrayonPaymentPageHeaderTextUnderIconRowWidget extends StatelessWidget {
  final CrayonPaymentPageHeaderTextUnderIconWidgetAttributes attributes;

  const CrayonPaymentPageHeaderTextUnderIconRowWidget({
    Key? key,
    required this.attributes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('CrayonPaymentPageHeaderTextUnderIconRowWidget_Container'),
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.only(
        top: attributes.headerTopPadding,
        left: attributes.leftMargin,
      ),
      child: Row(
        key: Key('CrayonPaymentPageHeaderTextUnderIconWidget_Row'),
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: bodyWidgetsList(context),
      ),
    );
  }

  List<Widget> bodyWidgetsList(BuildContext context) {
    var widgetsList = <Widget>[];

    widgetsList.add(
      SizedBox(
        key: Key('CrayonPaymentPageHeaderTextUnderIconWidget_bodyWidgetsList_SizedBox'),
        height: attributes.headerTopPadding,
      ),
    );

    for (var attr in attributes.attributesList) {
      if (attr.icon != null) {
        widgetsList.add(
          getSvg(
            attr.icon!,
            color: Theme.of(context).iconTheme.color,
          ),
        );
        widgetsList.add(
          SizedBox(
            key: Key(
              'CrayonPaymentPageHeaderTextUnderIconWidget_bodyWidgetsList_AfterSVGSizedBox',
            ),
            height: attr.padding?.bottom,
          ),
        );
      }
      if (attr.title != null) {
        final text = CrayonPaymentText(
          key: Key(
            'CrayonPaymentPageHeaderTextUnderIconWidget_bodyWidgetsList_TitleText',
          ),
          text: TextUIDataModel(
            attr.title?.text ?? '',
            styleVariant:
                attr.title?.styleVariant ?? CrayonPaymentTextStyleVariant.headline2,
          ),
        );
        widgetsList.add(text);
      }
    }

    widgetsList.add(
      SizedBox(
        key: Key(
          'CrayonPaymentPageHeaderTextUnderIconWidget_bodyWidgetsList_AfterTextSizedBox',
        ),
        height: attributes.headerBottomPadding,
      ),
    );

    return widgetsList;
  }
}
