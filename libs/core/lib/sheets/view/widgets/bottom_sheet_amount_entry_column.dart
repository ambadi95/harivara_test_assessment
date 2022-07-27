import 'package:core/sheets/view/widgets/top_titles.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class BottomSheetAmountEntryColumn extends StatelessWidget {
  final List<double> amount;
  final ValueChanged<int> onDelete;

  const BottomSheetAmountEntryColumn({
    Key? key,
    required this.amount,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTopLine,
          spaceH20(),
          DefaultTitle(
            key: Key('default-title'),
            alignment: Alignment.center,
            title: 'Entries(${amount.length})',
          ),
          spaceH20(),
          Divider(
            color: CrayonPaymentColors.boxDecColor,
          ),
          spaceH20(),
          Expanded(
            child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding: EdgeInsets.all(CrayonPaymentDimensions.defaultMargin),
                key: Key('listView'),
                shrinkWrap: false,
                itemCount: amount.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(amount[index].toString()),
                      TextButton(
                          onPressed: () {
                            onDelete(index);
                          },
                          child: Text('payment-request-screen-delete'.tr)),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get _buildTopLine {
    return Align(
      child: Container(
        height: 4.0,
        width: 46.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          color: CrayonPaymentColors.crayonPayment0A0403,
        ),
      ),
    );
  }
}
