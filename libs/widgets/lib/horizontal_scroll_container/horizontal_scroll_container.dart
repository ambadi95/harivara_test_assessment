import 'package:flutter/material.dart';
import 'package:widget_library/colors/crayon_payment_colors.dart';

class HorizontalScrollItem<T> {
  final Key? key;
  final T item;
  final String uiString;

  HorizontalScrollItem({
    this.key,
    required this.item,
    required this.uiString,
  });
}

/// Where [T] is the type of the items being passed
class HorizontalScroll<T> extends StatefulWidget {
  static const bool _scrollable = false;
  static const double _fontSize = 16.0;
  static const double _selectionBorderRadius = 16.0;
  static const double _horizontalInBoxPadding = 36.0;

  final List<HorizontalScrollItem<T>> elements;
  final bool? scrollable;
  final double? fontSize;
  final double? selectionBorderRadius;
  final Function(dynamic, dynamic)? onChanged;

  /// Use selectedIndex if the HorizontalScroll rebuils during lifetime
  final int? selectedIndex;

  /// Symmetric padding of the element
  final double? elementPadding;

  /// Symmetric padding inside the border of the element
  final double? horizontalInBoxPadding;

  const HorizontalScroll({
    Key? key,
    required this.elements,
    this.onChanged,
    bool? scrollable,
    double? fontSize,
    double? selectionBorderRadius,
    double? elementPadding,
    double? horizontalInBoxPadding,
    this.selectedIndex,
  })  : scrollable = scrollable ?? _scrollable,
        fontSize = fontSize ?? _fontSize,
        selectionBorderRadius = selectionBorderRadius ?? _selectionBorderRadius,
        elementPadding = elementPadding,
        horizontalInBoxPadding =
            horizontalInBoxPadding ?? _horizontalInBoxPadding,
        super(key: key);

  @override
  _HorizontalScrollState createState() => _HorizontalScrollState<T>();
}

class _HorizontalScrollState<T> extends State<HorizontalScroll> {
  static late EdgeInsetsDirectional _firstElementPadding;
  static late EdgeInsets _elementPadding;
  late int selectedIndex;

  @override
  void initState() {
    _setElementPadding();
    selectedIndex = widget.selectedIndex ?? 0;
    super.initState();
  }

  final String _identifier = 'HorizontalScroll';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      key: Key(_identifier),
      builder: (context, constraints) => widget.elements.isNotEmpty
          ? Container(
              height: 35,
              child: ListView.builder(
                physics:
                    widget.scrollable! ? null : NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: widget.elements.length,
                itemBuilder: (context, index) => buildElement(index),
              ),
            )
          : Container(),
    );
  }

  Widget buildElement(int index) {
    return GestureDetector(
      onTap: () {
        setState(() => selectedIndex = index);
        widget.onChanged?.call(widget.elements[index].item, selectedIndex);
      },
      child: Padding(
        /// Padding between elements
        padding: index != 0 ? _elementPadding : _firstElementPadding,
        key: widget.elements.elementAt(index).key,
        child: Container(
          alignment: Alignment.center,

          /// Padding inside the border
          padding: _checkIndex(selectedIndex, index)
              ? EdgeInsets.symmetric(horizontal: widget.horizontalInBoxPadding!)
              : null,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.selectionBorderRadius!),
            border: Border.all(
              color: _checkIndex(selectedIndex, index)
                  ? CrayonPaymentColors.crayonPaymentBlack
                  : Colors.transparent,
              width: 1,
            ),
          ),
          child: Text(
            widget.elements.elementAt(index).uiString,
            key: Key('selected-container-$index'),
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  fontSize: widget.fontSize,
                  color: _checkIndex(selectedIndex, index)
                      ? CrayonPaymentColors.crayonPaymentBlack
                      : CrayonPaymentColors.crayonPaymentGold,
                ),
          ),
        ),
      ),
    );
  }

  void _setElementPadding() {
    if (widget.elementPadding != null) {
      _firstElementPadding = EdgeInsetsDirectional.only(
        end: widget.elementPadding! / 2,
      );
      _elementPadding =
          EdgeInsets.symmetric(horizontal: widget.elementPadding!);
    } else {
      _firstElementPadding = _HorizontalScrollPadding.firstElementPadding;
      _elementPadding = _HorizontalScrollPadding.elementPadding;
    }
  }

  bool _checkIndex(int selectedIndex, int currentIndex) {
    return selectedIndex == currentIndex ? true : false;
  }
}

class _HorizontalScrollPadding {
  static final double _padding = 17.0;

  static EdgeInsetsDirectional firstElementPadding = EdgeInsetsDirectional.only(
    end: _padding,
  );
  static EdgeInsets elementPadding = EdgeInsets.symmetric(horizontal: _padding);
}
