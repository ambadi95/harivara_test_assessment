import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
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
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/page_header/spannable_text_widget.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class BottomSheetAppLanguage extends StatelessWidget {
  static final String _identifier = 'BottomSheetAppLanguage';
  final ChangeLanguageBottomSheet _sheetState;
  final CrayonPaymentBottomSheetCoordinator coordinator;

  const BottomSheetAppLanguage(
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
            height: 20,
          ),
        if (!_sheetState.disableCloseButton)
          CloseButtonTopRow(
            onClose: () => coordinator.goBack(),
          ),
        _buildImage,
        SizedBox(
          height: 16,
        ),
        if (_sheetState.title != null) _buildTitle,
        SizedBox(
          height: 28,
        ),
        if (_sheetState.subtitle != null) _buildSubtitle,
        if (_sheetState.additionalText != null) ...[
          SizedBox(
            height: 20,
          ),
          if (_sheetState.additionalText != null) ...[
            ..._sheetState.additionalText!
                .map(
                  (additionalText) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: _buildAdditionalText(additionalText),
                  ),
                )
                .toList(),
          ],
        ],
        if (_sheetState.widgetOptions != null) ...[
          SizedBox(
            height: 22,
          ),
          ..._sheetState.widgetOptions!.map((widgetOption) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: _buildBottomWidget(context, widgetOption),
              ))
        ] else ...[
          SizedBox(
            height: 10,
          )
        ],
        if (_sheetState.buttonOptions != null) ...[
          SizedBox(
            height: 22,
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

  Padding get _buildTitle {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RichTextDescription(
        textAlign: TextAlign.center,
        description: _sheetState.title!,
        key: const Key('title'),
        linkTextStyle: ES_bold_text,
        descriptionTextStyle: ES_success_text,
      ),
    );
  }

  RichTextDescription get _buildSubtitle {
    return RichTextDescription(
      textAlign: TextAlign.center,
      description: _sheetState.subtitle!,
      key: const Key('subtitle'),
      linkTextStyle: ES_bold_text,
      descriptionTextStyle: ES_success_text,
    );
    ;
  }

  Padding _buildAdditionalText(String additionalText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 58.0),
      child: CrayonPaymentText(
        key: const Key('additionalText'),
        text: TextUIDataModel(
          additionalText,
          textAlign: TextAlign.center,
          styleVariant: CrayonPaymentTextStyleVariant.headline5,
          color: Color(0xFF676767),
        ),
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
        borderRadius: 8,
        onPressed: callback,
        buttonColor: PRIMARY_COLOR,
        textStyleVariant: CrayonPaymentTextStyleVariant.headline4,
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

  Widget _buildBottomWidget(BuildContext context, Widget widgetOptions) {
    return widgetOptions;
  }
}
