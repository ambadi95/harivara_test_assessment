

import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../../../welcome_module.dart';
import '../state/enrollment_success_state.dart';
import '../viewmodel/enrollment_success_coordinator.dart';
import 'package:get/get.dart';
import 'package:config/Colors.dart' as config_color;

class EnrollmentSuccessScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/enrollmentSuccess';
  final bool isEnrolled;
  const EnrollmentSuccessScreen({Key? key,required this.isEnrolled}) : super(key: key);

  @override
  State<EnrollmentSuccessScreen> createState() => _EnrollmentSuccessScreenState();
}

class _EnrollmentSuccessScreenState extends State<EnrollmentSuccessScreen> {
  @override
  Widget build(BuildContext context) => BaseView<EnrollmentSuccessCoordinator, EnrollmentSuccessState>(
    setupViewModel: (coordinator) async {
     await coordinator.getCustomerDetails();
    },
    builder: (context, state, coordinator) => SafeArea(
      child: Scaffold(
        body: _buildMainUI(coordinator),
      ),
    ),
  );

  Widget _buildMainUI(
      EnrollmentSuccessCoordinator coordinator
      ){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 200,),
          _buildSucessIcon(),
          const SizedBox(height: 20,),
          _buildEnrollmentText(),
          const SizedBox(height: 4,),
          _buildEnrollSuccessText(),
          const SizedBox(height: 40,),
          _buildEnrollmentIDText(),
             const Spacer(),
          _buildAgentContactText() ,
          const SizedBox(height: 21,),
          _buildAgentNearByButton(coordinator),
          const SizedBox(height: 24,),
          _buildExploreDeviceButton(coordinator),
          const SizedBox(height: 12,),
          _buildContactText(context),
          const SizedBox(height: 25,),
        ],
      ),
    );
  }

  Widget _buildSucessIcon(){
    return Image.asset(ES_succes_icon);
  }

  Widget _buildEnrollmentText(){
    return Center(
      child: SizedBox(
        width: 280,
        child:
        RichTextDescription(
          textAlign: TextAlign.center,
            key: const Key('welcome'),
            description: 'ES_welcome_Text'.tr,
            linkTextStyle: ES_bold_text,
            descriptionTextStyle: ES_success_text
        )
      ),
    );
  }

  Widget _buildEnrollmentIDText(){
    return Center(
      child: SizedBox(
        width: 280,
        child: RichTextDescription(
            textAlign: TextAlign.center,
            key: const Key('enID'),
            description: 'ES_enroll_id'.tr,
            linkTextStyle: ES_bold_text,
            descriptionTextStyle: ES_bold_text
        )
      ),
    );
  }

  Widget _buildEnrollSuccessText(){
    return Center(
      child: SizedBox(
        width: 280,
        child: RichTextDescription(
            textAlign: TextAlign.center,
            key: const Key('en_success'),
            description: widget.isEnrolled ? 'ES_enrolled_success_text' : 'ES_success_text'.tr,
            linkTextStyle: ES_bold_text,
            descriptionTextStyle: HS_name_text_style
        )
      ),
    );
  }

  Widget _buildAgentContactText(){
    return widget.isEnrolled ? SizedBox(
      width: 250,
      child: Text('ES_agent_contact_text'.tr,
        key: const Key('ES_agent_text'),
        style: ES_agent_contact_text_style,
        textAlign: TextAlign.center,
      ),
    ) : const SizedBox();
  }

  Widget _buildAgentNearByButton(
      EnrollmentSuccessCoordinator coordinator
      ) {
    return GestureDetector(
      onTap: (){
        coordinator.navigateToDeviceOption(widget.isEnrolled);

      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: config_color.SU_button_color ,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: Center(
          child: Text( widget.isEnrolled ? 'ES_view_membership'.tr : 'ES_select_membership'.tr, style: SU_button_text_style,),
        ),
      ),
    );
  }

  Widget _buildExploreDeviceButton(
      EnrollmentSuccessCoordinator coordinator
      ) {
    return GestureDetector(
      onTap: (){
       // coordinator.navigateToAgentNearBy();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: config_color.ES_grey_button_color,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 1,color: config_color.ES_grey_button_color)
        ),
        child: Center(
          child: Text('ES_near_agent_button'.tr, style: const TextStyle(
              color: config_color.SECONDARY_COLOR
          ),),
        ),
      ),
    );
  }

  Widget _buildContactText(context) {
    return Center(
      child: CrayonPaymentText(
        key: const Key('_ST_contact'),
        text: TextUIDataModel(
            'ES_need_help_contact'.tr,
            styleVariant: CrayonPaymentTextStyleVariant.headline5,
            color: VO_ResendTextColor,
            fontWeight: FontWeight.w100,
            textAlign: TextAlign.center),
      ),
    );
  }
}
