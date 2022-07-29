

import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/html/rich_text_description.dart';
import '../../../welcome_module.dart';
import '../state/enrollment_success_state.dart';
import '../viewmodel/enrollment_success_coordinator.dart';
import 'package:get/get.dart';
import 'package:config/Colors.dart' as config_color;

class EnrollmentSuccessScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/enrollmentSuccess';
  const EnrollmentSuccessScreen({Key? key}) : super(key: key);

  @override
  State<EnrollmentSuccessScreen> createState() => _EnrollmentSuccessScreenState();
}

class _EnrollmentSuccessScreenState extends State<EnrollmentSuccessScreen> {
  @override
  Widget build(BuildContext context) => BaseView<EnrollmentSuccessCoordinator, EnrollmentSuccessState>(
    setupViewModel: (coordinator) async {
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
          _buildAgentNearByButton(coordinator),
          const SizedBox(height: 24,),
          _buildExploreDeviceButton(coordinator)
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
            key: const Key('ensuccess'),
            description: 'ES_success_text'.tr,
            linkTextStyle: ES_bold_text,
            descriptionTextStyle: HS_name_text_style
        )
      ),
    );
  }

  Widget _buildAgentNearByButton(
      EnrollmentSuccessCoordinator coordinator
      ) {
    return GestureDetector(
      onTap: (){
        coordinator.navigateToDeviceOption();

      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: config_color.SU_button_color ,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: Center(
          child: Text('ES_select_membership'.tr, style: SU_button_text_style,),
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
}
