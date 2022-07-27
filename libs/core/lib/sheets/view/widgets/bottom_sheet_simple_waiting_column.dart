import 'package:flutter/material.dart';
import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';

class BottomSheetSimpleWaitingColumn extends StatelessWidget {
  static final String _identifier = 'BottomSheetSimpleWaitingColumn';
  final CrayonPaymentBottomSheetCoordinator _coordinator;
  final String? _text;

  const BottomSheetSimpleWaitingColumn(
    this._coordinator,
    this._text, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      key: Key('$_identifier'),
      children: [
        SizedBox(
          height: CrayonPaymentDimensions.defaultMargin,
        ),
        _topRow(
          context,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CenteredCircularProgressBar(),
              if (_text != null) _buildtext,
            ],
          ),
        ),
      ],
    );
  }

  Row _topRow(
    BuildContext context,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          key: Key('${_identifier}_ClosingIcon'),
          icon: const Icon(
            Icons.close,
          ),
          onPressed: () {
            _coordinator.goBack();
          },
        ),
      ],
    );
  }

  Text get _buildtext {
    return Text(
      _text!,
      key: Key('${_identifier}_DisplayingMessage'),
    );
  }
}
