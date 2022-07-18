import 'package:flutter/material.dart';
import 'package:core/view/base_view.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:task_manager/base_classes/base_view_model.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';

class ThemedBaseView<VM extends BaseViewModel<S?>, S> extends StatelessWidget {
  const ThemedBaseView({
    Key? key,
    required this.themeName,
    required this.baseWidgetBuilder,
    required this.setupViewModel,
    this.titleText,
  }) : super(key: key);

  final String themeName;
  final Widget Function(BuildContext, S?, VM) baseWidgetBuilder;
  final Function(VM) setupViewModel;
  final String? titleText;

  @override
  Widget build(BuildContext context) {
    return BaseView<VM, S?>(
      setupViewModel: setupViewModel,
      builder: (context, state, viewmodel) {
        return CrayonPaymentScaffold(
          themeName: themeName,
          appBarAttributes: CrayonPaymentAppBarAttributes(
            title: titleText,
            left: [
              CrayonPaymentAppBarButtonType.back(),
            ],
          ),
          body: baseWidgetBuilder(context, state, viewmodel),
        );
      },
    );
  }
}
