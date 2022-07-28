import 'package:flutter/material.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/view/widgets/top_titles.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';

class BottomSheetMultipleSelectionOptions extends StatelessWidget {
  final List<ButtonOptions> options;
  final String title;

  const BottomSheetMultipleSelectionOptions({
    Key? key,
    required this.options,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        DefaultTitle(
          key: Key('default-title'),
          alignment: Alignment.center,
          title: title,
        ),
        spaceH20(),
        Divider(
          color: CrayonPaymentColors.floralWhite,
        ),
        spaceH20(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  options[index].onPressed();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 56,
                  child: Text(
                    options[index].text,
                    style: Theme.of(context).textTheme.headline4?.copyWith(
                          fontSize: 16,
                          color: CrayonPaymentColors.crayonPayment040404,
                        ),
                  ),
                ),
              );
            },
            itemCount: options.length,
          ),
        ),
      ],
    );
  }
}
