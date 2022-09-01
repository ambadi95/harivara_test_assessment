import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:downpayment/downpayment_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:payments/viewmodel/payments_coordinator.dart';
import 'package:shared_data_models/payments/payments_screen_args.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

import '../payments_module.dart';
import '../state/payments_state.dart';

class PaymentsScreen extends StatefulWidget {
  static const viewPath = '${PaymentsModule.moduleIdentifier}/paymentsscreen';
  final PaymentsScreenArgs paymentsScreenArgs;

  const PaymentsScreen({Key? key, required this.paymentsScreenArgs})
      : super(key: key);

  @override
  State<PaymentsScreen> createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  final String _identifier = 'payments-screen';
  String paymentAmount = "";

  @override
  Widget build(BuildContext context) =>
      BaseView<PaymentsCoordinator, PaymentsState>(
          setupViewModel: (coordinator) async {
            coordinator.initialiseState(context);
            paymentAmount = widget.paymentsScreenArgs.price;
          },
          builder: (context, state, coordinator) => CrayonPaymentScaffold(
                appBarAttributes: CrayonPaymentAppBarAttributes(
                  key: const Key('PaymentsScreen_AppBarBackButton'),
                  left: [
                    const CrayonPaymentAppBarButtonType.back(),
                  ],
                ),
                bottomNavigationBar: _payNowButton(context, coordinator, state),
                body: state.when(
                  initialState: () => const SizedBox(),
                  ready: (
                    _,
                    __,
                    ___,
                  ) =>
                      _buildMainUIWithLoading(
                    context,
                    coordinator,
                    (state as PaymentsStateReady),
                  ),
                ),
              ));

  Widget _buildMainUIWithLoading(
    BuildContext context,
    PaymentsCoordinator coordinator,
    PaymentsStateReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(PaymentsStateReady state) {
    if (state.isLoading) {
      return Container(
        color: Colors.transparent,
        child: const CenteredCircularProgressBar(
            color: config_colors.PRIMARY_COLOR),
      );
    } else {
      return Container();
    }
  }

  Widget _buildMainUI(
    BuildContext context,
    PaymentsCoordinator coordinator,
    PaymentsStateReady state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        SizedBox(
          height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 10),
        ),
        _dailyRepaymentWidget(coordinator),
        SizedBox(
          height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 15),
        ),
        _airtlePayWidget()
      ],
    );
  }

  _dailyRepaymentWidget(PaymentsCoordinator coordinator) {
    return Container(
        height: 80,
        width: double.infinity,
        decoration: BoxDecoration(
          color: PS_DailyRepaymentContainerColor,
          borderRadius: BorderRadius.circular(5),
          border:
              Border.all(color: PS_DailyRepaymentContainerColor, width: 0.1),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Card(
                  color: White,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(
                      widget.paymentsScreenArgs.image,
                    ),
                  )),
              SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CrayonPaymentText(
                    key: Key('${_identifier}_daily_Repayment'),
                    text: TextUIDataModel(widget.paymentsScreenArgs.title.tr.replaceAll("\n", ""),
                        styleVariant: CrayonPaymentTextStyleVariant.headline5,
                        color: VO_ResendTextColor,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: AppUtils.appUtilsInstance
                        .getPercentageSize(percentage: 2),
                  ),
                  CrayonPaymentText(
                    key: Key('${_identifier}_daily_repayment_price'),
                    text: TextUIDataModel(paymentAmount,
                        styleVariant: CrayonPaymentTextStyleVariant.headline6,
                        color: SECONDARY_COLOR,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  _airtlePayWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrayonPaymentText(
          key: Key('${_identifier}_Wallets_title'),
          text: TextUIDataModel('PP_Wallets_Title'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline5,
              color: WB_EnterPassCodeTitleColor,
              fontWeight: FontWeight.w400),
        ),
        dynamicHSpacer(10),
        Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: PS_AirtelPayContainerColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Color(0xff263238), width: 0.1),
            ),
            child: Padding(
              padding:
                  EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset("assets/images/airtel.png"),
                  SizedBox(width: 10),
                  CrayonPaymentText(
                    key: Key('${_identifier}_Airtel_Pay'),
                    text: TextUIDataModel('PP_Airtel_Pay'.tr,
                        styleVariant: CrayonPaymentTextStyleVariant.headline4,
                        color: SECONDARY_COLOR,
                        fontWeight: FontWeight.w600),
                  ),
                  Spacer(),
                  Radio(
                    value: 1,
                    groupValue: 1,
                    activeColor: SU_button_color,
                    onChanged: (value) {},
                  )
                ],
              ),
            )),
      ],
    );
  }

  Widget _payNowButton(
    BuildContext context,
    PaymentsCoordinator coordinator,
    PaymentsState state,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          await coordinator.paymentApi(
            "2000" /*widget.paymentsScreenArgs.price*/,
            "Repayment",
            context,
          );
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: SU_button_color, borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'PP_PayNow'.tr + " " + paymentAmount,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_Payments_title'),
      text: const TextUIDataModel('Payments',
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }
}
