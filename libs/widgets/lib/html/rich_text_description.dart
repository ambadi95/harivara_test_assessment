import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RichTextDescription extends StatelessWidget {
  final String description;
  final TextStyle? descriptionTextStyle;
  final TextStyle? linkTextStyle;
  final Function(String text, String path)? onLinkClicked;

  const RichTextDescription({
    Key? key,
    required this.description,
    this.descriptionTextStyle,
    this.linkTextStyle,
    this.onLinkClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var errorMessage = description.tr;
    var errorMessageParts = errorMessage.split('%');

    List<TextSpan> textSpans = [];

    for (var span in errorMessageParts) {
      if (!span.startsWith('{')) {
        textSpans.add(
          TextSpan(
            text: span,
            style: descriptionTextStyle ??
                const TextStyle(
                  color: Color(0xff413E3C),
                  fontSize: 14,
                  height: 1.5,
                  fontFamily: 'brown',
                ),
          ),
        );
      } else {
        var textAndPaths =
            span.replaceAll('{', '').replaceAll('}', '').split('|');

        var text = textAndPaths[0];
        var path = textAndPaths[1];

        textSpans.add(
          TextSpan(
            text: text,
            style: linkTextStyle ??
                const TextStyle(
                  color: Color(0xffAE8939),
                  fontSize: 14,
                  height: 1.5,
                  fontFamily: 'brown',
                  decoration: TextDecoration.underline,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => {
                    if (onLinkClicked != null) {onLinkClicked!(text, path)}
                  },
          ),
        );
      }
    }

    return RichText(
      text: TextSpan(children: textSpans),
    );
  }
}
