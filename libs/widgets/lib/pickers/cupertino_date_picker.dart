import 'package:flutter/cupertino.dart';
import 'package:core/typedefs/callback_typedefs.dart';
import 'package:widget_library/pickers/widgets/action_buttons.dart';

class CupertinoDatePickerWidget extends StatelessWidget {
  final String _identifier = 'CupertinoDatePickerWidget';

  final VoidCallback onCancelCallback;
  final DoneCallback onDoneCallback;
  final OnChangeCallback? onChangeCallback;
  static const double pickerHeight = 220;

  const CupertinoDatePickerWidget({
    Key? key,
    required this.onCancelCallback,
    required this.onDoneCallback,
    this.onChangeCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        key: Key('$_identifier'),
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CancelButton(
                identifier: _identifier,
                onCancelCallback: onCancelCallback,
              ),
              DoneButton(
                identifier: _identifier,
                onDoneCallback: onDoneCallback,
              ),
            ],
          ),
          _buildCupertinoPicker(),
        ],
      ),
    );
  }

  Widget _buildCupertinoPicker() {
    return Container(
      key: Key('${_identifier}_Picker'),
      height: pickerHeight,
      child: CupertinoDatePicker(
        onDateTimeChanged: (dateTime) {
          onChangeCallback?.call(dateTime);
        },
        mode: CupertinoDatePickerMode.date,
        minimumYear: 2010,
        maximumYear: 2022,
      ),
    );
  }
}
