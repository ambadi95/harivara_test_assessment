import 'package:core/utils/extensions/string_extensions.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/backgrounds/crayon_payment_decorated_background.dart';
import 'package:widget_library/buttons/docked_button_bar.dart';
import 'package:widget_library/page_header/spannable_text_widget.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/success_screen/crayon_payment_success_base_widget_attribute.dart';
import 'package:widget_library/swipe_bottom_bar/swipeable_bottom_bar.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';
import 'package:widget_library/utils/icon_utils.dart';

class _Constants {
  static const double marginHorizontal = 32.0;
  static const double marginVertical = 10.0;
  static const double bottom = 44.0;
  static const double thickness = 1;
  static const double imageHeight = 120;
  // ignore: unused_field
  static const double topPadding = 160;
  static const double swipeAreaHeight = 140;
}

class CrayonPaymentSuccessScreenWidget extends StatelessWidget {
  final CrayonPaymentSuccessBaseWidgetAttribute attribute;

  const CrayonPaymentSuccessScreenWidget({
    Key? key,
    required this.attribute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (attribute.bottomButtons == null)
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 182,
              child: Opacity(
                opacity: 0.2,
                child: CrayonPaymentDecoratedBackground(
                  backgroundGradientTopColor: CrayonPaymentTheme()
                      .themeData
                      .colorPalette!
                      .secondary
                      .toColor(),
                ),
              ),
            ),
          ),
        if (attribute.topHeading != null)
          _TopHeading(title: attribute.topHeading!),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: attribute.headerFlex, child: SizedBox()),
            Expanded(
              flex: attribute.mainContentFlex,
              child: Column(
                children: [
                  if (attribute.svg != null)
                    getSvg(attribute.svg!, height: _Constants.imageHeight),
                  if (attribute.svg != null)
                    SizedBox(height: _Constants.marginHorizontal),
                  if (attribute.title != null) _Header(title: attribute.title!),
                  if (attribute.description != null)
                    _Description(description: attribute.description!),
                  if (attribute.itemValueAttributes != null)
                    Expanded(
                      child: _BottomPanel(
                        itemValueAttributes: attribute.itemValueAttributes!,
                        scrollPhysics: attribute.itemValueListScrollPhysics,
                        itemValueTextAlign: attribute.itemValueTextAlign,
                      ),
                    ),
                ],
              ),
            ),
            if (attribute.bottomButtons != null)
              CrayonPaymentDockedButtonBar(
                attributes: CrayonPaymentDockedButtonBarAttributes(
                  attribute.bottomButtons!,
                ),
              )
            else
              Padding(
                padding: EdgeInsets.only(
                  bottom: _Constants.bottom,
                  right: _Constants.marginHorizontal,
                  left: _Constants.marginHorizontal,
                ),
                child: Container(
                  height: _Constants.swipeAreaHeight,
                  child: CrayonPaymentSwipeableBottomBar(
                    initialChildSize: 0.6,
                    title: 'SWIPE TO CLOSE',
                    textStyleVariant: CrayonPaymentTextStyleVariant.headline5,
                    onSwiped: () {
                      attribute.onSwipedToConfirm?.call();
                    },
                  ),
                ),
              )
          ],
        ),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final String title;

  const _Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: _Constants.marginHorizontal),
      child: CrayonPaymentText(
        text: TextUIDataModel(
          title,
          styleVariant: CrayonPaymentTextStyleVariant.headline1,
        ),
      ),
    );
  }
}

class _TopHeading extends StatelessWidget {
  final String title;

  const _TopHeading({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(_Constants.marginHorizontal),
        child: CrayonPaymentText(
          text: TextUIDataModel(
            title,
            styleVariant: CrayonPaymentTextStyleVariant.headline3,
          ),
        ),
      ),
    );
  }
}

class _Description extends StatelessWidget {
  final String description;

  const _Description({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _Constants.marginHorizontal),
      child: CrayonPaymentText(
        text: TextUIDataModel(
          description,
          styleVariant: CrayonPaymentTextStyleVariant.headline2,
        ),
      ),
    );
  }
}

/// Contains the item/value pairs rendered in a scrollable container sandwiched by dividers
/// Note that scrolling doesn't work with the swipe controller
class _BottomPanel extends StatelessWidget {
  final List<ItemValueAttribute?> itemValueAttributes;
  final ScrollPhysics? scrollPhysics;
  final TextAlign? itemValueTextAlign;

  const _BottomPanel({
    Key? key,
    required this.itemValueAttributes,
    this.scrollPhysics,
    this.itemValueTextAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: _Constants.marginHorizontal),
      child: Column(
        children: [
          SizedBox(height: _Constants.marginVertical),
          if (itemValueAttributes.isNotEmpty) ...[
            Divider(
              thickness: _Constants.thickness,
              color: CrayonPaymentTheme()
                  .themeData
                  .colorPalette!
                  .primary
                  .toColor()
                  .withOpacity(0.1),
            ),
          ],
          Flexible(
            child: SingleChildScrollView(
              physics: scrollPhysics ?? NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    itemValueAttributes.length,
                    (index) {
                      final item = itemValueAttributes[index]!.item;
                      final value = itemValueAttributes[index]!.value;
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: _Constants.marginVertical,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: SpannedTextWidget(
                                textAlign: itemValueTextAlign,
                                texts: [
                                  item,
                                  TextUIDataModel('  '),
                                  value,
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: _Constants.marginVertical),
          if (itemValueAttributes.isNotEmpty) ...[
            Divider(
              thickness: _Constants.thickness,
              color: CrayonPaymentTheme()
                  .themeData
                  .colorPalette!
                  .primary
                  .toColor()
                  .withOpacity(0.1),
            ),
          ],
        ],
      ),
    );
  }
}
