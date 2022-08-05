import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:welcome/sub_features/agent_enrollment/viewmodel/agent_enrollment_coordinator.dart';
import 'package:widget_library/html/rich_text_description.dart';
import '../../../welcome_module.dart';
import '../state/agent_enrollment_state.dart';
import 'package:get/get.dart';
import 'package:config/Colors.dart' as config_color;

class AgentEnrollmentScreen extends StatefulWidget {
  static const viewPath =
      '${WelcomeModule.moduleIdentifier}/agentEnrollmentSuccess';
  const AgentEnrollmentScreen({Key? key}) : super(key: key);

  @override
  State<AgentEnrollmentScreen> createState() => _AgentEnrollmentScreenState();
}

class _AgentEnrollmentScreenState extends State<AgentEnrollmentScreen> {
  @override
  Widget build(BuildContext context) =>
      BaseView<AgentEnrollmentCoordinator, AgentEnrollmentState>(
        setupViewModel: (coordinator) async {},
        builder: (context, state, coordinator) => SafeArea(
          child: Scaffold(
            body: _buildMainUI(coordinator),
          ),
        ),
      );

  Widget _buildMainUI(AgentEnrollmentCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 200,
          ),
          _buildSuccessIcon(),
          const SizedBox(
            height: 24,
          ),
          _buildEnrollmentText(),
          const SizedBox(
            height: 24,
          ),
          _buildEnrollmentIDText(),
          const Spacer(),
          _buildAgentHomeButton(coordinator),
        ],
      ),
    );
  }

  Widget _buildSuccessIcon() {
    return Image.asset(ES_succes_icon);
  }

  Widget _buildEnrollmentText() {
    return Center(
      child: SizedBox(
          width: 280,
          child: RichTextDescription(
              textAlign: TextAlign.center,
              key: const Key('welcome'),
              description: 'AE_Message'.tr,
              linkTextStyle: ES_bold_text,
              descriptionTextStyle: ES_success_text)),
    );
  }

  Widget _buildEnrollmentIDText() {
    return Center(
      child: SizedBox(
          width: 280,
          child: RichTextDescription(
              textAlign: TextAlign.center,
              key: const Key('enID'),
              description: 'AE_AgentId'.tr,
              linkTextStyle: ES_bold_text,
              descriptionTextStyle: ES_success_text)),
    );
  }

  Widget _buildDescText() {
    return Center(
      child: SizedBox(
          width: 280,
          child: RichTextDescription(
              textAlign: TextAlign.center,
              key: const Key('welcome'),
              description: 'AE_Description'.tr,
              linkTextStyle: ES_bold_text,
              descriptionTextStyle: ES_success_text)),
    );
  }

  Widget _buildAgentHomeButton(AgentEnrollmentCoordinator coordinator) {
    return InkWell(
      onTap: () {
        coordinator.navigateToAgentHome();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: config_color.SU_button_color,
            borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Text(
            'AE_Continue'.tr,
            style: SU_button_text_style,
          ),
        ),
      ),
    );
  }
}
