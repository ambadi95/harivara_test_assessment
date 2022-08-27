import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanqrcode/scanqrcode_module.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import '../state/scanqrcode_state.dart';
import '../viewmodel/scanqrcode_coordinator.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';

class ScanQrCodeScreen extends StatefulWidget {
  static const viewPath =
      '${ScanQRCodeModule.moduleIdentifier}/scanqrcodescreen';


  const ScanQrCodeScreen({Key? key}) : super(key: key);

  @override
  State<ScanQrCodeScreen> createState() => _ScanQrCodeScreenState();
}

class _ScanQrCodeScreenState extends State<ScanQrCodeScreen> {
  final String _identifier = 'scancode-screen';
  String username="";

  @override
  Widget build(BuildContext context) =>
      BaseView<ScanQRCodeCoordinator, ScanQRCodeState>(
          setupViewModel: (coordinator) async {
            coordinator.initialiseState(context);
            username = await coordinator.getAgentName();
            setState(() {
              username;
            });

          },
          builder: (context, state, coordinator) => CrayonPaymentScaffold(
                appBarAttributes: CrayonPaymentAppBarAttributes(
                  key: const Key('scancode_screen'),
                  left: [
                    const CrayonPaymentAppBarButtonType.back(),
                  ],
                ),
                // bottomNavigationBar:
                // _buildRegisterButtonButton(context, coordinator, state),
                body: state.when(
                  initialState: () => const SizedBox(),
                  ready: (
                    _,
                    __,
                    ___,
                  ) =>
                      _buildMainUIWithLoading(
                    context,
                    coordinator,
                    (state as ScanQRCodeStateReady),
                  ),
                ),
              ));

  Widget _buildMainUIWithLoading(
    BuildContext context,
    ScanQRCodeCoordinator coordinator,
    ScanQRCodeStateReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(ScanQRCodeStateReady state) {
    if (state.isLoading) {
      return Container(
        color: Colors.black.withOpacity(0.4),
        child: const CenteredCircularProgressBar(
            color: config_colors.PRIMARY_COLOR),
      );
    } else {
      return Container();
    }
  }

  Widget _buildMainUI(
    BuildContext context,
    ScanQRCodeCoordinator coordinator,
    ScanQRCodeStateReady state,
  ) {
    return SingleChildScrollView(
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  dynamicHSpacer(20),
                  // FOR IMEI1
                  _buildScanIMEI1UiButton(context, coordinator, state),
                  dynamicHSpacer(15),
                  Text('SU_or_text'.tr),
                  dynamicHSpacer(20),
                  _buildEnterIMEI1Button(context, coordinator, state),
                  dynamicHSpacer(70),
                  // FOR IMEI2
                  _buildScanIMEI2UiButton(context, coordinator, state),
                  dynamicHSpacer(10),
                  Text('SU_or_text'.tr),
                  dynamicHSpacer(20),
                  _buildEnterIMEI2Button(context, coordinator, state),
                  dynamicHSpacer(30),
                  _buildRegisterButtonButton(context, coordinator, state),
                  // SizedBox(
                  //   height: AppUtils.appUtilsInstance
                  //       .getPercentageSize(percentage: 10),
                  // ),
                ],
              ),
          );
  }


  Widget _buildScanIMEI1UiButton(
    BuildContext context,
    ScanQRCodeCoordinator coordinator,
    ScanQRCodeState state,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {},
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color:  SU_button_color,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'SU_scan_code_IMEI1_button'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildScanIMEI2UiButton(
      BuildContext context,
      ScanQRCodeCoordinator coordinator,
      ScanQRCodeState state,
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {},
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: SU_button_color,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'SU_scan_code_IMEI2_button'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildEnterIMEI1Button(
      BuildContext context,
      ScanQRCodeCoordinator coordinator,
      ScanQRCodeState state,
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {},
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: SU_button_color,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'SU_enter_IMEI1_button'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildEnterIMEI2Button(
      BuildContext context,
      ScanQRCodeCoordinator coordinator,
      ScanQRCodeState state,
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {},
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color:SU_button_color,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'SU_enter_IMEI2_button'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }


  Widget _buildRegisterButtonButton(
      BuildContext context,
      ScanQRCodeCoordinator coordinator,
      ScanQRCodeState state,
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {},
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: SU_button_color,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'SU_register_device_button'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }
}
