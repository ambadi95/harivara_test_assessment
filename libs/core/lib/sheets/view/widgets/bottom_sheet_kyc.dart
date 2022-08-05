import 'package:flutter/material.dart';
import 'package:core/sheets/coordinator/crayon_payment_bottom_sheet_coordinator.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class BottomSheetKyc extends StatelessWidget {
  final CrayonPaymentBottomSheetCoordinator coordinator;
  final String title;
  final List<String> listItemsToShow;
  final Function onItemSelected;
  final int selectedItemIndex;
  final ValueNotifier<int> _selectedItem = ValueNotifier<int>(-1);

  BottomSheetKyc({
    Key? key,
    required this.coordinator,
    required this.title,
    required this.listItemsToShow,
    required this.onItemSelected,
    required this.selectedItemIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _selectedItem.value = selectedItemIndex;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.minimize,
          size: 20,
        ),
        SizedBox(
          height: 15,
        ),
        CrayonPaymentText(
          key: const Key('BottomSheetKycTitle'),
          text: TextUIDataModel(
            title,
            styleVariant: CrayonPaymentTextStyleVariant.headline6,
            color: CrayonPaymentColors.crayonPayment0A0403,
          ),
        ),
        Divider(
          color: CrayonPaymentColors.floralWhite,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: listItemsToShow.length,
            itemBuilder: (BuildContext context, int index) {
              return ValueListenableBuilder<int>(
                valueListenable: _selectedItem,
                builder: (BuildContext context, int value, Widget? child) {
                  return InkWell(
                    onTap: () {
                      _selectedItem.value = index;
                      onItemSelected(index);
                    },
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 48),
                      child: Container(
                        decoration: BoxDecoration(
                          color: value == index
                              ? CrayonPaymentColors.crayonPayment0A0403
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                        child: Center(
                          child: CrayonPaymentText(
                            key: const Key('BottomSheetKycTitle'),
                            text: TextUIDataModel(
                              listItemsToShow[index],
                              styleVariant:
                                  CrayonPaymentTextStyleVariant.bodyText2,
                              color: CrayonPaymentColors.homeTitleColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
