import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/buttons/text_button.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class NetworkErrorScreen extends StatelessWidget {
  static const String viewPath = 'widget_library/network_error_screen';

  const NetworkErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CrayonPaymentScaffold(
      key: const Key('NetworkErrorScreen'),
      appBarAttributes: CrayonPaymentAppBarAttributes(
        key: Key('NetworkErrorScreen_BackButton'),
        left: [
          CrayonPaymentAppBarButtonType.back(),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(),
          spaceH10(),
          _buildSubtitle(),
          spaceH40(),
          _buildImage(),
          spaceH20(),
          _buildTextButton(),
          spaceH10(),
          _buildCrayonPaymentDockedButton(context),
        ],
      ),
    );
  }

  CrayonPaymentDockedButton _buildCrayonPaymentDockedButton(BuildContext context) {
    return CrayonPaymentDockedButton(
      key: const Key('NetworkErrorScreen_Refreshbutton'),
      title: 'refresh-button'.tr,
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  Center _buildTextButton() {
    return Center(
      child: CrayonPaymentTextButton(
        onPressed: () {

        },
        text: 'back-to-home-text'.tr,
      ),
    );
  }

  CrayonPaymentText _buildTitle() {
    return CrayonPaymentText(
      key: const Key('NetworkErrorScreen_Title'),
      text: TextUIDataModel(
        'network-err-title'.tr,
        styleVariant: CrayonPaymentTextStyleVariant.headline2,
        textAlign: TextAlign.left,
      ),
    );
  }

  CrayonPaymentText _buildSubtitle() {
    return CrayonPaymentText(
      key: const Key('NetworkErrorScreen_SubtiTitle'),
      text: TextUIDataModel(
        'network-err-subtitle'.tr,
        styleVariant: CrayonPaymentTextStyleVariant.headline4,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _buildImage() {
    return Center(
      child: Container(
        key: const Key('NetworkErrorScreen_Image'),
        child: SvgPicture.asset(
          'packages/widget_library/assets/images/Error_Nonetwork.svg',
        ),
      ),
    );
  }
}
