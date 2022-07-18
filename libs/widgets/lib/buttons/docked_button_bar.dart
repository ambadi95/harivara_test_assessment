import 'package:flutter/material.dart';
import 'package:widget_library/buttons/cornered_icon_button.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/buttons/text_button.dart';
import 'package:widget_library/padding.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/swipe_bottom_bar/swipeable_bottom_bar.dart';

class _Constants {
  static const double swipeAreaHeight = 185;
}

enum CrayonPaymentDockedButtonBarElementType {
  dockedButton,
  textButton,
  staticText,
  corneredButton,
  spacer,
  swipeButton,
}

enum CrayonPaymentDockedButtonBarType {
  vertical,
  horizontal,
  stack,
}

class CrayonPaymentDockedButtonBarAttributes {
  final List<CrayonPaymentDockedButtonBarElementDetails> buttonsList;
  final CrayonPaymentDockedButtonBarType type;
  final CrayonPaymentPadding? padding;
  final Size? size;

  CrayonPaymentDockedButtonBarAttributes(
    this.buttonsList, {
    this.type = CrayonPaymentDockedButtonBarType.vertical,
    this.padding,
    this.size,
  });

  CrayonPaymentDockedButtonBarAttributes copyWith({
    List<CrayonPaymentDockedButtonBarElementDetails>? buttonsList,
    CrayonPaymentDockedButtonBarType? type,
    CrayonPaymentPadding? padding,
    Size? size,
  }) =>
      CrayonPaymentDockedButtonBarAttributes(
        buttonsList ?? this.buttonsList,
        type: type ?? this.type,
        padding: padding ?? this.padding,
        size: size ?? this.size,
      );
}

class CrayonPaymentDockedButtonBarElementDetails {
  final String text;
  final VoidCallback? onPressed;
  // comment this until an alternative is provided
  // just for flutter analyze to pass
  //@deprecated
  final Color? buttonColor;
  final CrayonPaymentTextStyleVariant? buttonTextStyleVariant;
  final CrayonPaymentDockedButtonBarElementType type;
  final CrayonPaymentPadding? padding;
  final Alignment alignment;
  final bool expanded;
  final Size? size;

  CrayonPaymentDockedButtonBarElementDetails({
    required this.text,
    this.onPressed,
    this.buttonColor,
    this.buttonTextStyleVariant,
    this.type = CrayonPaymentDockedButtonBarElementType.dockedButton,
    this.padding,
    this.alignment = Alignment.center,
    this.expanded = false,
    this.size,
  });

  CrayonPaymentDockedButtonBarElementDetails copyWith({
    String? text,
    VoidCallback? onPressed,
    Color? buttonColor,
    CrayonPaymentDockedButtonBarElementType? type,
    CrayonPaymentPadding? padding,
    Alignment? alignment,
    bool? expanded,
    Size? size,
  }) =>
      CrayonPaymentDockedButtonBarElementDetails(
        text: text ?? this.text,
        onPressed: onPressed,
        buttonColor: buttonColor ?? this.buttonColor,
        type: type ?? this.type,
        padding: padding ?? this.padding,
        alignment: alignment ?? this.alignment,
        expanded: expanded ?? this.expanded,
        size: size ?? this.size,
      );
}

class CrayonPaymentDockedButtonBar extends StatelessWidget {
  final CrayonPaymentDockedButtonBarAttributes attributes;

  CrayonPaymentDockedButtonBar({required this.attributes});

  @override
  Widget build(BuildContext context) {
    return createWrapperWidget(
      createChildElmentsList(
        context,
      ),
    );
  }

  Widget createWrapperWidget(List<Widget> children) {
    switch (attributes.type) {
      case CrayonPaymentDockedButtonBarType.horizontal:
        final padding = (attributes.padding != null)
            ? attributes.padding!
            : CrayonPaymentPadding(
                left: 32,
                right: 32,
                bottom: 44,
              );
        return Padding(
          key: Key(
            'CrayonPaymentDockedButtonBarElementDetails_createWrapperWidget_Padding',
          ),
          padding: EdgeInsets.fromLTRB(
            padding.left,
            padding.top,
            padding.right,
            padding.bottom,
          ),
          child: Row(
            key: Key(
              'CrayonPaymentDockedButtonBarElementDetails_createWrapperWidget_Row',
            ),
            children: children,
          ),
        );

      case CrayonPaymentDockedButtonBarType.vertical:
        final padding = (attributes.padding != null)
            ? attributes.padding!
            : CrayonPaymentPadding(
                left: 32,
                right: 32,
                bottom: 44,
              );
        return Padding(
          key: Key(
            'CrayonPaymentDockedButtonBarElementDetails_createWrapperWidget_AllPadding',
          ),
          padding: EdgeInsets.fromLTRB(
            padding.left,
            padding.top,
            padding.right,
            padding.bottom,
          ),
          child: Column(
            key: Key(
              'CrayonPaymentDockedButtonBarElementDetails_createWrapperWidget_ChildrenColumn',
            ),
            children: children,
          ),
        );

      case CrayonPaymentDockedButtonBarType.stack:
        final padding = (attributes.padding != null)
            ? attributes.padding!
            : CrayonPaymentPadding(
                left: 32,
                right: 32,
                bottom: 44,
              );
        return Padding(
          key: Key(
            'CrayonPaymentDockedButtonBarElementDetails_createWrapperWidget_PaddingAll',
          ),
          padding: EdgeInsets.fromLTRB(
            padding.left,
            padding.top,
            padding.right,
            padding.bottom,
          ),
          child: Stack(
            key: Key(
              'CrayonPaymentDockedButtonBarElementDetails_createWrapperWidget_StackChildren',
            ),
            alignment: Alignment.center,
            fit: StackFit.passthrough,
            children: wrapChildrenInStack(
              children,
            ),
          ),
        );
    }
  }

  List<Widget> wrapChildrenInStack(List<Widget> elementsList) {
    List<Widget> widgets = [];
    var index = 0;
    for (var element in elementsList) {
      final elementAttributes = attributes.buttonsList[index];
      widgets.add(
        Align(
          key: Key('${elementAttributes.alignment}'),
          alignment: elementAttributes.alignment,
          child: element,
        ),
      );
      index++;
    }
    return widgets;
  }

  List<Widget> createChildElmentsList(BuildContext context) {
    return attributes.buttonsList
        .map(
          ((dockedButton) => dockedButton.expanded
              ? Expanded(
                  child: createChildElement(dockedButton, context),
                )
              : createChildElement(
                  dockedButton,
                  context,
                )),
        )
        .toList();
  }

  Widget createChildElement(
    CrayonPaymentDockedButtonBarElementDetails button,
    BuildContext context,
  ) {
    switch (button.type) {
      case CrayonPaymentDockedButtonBarElementType.spacer:
        return Spacer();

      case CrayonPaymentDockedButtonBarElementType.dockedButton:
        return CrayonPaymentDockedButton(
          title: button.text,
          onPressed: button.onPressed,
          buttonColor: button.buttonColor,
          padding: button.padding,
          width: button.size?.width,
          height: button.size?.height,
        );

      case CrayonPaymentDockedButtonBarElementType.textButton:
        return CrayonPaymentTextButton(
          key: Key('${button.text}'),
          text: button.text,
          onPressed: button.onPressed,
        );

      case CrayonPaymentDockedButtonBarElementType.staticText:
        final buttonPadding =
            (button.padding != null) ? button.padding! : CrayonPaymentPadding();
        return Padding(
          key: Key(
            'CrayonPaymentDockedButtonBarElementDetails_createChildElement_AllPadding',
          ),
          padding: EdgeInsets.fromLTRB(
            buttonPadding.left,
            buttonPadding.top,
            buttonPadding.right,
            buttonPadding.bottom,
          ),
          child: CrayonPaymentText(
            text: TextUIDataModel(
              button.text,
              styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
            ),
          ),
        );

      case CrayonPaymentDockedButtonBarElementType.corneredButton:
        final buttonPadding =
            (button.padding != null) ? button.padding! : CrayonPaymentPadding(height: 0);
        Size? minimumSize;
        if (buttonPadding.width != 0 && buttonPadding.height != 0) {
          minimumSize = Size(
            buttonPadding.width ?? 0,
            buttonPadding.height,
          );
        }
        return Padding(
          key: Key(
            'CrayonPaymentDockedButtonBarElementDetails_createChildElement_PaddingfromAll',
          ),
          padding: EdgeInsets.fromLTRB(
            buttonPadding.left,
            buttonPadding.top,
            buttonPadding.right,
            buttonPadding.bottom,
          ),
          child: CrayonPaymentCorneredIconButton(
            key: Key(
              'CrayonPaymentDockedButtonBarElementDetails_createChildElement_CrayonPaymentCorneredIconButton',
            ),
            svgSource: button.text,
            onPressed: button.onPressed,
            buttonColor: button.buttonColor,
            minimumSize: minimumSize,
          ),
        );

      case CrayonPaymentDockedButtonBarElementType.swipeButton:
        final buttonPadding =
            (button.padding != null) ? button.padding! : CrayonPaymentPadding(height: 0);
        return Padding(
          padding: EdgeInsets.fromLTRB(
            buttonPadding.left,
            buttonPadding.top,
            buttonPadding.right,
            buttonPadding.bottom,
          ),
          child: Container(
            height: _Constants.swipeAreaHeight,
            child: CrayonPaymentSwipeableBottomBar(
              title: button.text,
              textStyleVariant: button.buttonTextStyleVariant,
              onSwiped: () => button.onPressed?.call(),
            ),
          ),
        );
    }
  }
}
