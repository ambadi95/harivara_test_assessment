import 'package:flutter/material.dart';
import 'package:widget_library/backgrounds/crayon_payment_decorated_background.dart';
import 'package:widget_library/buttons/buttons.dart';
import 'package:widget_library/buttons/cornered_icon_button.dart';
import 'package:widget_library/padding.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class _Constants {
  static const defaultSwipeIconUri = 'widget_library:assets/images/ic_send.svg';
  static const defaultSwipeBackgroundIconUri =
      'widget_library:assets/images/ic_chevron_horizontal.svg';
  static const defaultSwipeBackgroundOpacity = 0.2;
  static const defaultBorderRadius = 12.0;
  static const swipePanelCrayonPaymentPadding =
      CrayonPaymentPadding(height: 56);
}

/// Swipe to dismiss panel
///
///```
/// +---------------------+
/// |>       title        |
/// +---------------------+
/// ```
class CrayonPaymentSwipeToDismissPanel extends StatelessWidget {
  const CrayonPaymentSwipeToDismissPanel({
    Key? key,
    this.dismissDirection = DismissDirection.startToEnd,
    this.onDismissed,
    required this.title,
  }) : super(key: key);

  /// When null, onDismissed will call navigator.pop
  final Function(DismissDirection)? onDismissed;

  /// By default dismiss direction is left to right (start to end)
  final DismissDirection dismissDirection;

  /// Text displayed in the center of the swipe panel
  ///
  ///```
  /// +---------------------+
  /// |Icon     title       |
  /// +---------------------+
  /// ```
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(_Constants.defaultBorderRadius),
        ),
      ),
      height: _Constants.swipePanelCrayonPaymentPadding.height,
      child: Dismissible(
        key: Key('CrayonPaymentSwipeToDismissPanel_Dismissible'),
        onDismissed: (d) {
          onDismissed?.call(d);
        },
        direction: DismissDirection.startToEnd,
        child: Container(
          color: Colors.white12,
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: _Constants.defaultSwipeBackgroundOpacity,
                  child: CrayonPaymentDecoratedBackground(
                    decorationIconUri: _Constants.defaultSwipeBackgroundIconUri,
                    stretch: true,
                  ),
                ),
              ),
              CrayonPaymentCorneredIconButton(
                key: Key(
                    'CrayonPaymentSwipeToDismissPanel_submit_button_CrayonPaymentCorneredIconButton'),
                isBorderEnabled: false,
                onPressed: () {},
                svgSource: _Constants.defaultSwipeIconUri,
                variant: CrayonPaymentButtonThemeVariant.quaternary,
              ),
              Center(
                child: CrayonPaymentText(
                  key: Key(
                      'CrayonPaymentSwipeToDismissPanel_title_CrayonPaymentText'),
                  text: TextUIDataModel(title),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
