import 'package:flutter/material.dart';
import 'package:widget_library/utils/icon_utils.dart';

/// Default decoration image uri for the background
const String _CrayonPaymentDecoratedBackgroundChevronIconUri = 'widget_library:assets/images/bg_chevron.svg';

/// Container which facilitates decorating background of a screen
/// with any image and gradient
class CrayonPaymentDecoratedBackground extends StatelessWidget {
  final Color? backgroundColor;
  final Color? backgroundGradientTopColor;
  final Color backgroundGradientBottomColor;
  final List<Color>? gradientColors;
  final String decorationIconUri;
  final Alignment? decorationIconAlignment;
  final ImageType imageType;
  final bool stretch;

  /// Color to fill the decoration vector image with
  final Color? decorationColor;

  const CrayonPaymentDecoratedBackground({
    Key? key,
    this.backgroundColor,
    this.backgroundGradientTopColor,
    this.backgroundGradientBottomColor = Colors.transparent,
    this.gradientColors,
    this.decorationColor,
    this.decorationIconUri = _CrayonPaymentDecoratedBackgroundChevronIconUri,
    this.decorationIconAlignment = Alignment.topCenter,
    this.imageType = ImageType.Svg,
    this.stretch = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key('CrayonPaymentDecoratedBackground_Container'),
      color: backgroundColor ?? Colors.transparent,
      child: Stack(
        key: Key('CrayonPaymentDecoratedBackground_Stack'),
        fit: StackFit.expand,
        children: [
          decorationIconAlignment == null
              ? getImageContainer(context)
              : Align(
                  key: Key('CrayonPaymentDecoratedBackground_Stack'),
                  alignment: decorationIconAlignment!,
                  child: getImageContainer(context),
                ),
          _GradientedContainer(
            key: Key('CrayonPaymentDecoratedBackground_GradientedContainer'),
            backgroundGradientTopColor: backgroundGradientTopColor,
            backgroundGradientBottomColor: backgroundGradientBottomColor,
              gradientColors: gradientColors,
          ),
        ],
      ),
    );
  }

  Widget getImageContainer(BuildContext context) {
    // final decorationColorDefault = CrayonPaymentTheme.of(context).theme.colorStyles.backgroundColors.secondary.color;
    return imageType == ImageType.Svg
        ? getSvg(
            decorationIconUri,
            // color: decorationColor ?? decorationColorDefault,
            boxFit: BoxFit.fitWidth,
            width: stretch ? MediaQuery.of(context).size.width : null,
          )
        : getPng(
            decorationIconUri,
            // color: decorationColor ?? decorationColorDefault,
            width: MediaQuery.of(context).size.width,
          );
  }
}

class _GradientedContainer extends StatelessWidget {
  final Color? backgroundGradientTopColor;
  final Color? backgroundGradientBottomColor;
  final List<Color>? gradientColors;

  const _GradientedContainer({
    Key? key,
    this.backgroundGradientTopColor,
    this.backgroundGradientBottomColor,
    this.gradientColors,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return (backgroundGradientTopColor != null && backgroundGradientBottomColor != null) || gradientColors != null
        ? Container(
            key: Key('CrayonPaymentDecoratedBackground_GradientedContainer_Container'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors == null ? [
                  backgroundGradientTopColor!,
                  backgroundGradientBottomColor!,
                ] : gradientColors!,
              ),
            ),
          )
        : Container(
            key: Key('CrayonPaymentDecoratedBackground_GradientedContainer_NullContainer'),
          );
  }
}
