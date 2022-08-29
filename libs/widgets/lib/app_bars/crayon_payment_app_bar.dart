import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/iterable_extensions.dart';
import 'package:get/get.dart';

import '../scaffold/crayon_payment_scaffold.dart';

const double _buttonSize = 50.0;
const String _identifier = 'CrayonPaymentAppBar';

PreferredSizeWidget CrayonPaymentDefaultAppBar(
  BuildContext context,
  CrayonPaymentAppBarAttributes attributes,
  ThemeData theme,
  EdgeInsets screenPadding,
) {
  final leadingWidth =
      screenPadding.left + (_buttonSize * (attributes.left?.length ?? 0.0));
  Brightness crayonPaymentBrightness =
      (attributes.brightness == CrayonPaymentBrightness.dark)
          ? Brightness.dark
          : Brightness.light;
  return AppBar(
    key: attributes.key ?? const Key('${_identifier}'),
    centerTitle: true,
    backgroundColor: attributes.appBarColor,
    automaticallyImplyLeading: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      systemNavigationBarIconBrightness: crayonPaymentBrightness,
      statusBarBrightness: crayonPaymentBrightness,
      statusBarIconBrightness: crayonPaymentBrightness,
    ),
    leading: (attributes.left != null)
        ? Row(
            key: Key('${_identifier}_Row'),
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: _createAppBarButtons(
              attributes.left ?? [],
              screenPadding,
              context: context,
              theme: theme,
            ),
          )
        : null,
    leadingWidth: leadingWidth,
    title: _createTitle(
      context,
      attributes,
      theme,
    ),
    actions: (attributes.right != null)
        ? _createAppBarButtons(
            attributes.right!,
            screenPadding,
            context: context,
            isRight: true,
            theme: theme,
          )
        : null,
    elevation: 0,
  );
}

List<Widget> _createAppBarButtons(
  List<CrayonPaymentAppBarButtonType> buttonAttributesList,
  EdgeInsets appBarPadding, {
  required BuildContext context,
  bool isRight = false,
  ThemeData? theme,
}) {
  final mainTheme = theme ?? Theme.of(context);
  final color = isRight
      ? mainTheme.appBarTheme.actionsIconTheme?.color
      : mainTheme.appBarTheme.iconTheme?.color;

  var buttons = buttonAttributesList
      .mapIndexed(
        (item, index) => Container(
          width: _buttonSize,
          height: _buttonSize,
          alignment: isRight
              ? AlignmentDirectional.centerEnd
              : AlignmentDirectional.centerStart,
          key: Key('${_identifier}_Container${index}_$isRight'),
          child: GestureDetector(
            key: Key('${_identifier}_GestureDetector${index}_$isRight'),
            onTap: (item.onPressed != null) ? item.onPressed : null,
            child: item.getButton(
              context,
              color ?? mainTheme.appBarTheme.foregroundColor!,
            ),
          ),
        ),
      )
      .toList();

  final spacer = Container(
    key: Key('${_identifier}_ContainerWidth_$isRight'),
    width: isRight ? appBarPadding.right : appBarPadding.left,
  );

  if (isRight) {
    buttons.add(spacer);
  } else {
    buttons.insert(0, spacer);
  }
  return buttons;
}

Widget _createTitle(
  BuildContext context,
  CrayonPaymentAppBarAttributes attributes,
  ThemeData theme,
) {
  if (attributes.title != null) {
    return FittedBox(
      key: Key('${_identifier}_FittedBox'),
      child: Padding(
        padding: EdgeInsets.only(top: attributes.titleOffsetFromTop),
        child: Text(
          attributes.title!.tr,
          key: Key('${_identifier}_Title'),
          style: attributes.titleTextStyle ?? theme.appBarTheme.titleTextStyle,
        ),
      ),
    );
  }
  return Container(key: Key('${_identifier}_Empty_Container'));
}
