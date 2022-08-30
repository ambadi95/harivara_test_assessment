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
import 'package:shared_data_models/scan_qr_code/scan_qrcode_args.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/input_fields/input_number_for_device_with_label.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../state/scanqrcode_state.dart';
import '../viewmodel/scanqrcode_coordinator.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';

class ScanQrCodeScreen extends StatefulWidget {
  static const viewPath =
      '${ScanQRCodeModule.moduleIdentifier}/scanqrcodescreen';
  final ScanQRCodeArgs scanQRCodeArgs;

  const ScanQrCodeScreen({Key? key, required this.scanQRCodeArgs}) : super(key: key);

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
        widget.scanQRCodeArgs.deviceId,
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
        left: [ const CrayonPaymentAppBarButtonType.back() ],
        ),
    bottomNavigationBar: _buildRegisterButtonButton(coordinator),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _title(context),
          dynamicHSpacer(8),
          _subTitle(context),
          dynamicHSpacer(50),
          _buildIMEI1TextField(
              imei1Number,
              coordinator,
              'SU_enter_IMEI1_button',
              imei1NumberError,
              TextInputType.number),
          dynamicHSpacer(40),
          _buildIMEI2TextField(
              imei2Number,
              coordinator,
              'SU_enter_IMEI2_button',
              imei2NumberError,
              TextInputType.number),
          dynamicHSpacer(30),
        ],
      ),
    )
    );
  }

  _title(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_SU_device_registration'),
      text: const TextUIDataModel('SU_device_registration',
          styleVariant: CrayonPaymentTextStyleVariant.headline2,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600),
    );
  }

  _subTitle(BuildContext context) {
    return Text(
      'SU_device_reg_sub_heading'.tr,
        style: const TextStyle(
          color: DD_DEVICE_REGISTER,
          fontFamily: 'Montserrat',
          fontSize: 16,
          fontWeight: FontWeight.w400),
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
        text: TextSpan(
        text: 'IMEI - 1 ',
          style:const  TextStyle(color: Colors.black, fontFamily: 'Montserrat' , fontSize:14),
          children: <TextSpan>[
            TextSpan(text: 'SU_scan_code_IMEI_button'.tr, style: const TextStyle(color: Color(0xFF676767), fontFamily: 'Montserrat' , fontSize:12)),
          ],
        ),
        ),
       InputNumberDeviceFieldWithLabel(
            label: '',
            controller: controller,
            errorText: errorText.tr,
            hintText: hint.tr,
            key: const Key('imei1Text'),
            keyboardType: textInputType,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(15)],
            onChanged: (value) {
              _validateForm(coordinator);
            },
            onScanIconTap: () { coordinator.scanQRCodeImei1Method();}
          ),
      ],
    );
  }

  Widget _buildIMEI2TextField(
      TextEditingController controller,
      ScanQRCodeCoordinator coordinator,
      String hint,
      String errorText,
      TextInputType textInputType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: 'IMEI - 2 ',
            style: const TextStyle(color: Colors.black, fontFamily:'Montserrat', fontSize:14),
            children: <TextSpan>[
              TextSpan(text: 'SU_scan_code_IMEI_button'.tr, style: const TextStyle(color: Color(0xFF676767), fontFamily:'Montserrat', fontSize:12)),
            ],
          ),
        ),
        InputNumberDeviceFieldWithLabel(
          label: '',
          controller: controller,
          errorText: errorText.tr,
          hintText: hint.tr,
          key: const Key('imei1Text'),
          keyboardType: textInputType,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(15)],
          onChanged: (value) {
            _validateForm(coordinator);
          },
            onScanIconTap: () { coordinator.scanQRCodeImei2Method();}
        ),
      ],
    );
  }


  Widget _buildRegisterButtonButton(ScanQRCodeCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: ()  {
          coordinator.isImei1numberValid(imei1Number.text);
          coordinator.isImei2numberValid(imei2Number.text);
          if(imei1Number.text.trim() != "" && imei2Number.text.trim() !="") {
              _isBtnEnabled = true;
            if (_isBtnEnabled) {
              coordinator.deviceRegister(widget.scanQRCodeArgs.deviceId,
                  imei1Number.text, imei2Number.text);
            }
          }
          coordinator.successFulScreen();
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: imei1Number.text.isNotEmpty && imei2Number.text.isNotEmpty ? LS_ButtonColor : SU_grey_color,
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