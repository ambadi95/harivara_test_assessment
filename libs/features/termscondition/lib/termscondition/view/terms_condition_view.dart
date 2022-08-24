import 'package:config/Colors.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

import '../state/termscondition_state.dart';
import '../termscondition_module.dart';
import '../view_model/termscondition_coordinator.dart';

class CrayonTermsCondition extends StatefulWidget {
  final String _identifier = 'termscondition';
  static const String viewPath =
      '${TermsConditionModule.moduleIdentifier}/termscondition';

  const CrayonTermsCondition({Key? key}) : super(key: key);

  @override
  State<CrayonTermsCondition> createState() => _CrayonTermsConditionState();
}

class _CrayonTermsConditionState extends State<CrayonTermsCondition> {
  @override
  Widget build(BuildContext context) =>
      BaseView<TermsConditionCoordinator, TermsConditionState>(
        setupViewModel: (coordinator) async {},
        builder: (context, state, coordinator) => Scaffold(
          body: SafeArea(child: _buildMainUI(context, coordinator, state)),
        ),
      );

  Widget _buildMainUI(BuildContext context,
      TermsConditionCoordinator coordinator, TermsConditionState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, left: 17, right: 17, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 3, child: _buildTitle(context, coordinator)),
          Expanded(flex: 7, child: _belowView(context)),
        ],
      ),
    );
  }

  Widget _buildTitle(context, TermsConditionCoordinator coordinator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
            onTap: () => coordinator.goBack(),
            child: const Icon(Icons.arrow_back)),
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

  Widget _buildDescription(context) {
    return CrayonPaymentText(
      key: Key('${widget._identifier}_TC_Description'),
      text: TextUIDataModel('TC_Description'.tr,
          styleVariant: CrayonPaymentTextStyleVariant.headline4,
          color: TC_DescriptionColor,
          fontWeight: FontWeight.w400),
    );
  }

  Widget _buildOptions(context, String label, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CrayonPaymentText(
            key: Key('${widget._identifier}_TC_Label'),
            text: TextUIDataModel(label.tr,
                styleVariant: CrayonPaymentTextStyleVariant.headline4,
                color: SU_title_color,
                fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 20,
          ),
          CrayonPaymentText(
            key: Key('${widget._identifier}_TC_Conditions'),
            text: TextUIDataModel(text.tr,
                styleVariant: CrayonPaymentTextStyleVariant.headline4,
                color: TC_DescriptionColor,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  _belowView(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          _buildDescription(context),
          const SizedBox(
            height: 20,
          ),
          _buildOptions(
              context, 'TC_TermsCondition_Subtitle', 'TC_Terms_Conditons_Desc'),
          const SizedBox(
            height: 10,
          ),
          _buildOptions(context, 'TC_Purpose_title', 'TC_Purpose_Desc')
        ],
      ),
    );
  }
}
