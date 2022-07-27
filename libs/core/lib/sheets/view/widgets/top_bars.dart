import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_library/icons/crayon_payment_icon_paths.dart';

class CloseButtonTopRow extends StatelessWidget {
  final String _identifier = 'iconCloseButton';
  final Function()? onClose;

  const CloseButtonTopRow({
    Key? key,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 32,
          height: 32,
          child: IconButton(
            iconSize: 16,
            key: Key(_identifier),
            icon: SvgPicture.asset(CrayonPaymentIconPath.iconClose),
            onPressed: () {
              if (onClose != null) {
                onClose?.call();
              } else {
                DIContainer.container.resolve<NavigationManager>().goBack();
              }
            },
          ),
        ),
      ],
    );
  }
}
