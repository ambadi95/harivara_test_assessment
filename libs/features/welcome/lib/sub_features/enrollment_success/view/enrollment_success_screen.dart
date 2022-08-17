import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/mobile_core.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/customer_details/response/get_customer_details_response/get_customer_details_response.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/launcher_utils.dart';
import '../../../welcome_module.dart';
import '../state/enrollment_success_state.dart';
import '../viewmodel/enrollment_success_coordinator.dart';
import 'package:get/get.dart';
import 'package:config/Colors.dart' as config_color;

class EnrollmentSuccessScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/enrollmentSuccess';
  final UserType userType;
  const EnrollmentSuccessScreen({Key? key, required this.userType})
      : super(key: key);

  @override
  State<EnrollmentSuccessScreen> createState() =>
      _EnrollmentSuccessScreenState();
}

GlobalKey<FormState> _abcKey = GlobalKey<FormState>();

class _EnrollmentSuccessScreenState extends State<EnrollmentSuccessScreen> {
  GetCustomerDetailsResponse? customerDetail;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BaseView<EnrollmentSuccessCoordinator, EnrollmentSuccessState>(
        setupViewModel: (coordinator) async {
          customerDetail =
              await coordinator.getCustomerDetails(widget.userType);
          setState(() {});
        },
        builder: (context, state, coordinator) => SafeArea(
          child: Scaffold(
            key: _abcKey,
            body: customerDetail.isNotEmptyOrNull
                ? _buildMainUI(coordinator)
                : _buildMainUIWithLoading(context, coordinator),
          ),
        ),
      );

  Widget _buildMainUIWithLoading(
    BuildContext context,
    EnrollmentSuccessCoordinator coordinator,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createLoading() {
    return Center(
      child: Container(
        color: Colors.white,
        child: const CenteredCircularProgressBar(color: PRIMARY_COLOR),
      ),
    );
  }

  Widget _buildMainUI(EnrollmentSuccessCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              widget.userType == UserType.AgentCustomer
                  ? customerDetail!.data!.deviceId == null
                      ? null
                      : coordinator.backToHome()
                  : coordinator.logout();
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                widget.userType == UserType.AgentCustomer
                    ? customerDetail!.data!.deviceId != null
                        ? 'Home'
                        : ''
                    : 'Logout',
                style: const TextStyle(color: PRIMARY_COLOR),
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          _buildSucessIcon(),
          const SizedBox(
            height: 20,
          ),
          _buildEnrollmentText(),
          const SizedBox(
            height: 4,
          ),
          _buildEnrollSuccessText(),
          const SizedBox(
            height: 40,
          ),
          _buildEnrollmentIDText(),
          const Spacer(),
          widget.userType == UserType.AgentCustomer
              ? const SizedBox()
              : _buildAgentContactText(),
          const SizedBox(
            height: 21,
          ),
          _buildAgentNearByButton(coordinator),
          const SizedBox(
            height: 24,
          ),
          widget.userType == UserType.AgentCustomer
              ? const SizedBox()
              : _buildExploreDeviceButton(coordinator),
          widget.userType == UserType.AgentCustomer
              ? const SizedBox()
              : const SizedBox(
                  height: 12,
                ),
          widget.userType == UserType.AgentCustomer
              ? const SizedBox()
              : _buildContactText(context),
          widget.userType == UserType.AgentCustomer
              ? const SizedBox()
              : const SizedBox(
                  height: 25,
                ),
        ],
      ),
    );
  }

  Widget _buildSucessIcon() {
    return Image.asset(ES_succes_icon);
  }

  Widget _buildEnrollmentText() {
    return Center(
      child: SizedBox(
          width: 280,
          child: RichTextDescription(
              textAlign: TextAlign.center,
              key: const Key('welcome'),
              description: 'ES_welcome_Text'.tr.replaceAll(
                  '_name_',
                  customerDetail!.data!.firstName! +
                      ' ' +
                      customerDetail!.data!.lastName!),
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
              description: 'ES_enroll_id'.tr.replaceAll(
                  '_id_', customerDetail!.data!.referenceId!.toString()),
              linkTextStyle: ES_bold_text,
              descriptionTextStyle: ES_bold_text)),
    );
  }

  Widget _buildEnrollSuccessText() {
    return Center(
      child: SizedBox(
          width: 280,
          child: RichTextDescription(
              textAlign: TextAlign.center,
              key: const Key('en_success'),
              description: customerDetail!.data!.deviceId.isNotEmptyOrNull
                  ? 'ES_enrolled_success_text'
                  : 'ES_success_text'.tr,
              linkTextStyle: ES_bold_text,
              descriptionTextStyle: HS_name_text_style)),
    );
  }

  Widget _buildAgentContactText() {
    return customerDetail!.data!.deviceId.isNotEmptyOrNull
        ? SizedBox(
            width: 250,
            child: Text(
              'ES_agent_contact_text'.tr,
              key: const Key('ES_agent_text'),
              style: ES_agent_contact_text_style,
              textAlign: TextAlign.center,
            ),
          )
        : const SizedBox();
  }

  Widget _buildAgentNearByButton(EnrollmentSuccessCoordinator coordinator) {
    return GestureDetector(
      onTap: () {
        coordinator.navigateToDeviceOption(false, widget.userType);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: config_color.SU_button_color,
            borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Text(
            customerDetail!.data!.deviceId.isNotEmptyOrNull
                ? 'ES_view_membership'.tr
                : 'ES_select_membership'.tr,
            style: SU_button_text_style,
          ),
        ),
      ),
    );
  }

  Widget _buildExploreDeviceButton(EnrollmentSuccessCoordinator coordinator) {
    return GestureDetector(
      onTap: () {
        // coordinator.navigateToAgentNearBy();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: config_color.ES_grey_button_color,
            borderRadius: BorderRadius.circular(8.0),
            border:
                Border.all(width: 1, color: config_color.ES_grey_button_color)),
        child: Center(
          child: Text(
            'ES_near_agent_button'.tr,
            style: const TextStyle(color: config_color.SECONDARY_COLOR),
          ),
        ),
      ),
    );
  }

  Widget _buildContactText(context) {
    return InkWell(
      onTap: () {
        LauncherUtils.launcherUtilsInstance
            .makePhoneCall(phoneNumber: LauncherUtils.CONTACT_NUMBER);
      },
      child: Center(
        child: CrayonPaymentText(
          key: const Key('_ST_contact'),
          text: TextUIDataModel('ES_need_help_contact'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline5,
              color: VO_ResendTextColor,
              fontWeight: FontWeight.w100,
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
