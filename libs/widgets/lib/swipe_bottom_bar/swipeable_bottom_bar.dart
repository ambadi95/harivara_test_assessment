import 'package:flutter/material.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class CrayonPaymentSwipeableBottomBar extends StatelessWidget {
  final String title;
  final VoidCallback onSwiped;

  final Widget? background;
  final BoxDecoration? decoration;
  final CrayonPaymentTextStyleVariant? textStyleVariant;
  final double initialChildSize;

  const CrayonPaymentSwipeableBottomBar({
    Key? key,
    required this.onSwiped,
    required this.title,
    this.decoration,
    this.background,
    this.textStyleVariant,
    this.initialChildSize = 0.4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: NotificationListener<DraggableScrollableNotification>(
        onNotification: (notification) {
          if (notification.extent.toInt() == 1) {
            onSwiped();
          }
          return true;
        },
        child: DraggableScrollableSheet(
          key: Key('CrayonPaymentSwipeableBottomBar_DraggableScrollableSheet'),
          minChildSize: 0.2,
          initialChildSize: initialChildSize,
          maxChildSize: 1,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              key: Key('CrayonPaymentSwipeableBottomBar_Container'),
              color: Colors.transparent,
              child: SingleChildScrollView(
                key: Key(
                    'CrayonPaymentSwipeableBottomBar_SingleChildScrollView'),
                controller: scrollController,
                child: Stack(
                  children: [
                    if (background != null)
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: background,
                      ),
                    Container(
                      key:
                          Key('CrayonPaymentSwipeableBottomBar_ChildContainer'),
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        key: Key('CrayonPaymentSwipeableBottomBar_ChildColumn'),
                        children: [
                          Container(
                            key: Key(
                                'CrayonPaymentSwipeableBottomBar_ChildrenContainer'),
                            alignment: Alignment.center,
                            height: 100,
                            child: CrayonPaymentText(
                              text: TextUIDataModel(
                                title,
                                styleVariant: textStyleVariant,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
