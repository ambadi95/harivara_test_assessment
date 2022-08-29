import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/mobile_core.dart';
import 'package:core/view/base_view.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:scanqrcode/scanqrcode_module.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
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
  String username = "";
  TextEditingController imei1Number = TextEditingController();
  TextEditingController imei2Number = TextEditingController();
  String imei1NumberError = '';
  String imei2NumberError = '';
  bool _isBtnEnabled = false;

  void _validateForm(ScanQRCodeCoordinator coordinator) {
    coordinator.validateForm(
        '12345', // ADD CUSTOMER ID
        12345,  // ADD DEVICE ID
        imei1Number.text,
        imei2Number.text
    );
  }

  void _listenToStateChanges(BuildContext context, ScanQRCodeState state) {
    state.maybeWhen(
        imei1Error: (message) {
          imei1NumberError = message;
        },
        deviceRegisterFormState: (isValid) {
          _isBtnEnabled = isValid;
        },
        imei2Error: (message) {
          imei2NumberError = message;
        },
        orElse: () => null);
  }

  @override
  void dispose() {
    imei1Number.dispose();
    imei2Number.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BaseView<ScanQRCodeCoordinator, ScanQRCodeState>(
        onStateListenCallback: (preState, newState) =>
        {_listenToStateChanges(context, newState)},
        setupViewModel: (coordinator) {},
        builder: (context, state, coordinator) {
          return state.maybeWhen(
              loading: () => _buildMainUIWithLoading(context, coordinator),
              orElse: () => _buildMainUI( coordinator));
        },
      );

  Widget _buildMainUIWithLoading(
      BuildContext context,
      ScanQRCodeCoordinator coordinator,
      ) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMainUI(coordinator),
          _createLoading(),
        ],
      ),
    );
  }



  Widget _createLoading() {
    return Center(
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: const CenteredCircularProgressBar(color: PRIMARY_COLOR),
      ),
    );
  }

  Widget _buildMainUI(ScanQRCodeCoordinator coordinator) {
    return CrayonPaymentScaffold(
        appBarAttributes: CrayonPaymentAppBarAttributes(
        key: const Key('CardDetailsScreen_AppBarBackButton'),
    left: [
    const CrayonPaymentAppBarButtonType.back(),
    ],
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          dynamicHSpacer(20),
          // FOR IMEI1
          _buildScanIMEI1UiButton(coordinator),
          dynamicHSpacer(15),
          Text('SU_or_text'.tr),
          dynamicHSpacer(20),
          //_buildEnterIMEI1Button(coordinator),
          _buildIMEI1TextField(
              imei1Number,
              coordinator,
              'SU_enter_IMEI1_button',
              imei1NumberError,
              TextInputType.number),
          dynamicHSpacer(70),
          // FOR IMEI2
          _buildScanIMEI2UiButton(coordinator),
          dynamicHSpacer(10),
          Text('SU_or_text'.tr),
          dynamicHSpacer(20),
          _buildIMEI2TextField(
              imei2Number,
              coordinator,
              'SU_enter_IMEI2_button',
              imei2NumberError,
              TextInputType.number),
          dynamicHSpacer(30),
          _buildRegisterButtonButton(coordinator),
          // SizedBox(
          //   height: AppUtils.appUtilsInstance
          //       .getPercentageSize(percentage: 10),
          // ),
        ],
      ),
    )
    );
  }


  Widget _buildScanIMEI1UiButton(ScanQRCodeCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          var imei1 = coordinator.scanQRCodeImei1Method();
          print("imei1 for scan => $imei1");
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: SU_button_color,
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


  Widget _buildIMEI1TextField(
      TextEditingController controller,
      ScanQRCodeCoordinator coordinator,
      String hint,
      String errorText,
      TextInputType textInputType) {
    print("error ==> $errorText");
    return Padding(
      padding: const EdgeInsets.only(left:15, right:15),
      child: InputFieldWithLabel(
        label: '',
        controller: controller,
        errorText: errorText.tr,
        hintText: hint.tr,
        key: const Key('imei1Text'),
        keyboardType: textInputType,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(16)],
        onChanged: (value) {
          _validateForm(coordinator);
        },
      ),
    );
  }

  Widget _buildIMEI2TextField(
      TextEditingController controller,
      ScanQRCodeCoordinator coordinator,
      String hint,
      String errorText,
      TextInputType textInputType) {
    return Padding(
        padding: const EdgeInsets.only(left:15, right:15),
      child: InputFieldWithLabel(
      label: '',
      controller: controller,
      errorText: errorText.tr,
      hintText: hint.tr,
      key: const Key('imei2Text'),
      keyboardType: textInputType,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(16),],
      onChanged: (value) {
        _validateForm(coordinator);
      },
    ));
  }

  Widget _buildScanIMEI2UiButton(ScanQRCodeCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          var imei2 = coordinator.scanQRCodeImei2Method();
          print("imei2 for scan => $imei2");
          },
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

  Widget _buildRegisterButtonButton(ScanQRCodeCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: ()  {
          // coordinator.isImei1numberValid(imei1Number.text);
          // coordinator.isImei2numberValid(imei2Number.text);
          // if (_isBtnEnabled) {
          //   coordinator.deviceRegister(123456, 12345,
          //       imei1Number.text, imei2Number.text);
          // }
          coordinator.successFulScreen();
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color:  _isBtnEnabled ? LS_ButtonColor : SU_grey_color,
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