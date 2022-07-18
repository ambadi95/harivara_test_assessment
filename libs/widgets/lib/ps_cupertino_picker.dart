import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:core/utils/extensions/string_extensions.dart';
import 'package:widget_library/theme/crayon_payment_theme.dart';
import 'package:widget_library/utils/icon_utils.dart';

class _Constant {
  static const paddingHorizontal = 16.0;
  static const paddingVertical = 8.0;
}

class CrayonPaymentCupertinoPicker extends StatelessWidget {
  final List<String> values;

  final Function(String) onValuePicked;
  final TextStyle? labelStyle;
  final String? label;
  final String? value;
  final String? hint;
  final InputBorder? border;
  const CrayonPaymentCupertinoPicker({
    Key? key,
    required this.values,
    required this.onValuePicked,
    this.labelStyle,
    this.label,
    this.value,
    this.hint,
    this.border,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var showOnlyHint = value!.isEmpty;
    return InkWell(
      key: Key('CrayonPaymentCupertinoPicker_InkWell'),
      onTap: () => _showPicker(context),
      child: Container(
        key: Key('CrayonPaymentCupertinoPicker_Container'),
        height: 60,
        decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(4.0),
            topRight: const Radius.circular(4.0),
            bottomLeft: const Radius.circular(4.0),
            bottomRight: const Radius.circular(4.0),
          ),
          color:
              CrayonPaymentTheme().defaultThemeData.textFieldBackgroundColor?.toColor(),
        ),
        child: Center(
          key: Key('CrayonPaymentCupertinoPicker_Center'),
          child: Padding(
            key: Key('CrayonPaymentCupertinoPicker_Padding'),
            padding: const EdgeInsets.symmetric(
              vertical: _Constant.paddingVertical,
              horizontal: _Constant.paddingHorizontal,
            ),
            child: Column(
              key: Key('CrayonPaymentCupertinoPicker_Column'),
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: showOnlyHint
                  ? MainAxisAlignment.center
                  : MainAxisAlignment.start,
              children: [
                Visibility(
                  key: Key('CrayonPaymentCupertinoPicker_ChildrenVisibility'),
                  visible: !showOnlyHint,
                  child: Text(
                    hint!,
                    style: Theme.of(context)
                        .inputDecorationTheme
                        .hintStyle!
                        .copyWith(fontSize: 11),
                  ),
                ),
                Row(
                  key: Key('CrayonPaymentCupertinoPicker_Row'),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      (!showOnlyHint ? value : hint)!,
                      key: Key('CrayonPaymentCupertinoPicker_ValueText'),
                      style:
                          labelStyle ?? Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      key: Key('CrayonPaymentCupertinoPicker_AfterTextSizedBox'),
                      width: 10,
                    ),
                    getSvg('widget_library:assets/images/ic_chevron.svg')
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPicker(BuildContext context) {
    var initialIndex = values.indexWhere((element) => element.contains(value!));

    showCupertinoModalPopup(
      context: context,
      builder: (ctx) => Container(
        key: Key('_showPickerContainer'),
        height: 250,
        child: CupertinoPicker(
          key: Key('_showPickerCupertinoPicker'),
          backgroundColor: Colors.white,
          itemExtent: 30,
          scrollController:
              FixedExtentScrollController(initialItem: initialIndex),
          onSelectedItemChanged: (itemIndex) {
            onValuePicked(values[itemIndex]);
          },
          children: List.generate(
            values.length,
            (index) => Text(
              values[index],
              key: Key('_showPickerValuesText'),
            ),
          ),
        ),
      ),
    );
  }
}
