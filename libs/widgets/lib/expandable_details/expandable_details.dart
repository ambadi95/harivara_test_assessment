import 'package:core/retrievers/app_info_retriever.dart';
import 'package:core/retrievers/data_models/app_type.dart';
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
  final AppInfoRetriever? appInfoRetriever;
  final List<Widget>? expandDetailsBottomRow;
  final List<Widget> itemsWhenExpanded;
  final bool shouldShowOpenDetails;
  final bool shouldBeginAsExpanded;
  final String? topTitleText;
  final Color? _topTitleColor;
  final CrayonPaymentTextStyleVariant? _topTitleStyleVariant;
  final Color? _boxColor;
  final EdgeInsetsGeometry? _boxPadding;
  final Color? dividerColor;
  final EdgeInsetsGeometry? dividerPadding;
  final Color? _expansaionArrowColor;
  final bool? _displayDividerBeforeItems;
  final bool? _gestureDetectorOnWholeContainer;

  ExpandableDetails({
    this.appInfoRetriever,
    this.expandDetailsBottomRow,
    required this.itemsWhenExpanded,
    this.shouldShowOpenDetails = true,
    this.shouldBeginAsExpanded = false,
    this.topTitleText,
    Color? topTitleColor,
    CrayonPaymentTextStyleVariant? topTitleStyleVariant,
    Color? boxColor,
    EdgeInsetsGeometry? boxPadding,
    this.dividerColor,
    this.dividerPadding,
    Color? expansionArrowColor,
    bool? displayDividerBeforeItems,
    bool? gestureDetectorOnWholeContainer,
    Key? key,
  })  : _boxColor = boxColor ?? CrayonPaymentColors.floralWhite,
        _boxPadding = boxPadding ??
            EdgeInsets.all(CrayonPaymentDimensions.inlineFieldsMargin),
        _topTitleColor = topTitleColor ?? CrayonPaymentColors.crayonPaymentGold,
        _topTitleStyleVariant =
            topTitleStyleVariant ?? CrayonPaymentTextStyleVariant.headline5,
        _expansaionArrowColor =
            expansionArrowColor ?? CrayonPaymentColors.crayonPaymentGold,
        _displayDividerBeforeItems = displayDividerBeforeItems ?? false,
        _gestureDetectorOnWholeContainer =
            gestureDetectorOnWholeContainer ?? true,
        super(key: key);

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
    return widget._gestureDetectorOnWholeContainer!
        ? GestureDetector(
            key: const Key('gesture_detector'),
            onTap: _expandWidget,
            child: _buildMainUi,
          )
        : _buildMainUi;
  }

  BoxDecoration get _buildBoxDecoration {
    return BoxDecoration(
      color: widget._boxColor,
      borderRadius: BorderRadius.circular(8),
    );
  }

  void _expandWidget() {
    if (widget.shouldShowOpenDetails && widget.itemsWhenExpanded.isNotEmpty) {
      setState(() => _isExpanded = !_isExpanded);
    }
  }

  Widget get _buildMainUi => Container(
        padding: widget._boxPadding,
        decoration: _buildBoxDecoration,
        child: Column(
          children: [
            if (widget.shouldShowOpenDetails)
              widget._gestureDetectorOnWholeContainer!
                  ? _buildTopRow
                  : _buildTopRowWithGestureDetector,
            if (widget._displayDividerBeforeItems! && _isExpanded)
              displayDivider,
            if (_isExpanded) ...[
              if (!widget._displayDividerBeforeItems!) spaceH10(),
              ...widget.itemsWhenExpanded
                  .map(
                    (e) => Column(
                      /// Avoid use of Padding to get OverflowBox to work
                      children: [
                        dynamicHSpacer(1),
                        e,
                        dynamicHSpacer(1),
                      ],
                    ),
                  )
                  .toList()
            ],
            if (widget.appInfoRetriever?.appType is CustomerApp) displayDivider,
            if (widget.expandDetailsBottomRow != null)
              ...widget.expandDetailsBottomRow!
          ],
        ),
      );

  Widget get _buildTopRowWithGestureDetector => GestureDetector(
        key: const Key('gesture_detector'),
        onTap: _expandWidget,
        child: _buildTopRow,
      );

  Widget get _buildTopRow {
    return Row(
      children: [
        CrayonPaymentText(
          key: const Key('title_text'),
          text: TextUIDataModel(
            widget.appInfoRetriever?.appType is CustomerApp
                ? _isExpanded
                    ? 'expandable-details-widget-less'.tr
                    : 'expandable-details-widget-open'.tr
                : widget.topTitleText!,
            color: widget._topTitleColor,
            styleVariant: widget._topTitleStyleVariant,
          ),
        ),
        Expanded(
          child: Container(
            height: 20,
            color: Colors.transparent,
          ),
        ),
        Icon(
          _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
          color: widget._expansaionArrowColor,
          key: const Key('arrow_icon'),
        )
      ],
    );
  }

  Widget get displayDivider => ExpandDetailsDivider(
        dividerColor: widget.dividerColor,
        dividerPadding: widget.dividerPadding,
      );
}
