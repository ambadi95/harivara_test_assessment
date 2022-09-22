import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:get/get.dart';
import 'package:config/Colors.dart' as config_color;
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/app_utils.dart';
import '../configuremdm_module.dart';
import '../state/configuremdm_state.dart';
import '../viewmodel/configuremdm_coordinator.dart';

class ConfigureMdmSuccessScreen extends StatefulWidget {
  String imei;
  static const viewPath =
      '${ConfigureMdmModule.moduleIdentifier}/configuremdmsuccessScreen';

   ConfigureMdmSuccessScreen({Key? key,required this.imei}) : super(key: key);

  @override
  State<ConfigureMdmSuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<ConfigureMdmSuccessScreen> {
  final String _identifier = 'configure-mdm-success-screen';

  @override
  Widget build(BuildContext context) =>
      BaseView<ConfigureMdmCoordinator, ConfigureMdmState>(
        setupViewModel: (coordinator) async { },
        builder: (context, state, coordinator) => SafeArea(
          child: Scaffold(
            body: _buildMainUI(coordinator),
          ),
        ),
      );

  Widget _buildMainUI(ConfigureMdmCoordinator coordinator){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 6),
          ),
          _buildTitle(context),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 5),
          ),
          _subTitle(context),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 10),
          ),
          const SizedBox(
            height: 60,
          ),

          _buildSuccessIcon(),
          const SizedBox(
            height: 24,
          ),

          _buildEnrollmentText(),
          const SizedBox(
            height: 10,
          ),
          _buildEnrollmentIDText(),
          const Spacer(),
          const SizedBox(height: 20),
          _buildAgentHomeButton(coordinator),
        ],
      ),
    );
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_ConfigureMDM_Title'),
      text: const TextUIDataModel('MDM_title',
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }
  _subTitle(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_ConfigureMDM_SubTitle'),
      text: const TextUIDataModel('MDM_subheading',
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: VO_ResendTextColor,
          fontWeight: FontWeight.w400),
    );
  }

  Widget _buildSuccessIcon() {
    return Center(child: Image.asset(ES_succes_icon)); //ES_red_succes_icon
  }

  Widget _buildEnrollmentText() {
    return Center(
      child: SizedBox(
          width: 280,
          child: RichTextDescription(
              textAlign: TextAlign.center,
              key: const Key('MDM_successful_text'),
              description: 'MDM_successful_text'.tr,
              linkTextStyle: ES_bold_text,
              descriptionTextStyle: ES_success_text)),
    );
  }

  Widget _buildEnrollmentIDText() {
    return Padding(
      padding: const EdgeInsets.only(left:20.0, right: 20),
      child: Center(
        child:  Text(
          key: const Key('MDM_successful_heading'),
         'MDM_successful_heading'.tr,
          textAlign: TextAlign.center,
          style:const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
            fontStyle: FontStyle.normal,
            color: Color(0xFF676767))),
            ),
    );
  }




  Widget _buildAgentHomeButton(ConfigureMdmCoordinator coordinator) {
    return InkWell(
      onTap: () {
        coordinator.successFulScreen(widget.imei);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: config_color.SU_button_color,
            borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Text(
            'MDM_finish_text'.tr,
            style: SU_button_text_style,
          ),
        ),
      ),
    );
  }
}