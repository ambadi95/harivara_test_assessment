import 'package:flutter/services.dart';

class SpacedTextInputFormatter extends TextInputFormatter {
  final String divider;
  final int chunk;

  SpacedTextInputFormatter({String? divider, int? chunk})
      : divider = divider ?? ' ',
        chunk = chunk ?? 4;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue _oldValue,
    TextEditingValue newValue,
  ) {
    // Find the position in the string with spaces removed
    int oldOffset = newValue.selection.baseOffset -
        RegExp(divider)
            .allMatches(newValue.text)
            .map((e) => e.start < newValue.selection.baseOffset)
            .fold(0, (x, y) => x + (y ? 1 : 0));
    var splitText = _splitInGroupsOfFour(newValue.text);
    // Find the new position by considering spaces inserted on the left
    int newOffset = oldOffset;
    for (var i = 0; i < newOffset; i += 1) {
      if (splitText[i] == divider) {
        newOffset += 1;
      }
    }

    return TextEditingValue(
      text: splitText,
      selection: TextSelection.collapsed(
        offset: newOffset,
      ),
    );
  }

  String _splitInGroupsOfFour(String input) {
    input = input.replaceAll(RegExp(divider), '');
    var segments = input.split('');
    var groupSize = chunk;
    var added = 0;
    var it = segments.iterator;
    final buffer = StringBuffer();
    while (it.moveNext()) {
      if (added != 0 && added % groupSize == 0) {
        buffer.write(divider);
      }
      added++;
      buffer.write(it.current);
    }
    return buffer.toString();
  }
}
