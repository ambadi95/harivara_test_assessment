import 'dart:async';

import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class ObscuredField extends StatefulWidget {
  final String value;
  final bool shouldBeFocused;

  ObscuredField({
    required this.value,
    required this.shouldBeFocused,
    Key? key,
  }) : super(key: key);

  @override
  State<ObscuredField> createState() => _ObscuredFieldState();
}

class _ObscuredFieldState extends State<ObscuredField> {
  late String _value;

  /// The delay until the digit is obscured
  static final int _obscureDelay = 500;

  // ignore: unused_field
  Timer? _timer;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  void _startTimer() {
    if (_value.isNotEmpty && widget.value != '*') {
      _timer = Timer(Duration(milliseconds: _obscureDelay), () {
        if (widget.value != '') {
          if (mounted) {
            setState(() {
              _value = '*';
            });
          }
        }
        _timer = null;
      });
    }
  }

  @override
  void didUpdateWidget(covariant ObscuredField oldWidget) {
    super.didUpdateWidget(oldWidget);
    setState(() {
      _value = widget.value;
    });
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: CrayonPaymentDimensions.entryDigitFIeldtMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [_buildText, _buildDivider],
        ),
      ),
    );
  }

  Widget get _buildText {
    return CrayonPaymentText(
      text: TextUIDataModel(
        _value,
        styleVariant: CrayonPaymentTextStyleVariant.headline2,
      ),
      key: const Key('field-text'),
    );
  }

  Divider get _buildDivider {
    return widget.shouldBeFocused
        ? Divider(
            color: CrayonPaymentColors.crayonPaymentGold,
            thickness: 4.0,
          )
        : _value.isNotEmpty
            ? Divider(
                color: CrayonPaymentColors.crayonPaymentBlack,
                thickness: 4.0,
              )
            : Divider(
                color: CrayonPaymentColors.crayonPaymentDarkGray,
                thickness: 4.0,
              );
  }
}
