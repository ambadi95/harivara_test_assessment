import 'package:config/Colors.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

import '../state/termscondition_state.dart';
import '../termscondition_module.dart';
import '../view_model/termscondition_coordinator.dart';
import 'package:shared_data_models/termscondition_faq_screen_args/termscondition_faq_screen_args.dart';

class CrayonTermsCondition extends StatefulWidget {
  final String _identifier = 'termscondition';
  static const String viewPath =
      '${TermsConditionModule.moduleIdentifier}/termscondition';
  final TermsConditionAndFaqScreenArgs termsConditionAndFaqScreenArgs;

  const CrayonTermsCondition(
      {Key? key, required this.termsConditionAndFaqScreenArgs})
      : super(key: key);

  @override
  State<CrayonTermsCondition> createState() => _CrayonTermsConditionState();
}

class _CrayonTermsConditionState extends State<CrayonTermsCondition> {

  final List<Map<String, dynamic>> customerFaqList = [
    {
      "title": 'faq_question_1'.tr,
      "content":'faq_answer_1'.tr,
        "isExpanded": false
    },
    {
      "title": 'faq_question_2'.tr,
      "content":'faq_answer_2'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_3'.tr,
      "content":'faq_answer_3'.tr,
      "isExpanded": false
    },{
      "title": 'faq_question_4'.tr,
      "content":'faq_answer_4'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_5'.tr,
      "content":'faq_answer_5'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_6'.tr,
      "content":'faq_answer_6'.tr,
      "isExpanded": false
    },   {
      "title": 'faq_question_7'.tr,
      "content":'faq_answer_7'.tr,
      "isExpanded": false
    },{
      "title": 'faq_question_8'.tr,
      "content":'faq_answer_8'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_9'.tr,
      "content":'faq_answer_9'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_10'.tr,
      "content":'faq_answer_10'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_11'.tr,
      "content":'faq_answer_11'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_12'.tr,
      "content":'faq_answer_12'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_13'.tr,
      "content":'faq_answer_13'.tr,
      "isExpanded": false
    },{
      "title": 'faq_question_14'.tr,
      "content":'faq_answer_14'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_15'.tr,
      "content":'faq_answer_15'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_16'.tr,
      "content":'faq_answer_16'.tr,
      "isExpanded": false
    },   {
      "title": 'faq_question_17'.tr,
      "content":'faq_answer_17'.tr,
      "isExpanded": false
    },{
      "title": 'faq_question_18'.tr,
      "content":'faq_answer_18'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_19'.tr,
      "content":'faq_answer_19'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_20'.tr,
      "content":'faq_answer_20'.tr,
      "isExpanded": false
    },{
      "title": 'faq_question_21'.tr,
      "content":'faq_answer_21'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_22'.tr,
      "content":'faq_answer_22'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_23'.tr,
      "content":'faq_answer_23'.tr,
      "isExpanded": false
    },{
      "title": 'faq_question_24'.tr,
      "content":'faq_answer_24'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_25'.tr,
      "content":'faq_answer_25'.tr,
      "isExpanded": false
    },
    {
      "title": 'faq_question_26'.tr,
      "content":'faq_answer_26'.tr,
      "isExpanded": false
    }

  ];



  void changeExpandedState(int index, bool expandedStatus) {
    if (expandedStatus) {
      customerFaqList.elementAt(index)['isExpanded'] = false;
    } else {
      customerFaqList.elementAt(index)['isExpanded'] = true;
    }
    setState(() {});
  }

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
          Expanded(
              flex: widget.termsConditionAndFaqScreenArgs.isFAQ ? 0 : 3,
              child: _buildTitle(context, coordinator)),
          widget.termsConditionAndFaqScreenArgs.isFAQ
              ? Expanded(child: _buildFaqUI(context, coordinator, state))
              : Expanded(flex: 7, child: _belowView(context)),
        ],
      ),
    );
  }

  Widget _buildFaqUI(BuildContext context,
      TermsConditionCoordinator coordinator, TermsConditionState state) {
    return ListView.builder(
        itemCount: customerFaqList.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    changeExpandedState(
                        index, customerFaqList.elementAt(index)["isExpanded"]);
                  },
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.05),
                          blurRadius: 8.0,
                          offset: Offset(0.0, 1),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            customerFaqList.elementAt(index)['title'] ?? "",
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Icon(
                          customerFaqList.elementAt(index)['isExpanded']
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          size: 18,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                customerFaqList.elementAt(index)['isExpanded']
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Text(
                          customerFaqList.elementAt(index)["content"] ?? "",
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        });
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
          text: TextUIDataModel(
              widget.termsConditionAndFaqScreenArgs.isFAQ == true
                  ? 'FAQ_Title_2'.tr
                  : 'TC_Title'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
              color: SU_title_color,
              fontWeight: FontWeight.bold,
              textAlign: TextAlign.left),
        ),
        const SizedBox(
          height: 20,
        ),
       widget.termsConditionAndFaqScreenArgs.isFAQ?Container(): CrayonPaymentText(
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
