import 'dart:async';

import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/logging/logger.dart';
import 'package:core/view/base_view.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:shared_data_models/payments/payment_status_screen_args.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:get/get.dart';

import '../../../payments_module.dart';
import '../state/payment_status_state.dart';
import '../view_model/payment_status_coordinator.dart';
import 'package:widget_library/utils/app_utils.dart' as utill;

class PaymentStatusScreen extends StatefulWidget {
  static const viewPath = '${PaymentsModule.moduleIdentifier}/paymentStatus';
  final PaymentsStatusScreenArgs paymentsStatusScreenArgs;

  const PaymentStatusScreen({Key? key, required this.paymentsStatusScreenArgs})
      : super(key: key);

  @override
  State<PaymentStatusScreen> createState() => _PaymentStatusScreenState();
}

class _PaymentStatusScreenState extends State<PaymentStatusScreen> {
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void startTimer(PaymentStatusCoordinator coordinator) {
    const fiveSec = const Duration(seconds: 10);
    _timer = new Timer.periodic(
      fiveSec,
      (Timer timer) {
        coordinator.paymentCheckStatus(
            widget.paymentsStatusScreenArgs.paymentId, "100");
      },
    );
  }

  @override
  Widget build(BuildContext context) =>
      BaseView<PaymentStatusCoordinator, PaymentStatusState>(
        setupViewModel: (coordinator) => {startTimer(coordinator)},
        builder: (context, state, coordinator) =>
            _buildMainUi(coordinator, state, context),
      );

  Widget _buildMainUi(PaymentStatusCoordinator coordinator,
      PaymentStatusState state, BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.18),
              _buildImage(coordinator),
              SizedBox(height: 28),
              _buildTitle(coordinator, context),
              SizedBox(height: 60),
              _buildNotificationDesc(context),
              SizedBox(height: 24),
              _buildTimer(coordinator),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              _buildPaymentStatus(coordinator, context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              _buildNotes(),
            ],
          ),
        ),
      ),
    );
  }

  _buildImage(PaymentStatusCoordinator coordinator) {
    return Image.asset(
      "assets/images/airtel.png",
      height: 90,
      width: 90,
    );
  }

  _buildTitle(PaymentStatusCoordinator coordinator, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .12),
      child: CrayonPaymentText(
        key: Key('_Airtel_Pay_status'),
        text: TextUIDataModel(
            'PS_title'
                .tr
                .replaceAll("{amount}", widget.paymentsStatusScreenArgs.amount)
                .replaceAll(
                    "{mobile}", widget.paymentsStatusScreenArgs.mobileNumber),
            textAlign: TextAlign.center,
            styleVariant: CrayonPaymentTextStyleVariant.headline6,
            color: SECONDARY_COLOR,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  _buildNotificationDesc(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .12),
      child: CrayonPaymentText(
        key: Key('_Notification_status'),
        text: TextUIDataModel(
          'PS_notification'.tr,
          styleVariant: CrayonPaymentTextStyleVariant.headline5,
          color: SECONDARY_COLOR,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildTimer(
    PaymentStatusCoordinator coordinator,
  ) {
    return CountdownTimer(
      endTime: endTime,
      widgetBuilder: (_, time) {
        if (time == null) {
          _timer.cancel();
          Future.delayed(const Duration(milliseconds: 500), () {
            coordinator.navigateToPaymentFailure();
          });

          return Text('Time Expired');
        }
        String timeMinute = '';
        String timeSeconds = '';
        timeMinute = time.min.toString();
        timeSeconds = time.sec.toString();
        if (timeMinute == "null") {
          timeMinute = "0";
        }
        if (timeSeconds.length == 1) {
          timeSeconds = "0${timeSeconds}";
        }
        return Text('0${timeMinute}:${timeSeconds}',
            style: TextStyle(
                color: PRIMARY_COLOR,
                fontSize: 24,
                fontWeight: FontWeight.w600));
      },
    );
  }

  _buildPaymentStatus(
      PaymentStatusCoordinator coordinator, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * .12),
      child: RichTextDescription(
        onLinkClicked: (text, link) {
          // coordinator.navigateToPaymentSuccess();
          coordinator.paymentCheckStatus(
              widget.paymentsStatusScreenArgs.paymentId, "100");
        },
        textAlign: TextAlign.center,
        description: 'PS_refresh'.tr,
        key: const Key('payment_refresh_status'),
        linkTextStyle: PS_Refresh_text,
        descriptionTextStyle: PS_Notification_text,
      ),
    );
  }

  _buildNotes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CrayonPaymentText(
            key: Key('note'),
            text: TextUIDataModel('PS_note'.tr,
                styleVariant: CrayonPaymentTextStyleVariant.headline5,
                color: SU_carrier_message_color,
                fontWeight: FontWeight.w600),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('•'),
              SizedBox(
                width: 5,
              ),
              CrayonPaymentText(
                key: Key('note1'),
                text: TextUIDataModel('PS_note1'.tr,
                    styleVariant: CrayonPaymentTextStyleVariant.headline5,
                    color: SU_carrier_message_color,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('•'),
              SizedBox(
                width: 5,
              ),
              CrayonPaymentText(
                key: Key('note2'),
                text: TextUIDataModel('PS_note2'.tr,
                    styleVariant: CrayonPaymentTextStyleVariant.headline5,
                    color: SU_carrier_message_color,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
