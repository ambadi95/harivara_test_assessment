import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/data_model/loading_bottom_sheet_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:core/sheets/view/widgets/top_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/buttons/text_button.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/page_header/spannable_text_widget.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class BottomSheetAgentEnrollment extends StatelessWidget {
  static final String _identifier = 'BottomSheetAgentEnrollment';
  final SheetInfo _sheetState;
  final CrayonPaymentBottomSheetCoordinator coordinator;

  const BottomSheetAgentEnrollment(
      this.coordinator,
      this._sheetState, {
        Key? key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      key: Key('$_identifier'),
      children: [
        if (_sheetState.disableCloseButton)
          SizedBox(
            height: 38,
          ),
        if (!_sheetState.disableCloseButton)
          CloseButtonTopRow(
            onClose: () => coordinator.goBack(),
          ),
        _buildImage,
        SizedBox(
          height: 38,
        ),
        if (_sheetState.title != null) _buildTitle,
        SizedBox(
          height: 18,
        ),
        if (_sheetState.subtitle != null) _buildSubtitle,
        if (_sheetState.additionalText != null) ...[
          SizedBox(
            height: 41,
          ),
          ..._sheetState.additionalText!
              .map(
                (additionalText) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: _buildAdditionalText(additionalText),
            ),
          )
              .toList(),
        ],
        if (_sheetState.buttonOptions != null) ...[
          SizedBox(
            height: 41,
          ),
          ..._sheetState.buttonOptions!
              .map(
                (buttonOption) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: _buildBottomButton(context, buttonOption),
            ),
          )
              .toList(),
        ] else ...[
          SizedBox(
            height: 100,
          )
        ],
      ],
    );
  }

  Widget get _buildImage {
    return SvgPicture.asset(
      _sheetState.bottomSheetIcon.svgAssetPath,
      key: const Key('statusImage'),
    );
  }

  SpannedTextWidget get _buildTitle {
    return SpannedTextWidget(
      texts: [
        TextUIDataModel(
          _sheetState.title!,
          textAlign: TextAlign.center,
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: CrayonPaymentColors.crayonPaymentBlack,
        ),
        TextUIDataModel(
          _sheetState.title!,
          textAlign: TextAlign.center,
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: CrayonPaymentColors.crayonPaymentBlack,
        ),
        TextUIDataModel(
          _sheetState.title!,
          textAlign: TextAlign.center,
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: CrayonPaymentColors.crayonPaymentBlack,
        )
      ],
      key: const Key('title'),
    );
  }

  SpannedTextWidget get _buildSubtitle {
    return SpannedTextWidget(
      key: const Key('subtitle'),
      texts: [
        TextUIDataModel(
          _sheetState.subtitle!,
          textAlign: TextAlign.center,
          styleVariant: CrayonPaymentTextStyleVariant.headline5,
          color: Colors.grey,
        ),
        TextUIDataModel(
          _sheetState.subtitle!,
          textAlign: TextAlign.center,
          styleVariant: CrayonPaymentTextStyleVariant.headline5,
          color: Colors.grey,
        )
      ],
    );
  }

  CrayonPaymentText _buildAdditionalText(String? _additionalText) {
    return CrayonPaymentText(
      key: const Key('additionalText'),
      text: TextUIDataModel(
        _additionalText!,
        textAlign: TextAlign.center,
        styleVariant: CrayonPaymentTextStyleVariant.headline5,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context, ButtonOptions buttonOptions) {
    VoidCallback callback = buttonOptions.onPressed;
    if (buttonOptions is LoadingBottomSheetOptions) {
      callback = () {
        coordinator.forceLoading();
        buttonOptions.onPressed();
      };
    }
    if (!buttonOptions.textButton) {
      return CrayonPaymentDockedButton(
        key: const Key('bottomButtonDocked'),
        title: buttonOptions.text,
        onPressed: callback,
      );
    } else {
      return Container(
        child: CrayonPaymentTextButton(
          text: buttonOptions.text,
          key: const Key('bottomButtonText'),
          textStyle: Theme.of(context).textTheme.headline4,
          onPressed: callback,
        ),
      );
    }
  }
}
