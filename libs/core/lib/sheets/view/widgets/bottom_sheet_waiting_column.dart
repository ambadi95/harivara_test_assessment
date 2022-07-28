import 'package:flutter/material.dart';
import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:widget_library/icons/crayon_payment_icon_paths.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';

class BottomSheetWaitingColumn extends StatelessWidget {
  static final String _identifier = 'BottomSheetWaitingColumn';
  final CrayonPaymentBottomSheetCoordinator _coordinator;
  final String? _text;
  final SheetWaiting state;

  const BottomSheetWaitingColumn(
    this._coordinator,
    this._text,
    this.state, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      key: Key('$_identifier'),
      child: Column(
        children: [
          _topRow(context),
          spaceH80(),
          CenteredCircularProgressBar(
            color: state.progressIndicatorOptions.progressIconColor,
            strokeWidth: state.progressIndicatorOptions.strokeWidth,
          ),
          spaceH30(),
          if (_text != null) _buildtext,
        ],
      ),
    );
  }

  Row _topRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (!state.disableIcon)
          Row(
            children: [
              _buildImage,
              Text(
                'CrayonPayment Pay',
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        if (!state.disableCloseButton)
          IconButton(
            key: Key('${_identifier}_ClosingIcon'),
            icon: const Icon(Icons.close),
            onPressed: () {
              _coordinator.goBack();
            },
          ),
      ],
    );
  }

  Widget get _buildImage {
    const pathImages = CrayonPaymentIconPath.crayonPaymentLogo;
    return Image.asset(
      pathImages,
      height: 80,
      key: Key('${_identifier}_CrayonPaymentLogoImage'),
    );
  }

  Text get _buildtext {
    return Text(
      _text!,
      textAlign: TextAlign.center,
      key: Key('${_identifier}_DisplayingMessage'),
    );
  }
}
