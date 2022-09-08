import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/payments/payment_sucess_screen_args.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:get/get.dart';
import 'package:widget_library/utils/launcher_utils.dart';
import '../../../payments_module.dart';
import '../state/payment_status_state.dart';
import '../view_model/payment_status_coordinator.dart';

class PaymentSuccessScreen extends StatelessWidget {
  static const viewPath = '${PaymentsModule.moduleIdentifier}/paymentSuccess';

  final PaymentSuccessScreenArgs screenArgs;

  const PaymentSuccessScreen({Key? key, required this.screenArgs})
      : super(key: key);

  @override
  Widget build(BuildContext context)  =>
      BaseView<PaymentStatusCoordinator, PaymentStatusState>(
        setupViewModel: (coordinator) => () {},
        builder: (context, state, coordinator) =>
            _buildMainUi(coordinator, state, context),
      );

  Widget _buildMainUi(PaymentStatusCoordinator coordinator,
      PaymentStatusState state, BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.20),
                  Image.asset(ES_succes_icon, height: 90, width: 90),
                  SizedBox(height: 28),
                  _buildTitle(screenArgs.amount),
                  SizedBox(height: 16),
                  _buildReferenceId(screenArgs.paymentId),
                  SizedBox(height: 28),
                  _buildDescription(context),
                  SizedBox(height: 32),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * .12),
                    child: Divider(),
                  ),
                  SizedBox(height: 32),
                  _buildSubTitle(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                ],
              ),
              Column(
                children: [
                  _buildCustomerSupport(),
                  SizedBox(height: 20),
                  _buildCloseButton(context,coordinator),
                  SizedBox(height: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  _buildTitle(String amount) {
    return CrayonPaymentText(
      key: Key('PS_success_title'),
      text: TextUIDataModel('PS_success_title'.tr.replaceAll("{}", screenArgs.amount),
          styleVariant: CrayonPaymentTextStyleVariant.headline5,
          color: SU_carrier_message_color,
          textAlign: TextAlign.center,
          fontWeight: FontWeight.w600),
    );
  }

  _buildReferenceId(String referenceId) {
    return CrayonPaymentText(
      key: Key('PS_reference'),
      text: TextUIDataModel('PS_reference'.tr.replaceAll("{}", screenArgs.paymentId),
          styleVariant: CrayonPaymentTextStyleVariant.headline5,
          color: SU_carrier_message_color,
          fontWeight: FontWeight.w600),
    );
  }

  _buildDescription(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .12),
      child: CrayonPaymentText(
        key: Key('PS_thank_note'),
        text: TextUIDataModel('PS_thank_note',
            styleVariant: CrayonPaymentTextStyleVariant.headline5,
            textAlign: TextAlign.center,
            color: SU_carrier_message_color,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  _buildSubTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .12),
      child: CrayonPaymentText(
        key: Key('PS_success_note'),
        text: TextUIDataModel('PS_success_note',
            textAlign: TextAlign.center,
            styleVariant: CrayonPaymentTextStyleVariant.headline5,
            color: SU_carrier_message_color,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  _buildCustomerSupport() {
    return InkWell(
      onTap: (){
        LauncherUtils.launcherUtilsInstance
            .makePhoneCall(phoneNumber: LauncherUtils.CONTACT_NUMBER);
      },
      child: CrayonPaymentText(
        key: Key('PS_customer_support'),
        text: TextUIDataModel('PS_customer_support',
            styleVariant: CrayonPaymentTextStyleVariant.headline5,
            color: SU_carrier_message_color,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  _buildCloseButton(BuildContext context,PaymentStatusCoordinator coordinator) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CrayonPaymentDockedButton(
          title: "PS_close",
          onPressed: () {
            coordinator.navigateToHome();
          },
          borderRadius: 8,
          buttonColor: PRIMARY_COLOR),
    );
  }
}
