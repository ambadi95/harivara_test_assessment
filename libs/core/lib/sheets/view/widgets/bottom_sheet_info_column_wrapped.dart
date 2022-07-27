import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/data_model/loading_bottom_sheet_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:core/sheets/view/widgets/top_bars.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/buttons/text_button.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class BottomSheetInfoColumnWrap extends StatelessWidget {
  static final String _identifier = 'BottomSheetInfoColumnWrap';
  final SheetInfoWrap _sheetState;
  final CrayonPaymentBottomSheetCoordinator? coordinator;

  const BottomSheetInfoColumnWrap(
    this._sheetState, {
    Key? key,
    this.coordinator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      key: Key('$_identifier'),
      children: [
        if (_sheetState.hasCloseButton ?? true)
          CloseButtonTopRow(
            onClose: () => _sheetState.onClose?.call(),
          ),
        if (!(_sheetState.hasCloseButton ?? true))
          _getDynamicSizedHalfBox(context),
        _buildImage,
        SizedBox(
          height: 38,
        ),
        if (_sheetState.title != null) _buildTitle,
        SizedBox(
          height: 18,
        ),
        if (_sheetState.subtitle != null) _buildSubtitle,
        if (_sheetState.buttonOptions != null) ...[
          _getDynamicSizedHalfBox(context),
          ..._sheetState.buttonOptions!
              .map(
                (buttonOption) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: _buildBottomButton(buttonOption),
                ),
              )
              .toList(),
        ],
      ],
    );
  }

  Widget get _buildImage {
    return SvgPicture.asset(
      _sheetState.bottomSheetIcon.svgAssetPath,
      key: Key('${_identifier}_StatusImage'),
    );
  }

  CrayonPaymentText get _buildTitle {
    return CrayonPaymentText(
      text: TextUIDataModel(
        _sheetState.title!,
        styleVariant: CrayonPaymentTextStyleVariant.headline6,
        color: Colors.black,
        textAlign: TextAlign.center,
      ),
      key: Key('${_identifier}_Title'),
    );
  }

  Padding get _buildSubtitle {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: CrayonPaymentText(
        key: Key('${_identifier}_Subtitle'),
        text: TextUIDataModel(
          _sheetState.subtitle!,
          styleVariant: CrayonPaymentTextStyleVariant.bodyText2,
          color: Color(0xff676767),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildBottomButton(ButtonOptions buttonOptions) {
    VoidCallback callback = buttonOptions.onPressed;
    if (buttonOptions is LoadingBottomSheetOptions) {
      callback = () {
        coordinator?.forceLoading();
        buttonOptions.onPressed();
      };
    }
    if (!buttonOptions.textButton) {
      return CrayonPaymentDockedButton(
        key: Key('${_identifier}_DockedBottomButton'),
        title: buttonOptions.text,
        onPressed: callback,
      );
    } else {
      return CrayonPaymentTextButton(
        text: buttonOptions.text,
        key: Key('${_identifier}_TextBottomButton'),
        onPressed: callback,
      );
    }
  }

  SizedBox _getDynamicSizedHalfBox(BuildContext context) => SizedBox(
        height: MediaQuery.of(context).size.height *
            (_sheetState.buttonOptions == null ? 0.02 : 0.0125),
      );
}
