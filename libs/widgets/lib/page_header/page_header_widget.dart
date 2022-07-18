import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/padding.dart';
import 'package:widget_library/string_extensions.dart';

class PageHeaderUIDataModel {
  final String? iconPath;
  final String? title;
  final int maxLines;
  final double height;
  final CrayonPaymentPadding? padding;

  PageHeaderUIDataModel({
    this.iconPath,
    this.title,
    this.maxLines = 2,
    this.height = 96,
    this.padding,
  });
}

class PageHeaderWidget extends StatelessWidget {
  final PageHeaderUIDataModel uiDataModel;

  PageHeaderWidget(
    this.uiDataModel,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('PageHeaderWidget_Container'),
      width: double.infinity,
      height: uiDataModel.height,
      child: Padding(
        key: Key('PageHeaderWidget_Padding'),
        padding: (uiDataModel.padding != null)
            ? EdgeInsets.fromLTRB(
                uiDataModel.padding!.left,
                uiDataModel.padding!.top,
                uiDataModel.padding!.right,
                uiDataModel.padding!.bottom,
              )
            : const EdgeInsets.only(left: 12, right: 12, bottom: 16.0),
        child: Row(
          key: Key('PageHeaderWidget_Row'),
          children: [
            if (uiDataModel.iconPath != null)
              Padding(
                key: Key('PageHeaderWidget_IconPathPadding'),
                padding: const EdgeInsets.only(right: 12.0),
                child: uiDataModel.iconPath!.toSvg,
              ),
            Expanded(
              key: Key('PageHeaderWidget_Expanded'),
              child: AutoSizeText(
                uiDataModel.title!,
                style: Theme.of(context).textTheme.headline1,
                key: Key('PageHeaderWidget_AutoSizeText'),
                maxLines: uiDataModel.maxLines,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
