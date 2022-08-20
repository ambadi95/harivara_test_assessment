/*
import 'package:flutter/material.dart';
import 'package:kyc_credit/kyccredit/view_model/kyccredit_coordinator.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:config/Colors.dart';
import 'package:get/get.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
class KycCreditView extends StatefulWidget {
  final String _identifier = 'kyccredit';

  const KycCreditView({Key? key}) : super(key: key);

  @override
  _KycCreditViewState createState() => _KycCreditViewState();
}

class _KycCreditViewState extends State<KycCreditView> {
  @override
  Widget build(BuildContext context) {
    return CrayonPaymentScaffold(

      body: Container(),
    );
  }

  Widget _buildTitle(context, KycCreditCoordinator coordinator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => coordinator.goBack(),
          child: const Icon(Icons.arrow_back),
        ),
        const SizedBox(
          height: 10,
        ),
        CrayonPaymentText(
          key: Key('${widget._identifier}_TC_Title'),
          text: TextUIDataModel('TC_Title'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
              color: SU_title_color,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.left),
        ),
        const SizedBox(
          height: 20,
        ),
        CrayonPaymentText(
          key: Key('${widget._identifier}_TC_Last_Updated'),
          text: TextUIDataModel('TC_LastUpdated'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline4,
              color: SU_title_color,
              fontWeight: FontWeight.normal,
              textAlign: TextAlign.left),
        ),
      ],
    );
  }
}
*/
