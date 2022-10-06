import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/webview/webview.dart';
import 'package:shared_data_models/termscondition_faq_screen_args/termscondition_screen_args.dart';
import '../state/termscondition_state.dart';
import '../termscondition_module.dart';
import '../view_model/termscondition_coordinator.dart';

class CrayonTermsConditionScreen extends StatefulWidget {
  final TermsConditionScreenArgs termsConditionScreenArgs;
  final String _identifier = 'termsconditionScreeen';
  static const String viewPath =
      '${TermsConditionModule.moduleIdentifier}/termsconditionScreeen';

   CrayonTermsConditionScreen(
      {Key? key, required this.termsConditionScreenArgs})
      : super(key: key);

  @override
  State<CrayonTermsConditionScreen> createState() => _CrayonTermsConditionScreenState();
}

class _CrayonTermsConditionScreenState extends State<CrayonTermsConditionScreen> {

  double height = 0.0;
  bool isAgreed = false;

  @override
  Widget build(BuildContext context) {
     height = MediaQuery.of(context).size.height;
    return
    BaseView<TermsConditionCoordinator, TermsConditionState>(
      setupViewModel: (coordinator) async {},
      builder: (context, state, coordinator) =>
          Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: Container(
              height: 150,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: Column(
                  children: [
                    _getTermsCheckBox(context),
                   const SizedBox(height: 12,),
                    _buildContinueButton(context,coordinator)
                  ],
                ),
              ),
            ),
            body: SafeArea(child: _buildMainUI(context, coordinator, state)),
          ),
    );
  }

  Widget _buildMainUI(BuildContext context,
      TermsConditionCoordinator coordinator, TermsConditionState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, left: 17, right: 17, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height - 246,
            child: WebViewPage(
              launchType: LaunchType.Network,
              url: widget.termsConditionScreenArgs.userType == UserType.Customer || widget.termsConditionScreenArgs.userType == UserType.AgentCustomer ?  yTermsAndConditionsCustomer :  yTermsAndConditionsAgent,
              isTitleCenterd: false,
              backgroundColor: Colors.white,
              title: const TextUIDataModel(
                  '',
                  styleVariant: CrayonPaymentTextStyleVariant.headline18,
                  color: SU_title_color,
                  fontWeight: FontWeight.bold,
                textAlign: TextAlign.start
                 ),
            ),
          )
        ],
      ),
    );
  }


  Widget _buildContinueButton(
      BuildContext context,
      TermsConditionCoordinator coordinator
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          print("usertype=-==========%%%%%%%%%%%%%=======> ${widget.termsConditionScreenArgs.userType}, ${widget.termsConditionScreenArgs.isPasscode}");
          if(isAgreed) {
            if (widget.termsConditionScreenArgs.isPasscode == false) {
              switch (widget.termsConditionScreenArgs.userType) {
                case UserType.Customer :
                  coordinator.saveConsentForCustomerAPI(
                      context, widget.termsConditionScreenArgs.userType);
                  // coordinator.naigateToDetailScreen(
                  //     widget.termsConditionScreenArgs.userType);
                  break;
                case UserType.AgentCustomer :
                //coordinator.saveConsentForCustomerAPI(context, widget.termsConditionScreenArgs.userType);
                  coordinator.naigateToDetailScreen(
                      widget.termsConditionScreenArgs.userType);
                  break;
                case UserType.Agent :
                  coordinator.saveConsentForAgentAPI(
                      context, widget.termsConditionScreenArgs.userType);
              // coordinator.naigateToAgentDetailScreen(
              //     widget.termsConditionScreenArgs.userType);
              }
            } else {
              coordinator.saveConsentForPasscodeAPI(
                  context, widget.termsConditionScreenArgs.userType);
              //coordinator.naigateToPasscodeScreen(widget.termsConditionScreenArgs.userType);
            }
          }
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color:
              isAgreed
                  ? SU_button_color
                  : SU_grey_color,
              borderRadius: BorderRadius.circular(2.0)),
          child: Center(
            child: Text(
              'TC_agreement_button_text'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }


  Widget _checkBoxText(BuildContext context) {
    return RichTextDescription(
      key: const Key('_TC_agreement_text'),
      description: 'TC_agreement_text'.tr,
      linkTextStyle: SU_subtitle_terms_style,
      descriptionTextStyle: SU_subtitle_style,
      onLinkClicked: (text, link) {
        // LauncherUtils.launcherUtilsInstance
        //     .launchInBrowser(url: yTermsAndConditionsCustomer) ;
      },
    );
  }

  _getTermsCheckBox(
      BuildContext context,
      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: Checkbox(
              value: isAgreed,
              activeColor: Black,
              onChanged: (value) {
                setState(() {
                  isAgreed = value!;
                });
              }),
        ),
        const SizedBox(
          width: 10,
        ),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _checkBoxText(context),
            ],
          ),
        ),

      ],
    );
  }

}
