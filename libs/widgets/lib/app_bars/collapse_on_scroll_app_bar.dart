import 'package:flutter/material.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

/// Use this Widget as the body of your Scaffold.
/// [body] arg is the UI underneath the app bar
/// [appBarTitle] is the String shown in the appBar
class CollapseOnScrollAppBar extends StatelessWidget {
  final Widget body;
  final String appBarTitle;
  final ScrollController? scrollController;

  const CollapseOnScrollAppBar({
    required this.body,
    required this.appBarTitle,
    this.scrollController,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.11,
            floating: false,
            elevation: 0,
            pinned: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: _builtTitle(context),
            ),
          ),
        ];
      },
      body: body,
    );
  }

  CrayonPaymentText _builtTitle(BuildContext context) {
    return CrayonPaymentText(
      key: const Key('top_title'),
      text: TextUIDataModel(
        appBarTitle,
        styleVariant: CrayonPaymentTextStyleVariant.headline4,
      ),
    );
  }
}
