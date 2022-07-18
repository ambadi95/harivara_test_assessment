import 'package:flutter/material.dart';
import 'package:core/view/base_view.dart';
import 'package:widget_library/helpers/error/viewmodel/error_view_model.dart';
import 'package:widget_library/success_screen/success_screen_widget.dart';
import 'package:widget_library/success_screen/success_screen_widget_attributes.dart';

class ErrorView extends StatelessWidget {
  final Map<String, dynamic>? args;

  const ErrorView({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ErrorViewModel, SuccessScreenBaseWidgetAttributes?>(
      setupViewModel: (viewModel) {
        viewModel.initialize(args);
      },
      builder: (context, state, viewmodel) {
        return SuccessScreenWidget(
          attributes: state!,
        );
      },
    );
  }
}
