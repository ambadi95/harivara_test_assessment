import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/data_model/loading_bottom_sheet_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:core/sheets/view/widgets/top_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/buttons/text_button.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/formatter/nida_input_formatter.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/input_fields/input_number_field_with_label.dart';
import 'package:widget_library/page_header/spannable_text_widget.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class BottomSheetCustomAmount extends StatelessWidget {
  static final String _identifier = 'BottomSheetCustomAmount';
  final CustomAmountBottomSheet _sheetState;
  final CrayonPaymentBottomSheetCoordinator coordinator;

  const BottomSheetCustomAmount(
    this.coordinator,
    this._sheetState, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController mobileNumber = TextEditingController();

    return ListView(
      shrinkWrap: true,
      key: Key('$_identifier'),
      children: [
        _onTabContainer(context),
        SizedBox(height: 50),
        _buildTitle,
        _buildTextField(mobileNumber),
        SizedBox(height: 45),
        ..._sheetState.buttonOptions!
            .map(
              (buttonOption) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: _buildBottomButton(context, buttonOption),
              ),
            )
            .toList(),
      ],
    );
  }

  Padding get _buildTitle {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Align(
         alignment: Alignment.topLeft,
        child: RichTextDescription(
          textAlign: TextAlign.center,
          description: _sheetState.title!,
          key: const Key('title'),
          // linkTextStyle: ES_bold_text,
          // descriptionTextStyle: ES_success_text,
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController amount) {
    return InputFieldWithLabel(
      label: '',
      controller: amount,
      hintText: 'Enter the amount',
      key: const Key('mobileNumberTextField'),
      inputFormatters: <TextInputFormatter>[
        //NIDAInputFormatter(mask: 'xxx xxx xxx', separator: ' ')
      ],
      keyboardType: TextInputType.number,
      onChanged: (value) {},
    );
  }

  Widget _onTabContainer(BuildContext context){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .3),
      child: Container(
        height: 5,
        decoration: BoxDecoration(
          color: LR_ColorF3F4FA,
          borderRadius: BorderRadius.circular(4)
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
}
