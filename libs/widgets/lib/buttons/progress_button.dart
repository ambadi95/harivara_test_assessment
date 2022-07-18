import 'package:flutter/material.dart';

class _Constants {
  static const emptyText = '';
}

///
/// A button that has rounded corners.
/// Note that this is deprecated and should be replaced with an [CrayonPaymentInPlaceButton] that has a
/// a [CrayonPaymentInPlaceButtonStyle.rounded]
///
@Deprecated('Replaced by CrayonPaymentInPlaceButton')
class ProgressButtonWidget extends StatelessWidget {
  final Function()? onTap;
  final String? text;
  final Color? color;
  final double? height;
  final TextStyle? textStyle;

  ProgressButtonWidget({
    this.onTap,
    this.text = _Constants.emptyText,
    this.color,
    this.height,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      key: Key('ProgressButtonWidget_Row'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          key: Key('ProgressButtonWidget_Expanded'),
          child: Padding(
            key: Key('ProgressButtonWidget_Padding'),
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20),
            child: TextButton(
              key: Key('ProgressButtonWidget_TextButton'),
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                primary: color ?? Theme.of(context).primaryColor,
                shape: StadiumBorder(),
              ),
              child: Padding(
                key: Key('ProgressButtonWidget_SymmetricPadding'),
                padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 8.0),
                child: Text(
                  text ?? _Constants.emptyText,
                  key: Key('ProgressButtonWidget_EmptyTextText'),
                  style: textStyle ??
                      TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
