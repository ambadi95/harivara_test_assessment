import 'package:flutter/material.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';

class CrayonPaymentListTile extends StatelessWidget {
  final Widget _title;
  final Widget? _subtitle;
  final Widget? trailWidget;
  final Widget? displayIcon;
  final Function()? onTapCallbackListTile;

  CrayonPaymentListTile(
    this._title,
    this._subtitle, {
    this.onTapCallbackListTile,
    this.trailWidget,
    this.displayIcon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildListTile;
  }

  Widget get _buildListTile {
    return InkWell(
      key: const Key('inkwell'),
      onTap:
          onTapCallbackListTile == null ? null : () => onTapCallbackListTile!(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          key: Key('list_tile_row'),
          children: [
            if (displayIcon != null) displayIcon!,
            spaceW10(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _title,
                  if (_subtitle != null) ...[
                    spaceH5(),
                    _subtitle!,
                  ]
                ],
              ),
            ),
            if (trailWidget != null) trailWidget!,
          ],
        ),
      ),
    );
  }
}
