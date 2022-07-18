import 'package:core/ioc/di_container.dart';
import 'package:flutter/material.dart';
import 'package:core/utils/input_formatters/numeric_text_formatter.dart';
import 'package:core/utils/input_formatters/length_text_formatter.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/error/error_text.dart';

class AmountEntryWithError extends StatelessWidget {
  final String? errorMessage;
  final TextEditingController? controller;
  final bool readOnly;
  final Function(String)? onTextChanged;
  final String? initialValue;
  final bool autoFocus;

  const AmountEntryWithError({
    this.errorMessage,
    this.controller,
    this.onTextChanged,
    this.initialValue,
    required this.readOnly,
    this.autoFocus = true,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildDivider,
        TextFormField(
          initialValue: initialValue,
          key: const Key('amountTextField'),
          inputFormatters: controller == null
              ? [
                  DIContainer.container.resolve<LengthTextFormatter>(),
                  NumericTextFormatter()
                ]
              : null,
          controller: controller,
          onChanged: onTextChanged,
          maxLines: 1,
          autofocus: autoFocus,
          showCursor: true,
          cursorColor: CrayonPaymentColors.crayonPaymentBlack,
          readOnly: readOnly,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          textAlign: TextAlign.center,
          decoration: const InputDecoration(border: InputBorder.none),
          style: Theme.of(context).textTheme.headline1!.copyWith(
                fontSize: 50,
                color: errorMessage != null ? Colors.red : CrayonPaymentColors.crayonPaymentBlack,
              ),
        ),
        if (errorMessage != null) _buildErrorMessage,
        _buildDivider,
      ],
    );
  }

  Container get _buildErrorMessage {
    return Container(
      key: Key('error-text-container'),
      padding: EdgeInsets.only(
        bottom: CrayonPaymentDimensions.dividerMargin,
      ),
      alignment: Alignment.center,
      child: ErrorText(errorMessage),
    );
  }

  Divider get _buildDivider => const Divider(
        height: 12,
        color: Colors.black,
      );
}
