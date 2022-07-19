import 'package:core/ioc/di_container.dart';
import 'package:core/navigation/navigation_manager.dart';
import 'package:core/navigation/navigation_type.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/buttons/crayon_payment_back_button.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/padding.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class CardListErrorScreen extends StatelessWidget {
  static const CrayonPaymentPadding _buttonPadding =
      CrayonPaymentPadding(left: 20.0, right: 20.0);

  const CardListErrorScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('CardListErrorScreenView'),
      backgroundColor: Colors.white,
      appBar: _buildAppBar,
      body: Padding(
        padding: const EdgeInsets.only(
          left: CrayonPaymentDimensions.defaultMargin,
          right: CrayonPaymentDimensions.defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: CrayonPaymentText(
                key: const Key('CardListErrorScreen_Title'),
                text: TextUIDataModel(
                  'card-list-error-title'.tr,
                  styleVariant: CrayonPaymentTextStyleVariant.headline2,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            _buildDynamicSizedBox(context, .02),
            CrayonPaymentText(
              key: const Key('CardListErrorScreen_Subtitle'),
              text: TextUIDataModel(
                'card-list-error-subtitle'.tr,
                styleVariant: CrayonPaymentTextStyleVariant.headline5,
                textAlign: TextAlign.start,
              ),
            ),
            _buildDynamicSizedBox(context, .04),
            Center(
              child: Container(
                height: 298,
                key: const Key('CardListErrorScreen_ErrorScreenImage'),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'packages/add_card/assets/add_card/Error_Screen.jpg',
                    ),
                  ),
                ),
              ),
            ),
            _buildDynamicSizedBox(context, .08),
            _buildtextButton(context),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      key: const Key('CardListErrorScreen_AppdBar'),
      elevation: 0,
      leading: const CrayonPaymentBackButton(
        key: Key('CardListErrorScreen_AppBarBackButton'),
        color: Colors.black,
      ),
    );
  }

  CrayonPaymentDockedButton _buildtextButton(BuildContext context) => CrayonPaymentDockedButton(
        key: const Key('CardListErrorScreen_OKButton'),
        title: 'card-list-error-ok-button'.tr,
        padding: _buttonPadding,
        onPressed: () {
          // TODO: refactor below

        },
      );
}

SizedBox _buildDynamicSizedBox(BuildContext context, double height) => SizedBox(
      height: MediaQuery.of(context).size.height * height,
    );
