import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/expandable_details/data_model/expandable_details_options.dart';
import 'package:widget_library/expandable_details/widgets/expand_details_divider.dart';
import 'package:widget_library/expandable_details/widgets/expand_details_info_line.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

/// [expandDetailsBottomRow] obligatory and will always be shown
///
/// [itemsWhenExpanded] can be any item which extends [ExpandableDetailsOptions]
/// like for example [ExpandDetailsDivider] or [ExpandDetailsInfoLine]
class ExpandableDetails extends StatefulWidget {
  final List<ExpandableDetailsOptions> expandDetailsBottomRow;
  final List<ExpandableDetailsOptions> itemsWhenExpanded;
  final bool shouldShowOpenDetails;
  final bool shouldBeginAsExpanded;
  final String? topTitleText;

  const ExpandableDetails({
    required this.expandDetailsBottomRow,
    required this.itemsWhenExpanded,
    this.shouldShowOpenDetails = true,
    this.shouldBeginAsExpanded = false,
    this.topTitleText,
    Key? key,
  }) : super(key: key);

  @override
  _ExpandableDetailsState createState() => _ExpandableDetailsState();
}

class _ExpandableDetailsState extends State<ExpandableDetails> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.shouldBeginAsExpanded;
    if (!widget.shouldShowOpenDetails) {
      _isExpanded = true;
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
          children: [
            if (widget.shouldShowOpenDetails) _buildTopRow,
            if (_isExpanded) ...[
              spaceH10(),
              ...widget.itemsWhenExpanded
                  .map(
                    (e) => Padding(
                      padding: EdgeInsets.symmetric(vertical: 2),
                      child: e,
                    ),
                  )
                  .toList()
            ],
            ExpandDetailsDivider(),
            ...widget.expandDetailsBottomRow
          ],
        ),
      ),
    );
  }

  BoxDecoration get _buildBoxDecoration {
    return BoxDecoration(
      color: CrayonPaymentColors.crayonPaymentGold.withAlpha(25),
      borderRadius: BorderRadius.circular(8),
    );
  }

  void _expandWidget() {
    if (widget.shouldShowOpenDetails && widget.itemsWhenExpanded.isNotEmpty) {
      setState(() => _isExpanded = !_isExpanded);
    }
  }

  Row get _buildTopRow {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CrayonPaymentText(
          key: const Key('title_text'),
          text: TextUIDataModel(
            widget.topTitleText == null
                ? _isExpanded
                    ? 'less-details'.tr
                    : 'open-details'.tr
                : widget.topTitleText!,
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
