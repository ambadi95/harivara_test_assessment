import 'package:flutter/material.dart';

class LabelCheckBox extends StatelessWidget {
  final String label;
  void Function(bool?)? onChange;
  final bool value;
   LabelCheckBox({Key? key,required this.label,required this.onChange,required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(label),
      value: value,
      onChanged: onChange
    );
  }
}
