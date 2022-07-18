import 'package:flutter/material.dart';
import 'package:widget_library/backgrounds/crayon_payment_decorated_background.dart';
import 'package:widget_library/buttons/docked_button_bar.dart';
import 'package:widget_library/buttons/text_button.dart';
import 'package:widget_library/padding.dart';
import 'package:widget_library/page_header/page_header_text_under_icon/page_header_text_under_icon_widget.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/scroll_container/crayon_payment_safe_scroll_container.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/success_screen/success_screen_widget_attributes.dart';
import 'package:widget_library/utils/icon_utils.dart';

class _Constants {
  static const Size closeIconSize = Size(48, 48);
  static const double closeButtonRightPadding = 28;
  static const double closeButtonTopPadding = 48;
  static const String closeIconUri = 'app_account:assets/images/close.svg';
  static const double edgePadding = 32;
}

class SuccessScreenWidget extends StatelessWidget {
  final SuccessScreenBaseWidgetAttributes attributes;

  const SuccessScreenWidget({
    Key? key,
    required this.attributes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final padding = (attributes.padding != null)
        ? attributes.padding
        : CrayonPaymentPadding(left: _Constants.edgePadding, top: 286);
    final headerIconPadding = (attributes.crossIconPadding != null)
        ? EdgeInsets.fromLTRB(
            attributes.crossIconPadding!.left,
            attributes.crossIconPadding!.top,
            attributes.crossIconPadding!.right,
            attributes.crossIconPadding!.bottom,
          )
        : EdgeInsets.all(0);

    return WillPopScope(
      onWillPop: () async => attributes.canPopScreen,
      child: CrayonPaymentScaffold(
        themeName: attributes.theme,
        themeBrightness: attributes.brightness,
        appBarAttributes: attributes.backgroundImageUri == null
            ? attributes.appBarAttributes
            : null,
        body: LayoutBuilder(
          builder: (context, constraint) {
            final theme = Theme.of(context);
            return Stack(
              key: Key('SuccessScreenWidget_Stack'),
              children: [
                if (attributes.backgroundImageUri != null)
                  Positioned.fill(
                    key: Key('SuccessScreenWidget_PositionedFill'),
                    child: CrayonPaymentDecoratedBackground(
                      backgroundColor: theme.primaryColor,
                      decorationColor: theme.primaryColor,
                      decorationIconUri: attributes.backgroundImageUri!,
                      imageType: attributes.backgroundImageType!,
                    ),
                  ),
                if (attributes.bottomDecoration != null)
                  _getErrorBottomDecoration(
                    context,
                    attributes.bottomDecoration!,
                  ),
                if (attributes.crossIconPath != null)
                  Padding(
                    key: Key('SuccessScreenWidget_PaddingCrossIcon'),
                    padding: headerIconPadding,
                    child: Row(
                      key: Key('SuccessScreenWidget_Row'),
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          key: Key('SuccessScreenWidget_GestureDetector'),
                          onTap: attributes.onCrossIconTap,
                          child: Container(
                            key: Key('SuccessScreenWidget_ContainerChild'),
                            height: 48,
                            child: getSvg(
                              attributes.crossIconPath!,
                              color: theme.iconTheme.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                Padding(
                  key: Key('SuccessScreenWidget_Padding'),
                  padding: padding?.toEdgeInsets() ?? EdgeInsets.zero,
                ),
                if (attributes.backgroundImageUri != null)
                  Positioned(
                    key: Key('SuccessScreenWidget_Positioned'),
                    right: _Constants.closeButtonRightPadding,
                    top: _Constants.closeButtonTopPadding,
                    width: _Constants.closeIconSize.width,
                    height: _Constants.closeIconSize.height,
                    child: GestureDetector(
                      onTap: () => attributes.bottomBarAttributes!.buttonsList
                          .firstWhere(
                            (element) =>
                                element.type ==
                                CrayonPaymentDockedButtonBarElementType.swipeButton,
                          )
                          .onPressed
                          ?.call(),
                      child: getSvg(
                        _Constants.closeIconUri,
                      ),
                    ),
                  ),
                CrayonPaymentSafeScrollContainer(
                  constraint: constraint,
                  child: Column(
                    key: Key('SuccessScreenWidget_Column'),
                    children: [
                      Padding(
                        key: Key('SuccessScreenWidget_PaddingHeading'),
                        padding: padding?.toEdgeInsets() ?? EdgeInsets.zero,
                        child: CrayonPaymentPageHeaderTextUnderIconWidget(
                          key: Key(
                            'SuccessScreenWidget_CrayonPaymentPageHEaderTextUnderIconWidget',
                          ),
                          attributes: attributes.items,
                          mainAxisAlignment: attributes.mainAxisAlignment,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: Divider(
                          indent: _Constants.edgePadding,
                          endIndent: _Constants.edgePadding,
                          color: theme.dividerColor,
                        ),
                      ),
                      if (attributes.message != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: _Constants.edgePadding,
                          ),
                          child: CrayonPaymentText(
                            text: attributes.message!,
                          ),
                        ),
                      if (attributes.hasDividerAfterMessage)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: Divider(
                            indent: _Constants.edgePadding,
                            endIndent: _Constants.edgePadding,
                            color: theme.dividerColor,
                          ),
                        ),
                      Spacer(
                        key: Key('SuccessScreenWidget_Spacer'),
                      ),
                      if (attributes.additionalButtonAttributes != null)
                        _getAdditionalButtons(
                          context,
                          attributes.additionalButtonAttributes!,
                        ),
                      if (attributes.bottomBarAttributes != null)
                        CrayonPaymentDockedButtonBar(
                          attributes: attributes.bottomBarAttributes!,
                        ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _getAdditionalButtons(
    BuildContext context,
    List<AdditionalButtonAttributes> additionalButtonAttributes,
  ) {
    var alignment = additionalButtonAttributes.length == 1
        ? MainAxisAlignment.spaceAround
        : MainAxisAlignment.spaceBetween;
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 50,
        left: _Constants.edgePadding,
        right: _Constants.edgePadding,
      ),
      child: Column(
        key: Key('AdditionalButtons_column'),
        children: [
          Row(
            key: Key('AdditionalButtons_row'),
            mainAxisAlignment: alignment,
            children: additionalButtonAttributes
                .map(
                  (e) => CrayonPaymentTextButton(
                    text: e.text.text,
                    onPressed: e.onPressed,
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _getErrorBottomDecoration(
    BuildContext context,
    BottomDecorationAttributes bottomDecoration,
  ) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        key: Key('ErrorBottomDecoration_box'),
        height: 250,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          key: Key('ErrorBottomDecoration_stack'),
          children: [
            bottomDecoration.type == ImageType.Png
                ? getPng(
                    bottomDecoration.image,
                    width: MediaQuery.of(context).size.width,
                  )
                : getSvg(
                    bottomDecoration.image,
                    width: MediaQuery.of(context).size.width,
                  ),
            if (bottomDecoration.startColor != null &&
                bottomDecoration.endColor != null)
              Container(
                key: Key('ErrorBottomDecoration_container'),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      bottomDecoration.startColor!,
                      bottomDecoration.endColor!,
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
