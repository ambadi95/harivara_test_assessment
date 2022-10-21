import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:scanqrcode/state/scanqrcode_state.dart';
import 'package:scanqrcode/viewmodel/scanqrcode_coordinator.dart';
import 'package:shared_data_models/scan_qr_code/scan_qrcode_args.dart';
import 'package:welcome/sub_features/agent_enrollment/viewmodel/agent_enrollment_coordinator.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:get/get.dart';
import 'package:config/Colors.dart' as config_color;
import '../scanqrcode_module.dart';

class OutOfStockSuccessScreen extends StatefulWidget {
  static const viewPath =
      '${ScanQRCodeModule.moduleIdentifier}/outOfStockSuccessScreen';

  final String screenScreenArgs;
  const OutOfStockSuccessScreen({Key? key, required this.screenScreenArgs}) : super(key: key);

  @override
  State<OutOfStockSuccessScreen> createState() => _OutOfStockSuccessScreenState();
}

class _OutOfStockSuccessScreenState extends State<OutOfStockSuccessScreen> {
  String username = "";

  @override
  Widget build(BuildContext context) =>
      BaseView<ScanQRCodeCoordinator, ScanQRCodeState>(
        setupViewModel: (coordinator) async {
          username = await coordinator.getNewCustomerName();
          setState(() {
            username;
          });
        },
        builder: (context, state, coordinator) => SafeArea(
          child: Scaffold(
            body: _buildMainUI(coordinator),
          ),
        ),
      );

  Widget _buildMainUI(ScanQRCodeCoordinator coordinator){
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 120,
          ),
          _buildSuccessIcon(),

          const SizedBox(
            height: 20,
          ),
          // RichText(
          //   textAlign: TextAlign.center,
          //   text: TextSpan(
          //     text: 'success_hi'.tr ,
          //     children: <TextSpan>[
          //       TextSpan(text: "$username", style: const TextStyle(
          //           fontSize: 20,
          //           fontWeight: FontWeight.w600,
          //           fontFamily: 'Montserrat',
          //           height: 20)),
          //     ],
          //   ),
          // ),
          _buildEnrollmentText(),
          const SizedBox(
            height: 34,
          ),
          _buildEnrollmentIDText(),
          const Spacer(),
          _buildBottomEnrollmentIDText(),
          const SizedBox(height: 20),
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
      child: Column(
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'success_thanks'.tr,
              style:  const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(text: ' ${username}', style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Colors.black,
                )),
              ],
            ),
          ),

          const SizedBox(
            height: 2,
          ),
           Container(
             width: 310,
             child: RichTextDescription(
                    textAlign: TextAlign.center,
                    key: const Key('DLC_congrats_text'),
                    description: 'DLC_congrats_text'.tr,
                    linkTextStyle: ES_bold_text,
                    descriptionTextStyle: ES_success_text),
           ),
        ],
      ),
    );
  }

  Widget _buildEnrollmentIDText() {
    return  Container(
      width: 320,
      child: Center(
        child: Text(
            textAlign: TextAlign.center,
            'DLC_second_congrats_text'.tr,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
              color: Color(0xFF000000),
            )),
      ),
    );
  }

  Widget _buildBottomEnrollmentIDText() {
    return Center(
      child: SizedBox(
          width: 310,
          child: RichTextDescription(
              textAlign: TextAlign.center,
              key: const Key('enID'),
              description: 'SU_success_msg_3'.tr,
              linkTextStyle: ES_bold_text,
              descriptionTextStyle: ES_bottom_success_text)),
    );
  }



  Widget _buildAgentHomeButton(ScanQRCodeCoordinator coordinator) {
    return InkWell(
      onTap: () {
        coordinator.goBackToAgentHomeScreen();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: config_color.SU_button_color,
            borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Text(
            'SU_close'.tr,
            style: SU_button_text_style,
          ),
        ),
      ),
    );
  }
}