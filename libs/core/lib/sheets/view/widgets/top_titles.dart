import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class DateTitle extends StatelessWidget {
  final String _identifier = 'datePickerTitle';

  const DateTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTitle(
      key: Key(_identifier),
      title: 'top-titles-widget-select-date-range-title'.tr,
    );
  }
}

class DefaultTitle extends StatelessWidget {
  final String _identifier = 'pickerTitle';
  final String? title;
  final Alignment? alignment;

  const DefaultTitle({
    Key? key,
    this.title,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? AlignmentDirectional.topStart,
      child: CrayonPaymentText(
        text: TextUIDataModel(
          title ?? 'top-titles-widget-select-date-range-title'.tr,
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          textAlign: TextAlign.center,
        ),
        key: Key(_identifier),
      ),
    );
  }
}
