import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/refund_expandable_details/widgets/refund_exapnd_details_middle_row.dart';
import 'package:widget_library/refund_expandable_details/widgets/refund_expand_details_bottom_row.dart';
import 'package:widget_library/refund_expandable_details/widgets/refund_expand_details_divider.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:get/get.dart';

class RefundExpandableDetails extends StatefulWidget {
  final RefundExpandDetailsBottomRow refundexpandDetailsBottomRow;
  final RefundExpandDetailsMiddleRow refundExpandDetailsMiddleRow;
  final List<dynamic> itemsWhenExpanded;
  final bool shouldShowOpenDetails;
  final bool shouldBeginAsExpanded;
  final bool isRefund;

  const RefundExpandableDetails({
    required this.refundexpandDetailsBottomRow,
    required this.refundExpandDetailsMiddleRow,
    required this.itemsWhenExpanded,
    this.shouldShowOpenDetails = false,
    this.shouldBeginAsExpanded = false,
    required this.isRefund,
    Key? key,
  }) : super(key: key);

  @override
  _RefundExpandableDetailsState createState() =>
      _RefundExpandableDetailsState();
}

class _RefundExpandableDetailsState extends State<RefundExpandableDetails> {
  late bool _isExpanded;
  late bool _isRefund;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.shouldBeginAsExpanded;
    _isRefund = widget.isRefund;
    if (!widget.shouldShowOpenDetails) {
      _isExpanded = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('gesture_detector'),
      onTap: _expandWidget,
      child: Container(
        padding: EdgeInsets.all(CrayonPaymentDimensions.inlineFieldsMargin),
        decoration: _buildBoxDecoration,
        child: Column(
          children: widget.itemsWhenExpanded.length == 1
              ? [
                  widget.itemsWhenExpanded[0],
                  RefundExpandDetailsDivider(),
                  widget.refundexpandDetailsBottomRow,
                ]
              : [
                  if (widget.shouldShowOpenDetails) _buildTopRow,
                  if (_isExpanded) ...[
                    spaceH10(),
                    ...widget.itemsWhenExpanded
                        .map(
                          (e) => Padding(
                            padding: EdgeInsets.symmetric(vertical:2),
                            child: e,
                          ),
                        )
                        .toList()
                  ],
                  RefundExpandDetailsDivider(),
                  widget.refundExpandDetailsMiddleRow,
                  RefundExpandDetailsDivider(),
                  widget.refundexpandDetailsBottomRow
                ],
        ),
      ),
    );
  }

  void _expandWidget() {
    if (widget.shouldShowOpenDetails && widget.itemsWhenExpanded.isNotEmpty) {
      setState(() => _isExpanded = !_isExpanded);
    }
  }

  BoxDecoration get _buildBoxDecoration {
    return BoxDecoration(
      color: CrayonPaymentColors.crayonPaymentGold.withAlpha(25),
      borderRadius: BorderRadius.circular(8),
    );
  }

  Row get _buildTopRow {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CrayonPaymentText(
          key: const Key('title_text'),
          text: TextUIDataModel(
            _isRefund
                ? 'transaction_details_refund_details'.tr
                : _isExpanded
                    ? 'less-details'.tr
                    : 'open-details'.tr,
            color: CrayonPaymentColors.crayonPaymentGold,
            styleVariant: CrayonPaymentTextStyleVariant.headline5,
          ),
        ),
        Icon(
          _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: CrayonPaymentColors.crayonPaymentGold,
          key: const Key('arrow_icon'),
        )
      ],
    );
  }
}
