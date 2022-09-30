import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/mobile_core.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/device_option/device_detail_mockup.dart';
import 'package:shared_data_models/deviceloancreation/loan_preview_response_model.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/app_utils.dart';
import '../../../device_option_module.dart';
import 'package:shared_data_models/device_option/detail_detail_response/data.dart';
import 'package:shared_data_models/deviceloancreation/devicecreation_screen_args.dart';
import 'package:get/get.dart';

import '../state/device_loan_creation_state.dart';
import '../viewmodel/device_loan_creation_coordinator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeviceLoanCreationScreen extends StatefulWidget {
  final DeviceLoanCreationArgs deviceLoanCreationArgs;

  static const String viewPath =
      '${DeviceOptionModule.moduleIdentifier}/device-loan-creation-screen';

  DeviceLoanCreationScreen({
    Key? key,
    required this.deviceLoanCreationArgs,
  }) : super(key: key);

  @override
  State<DeviceLoanCreationScreen> createState() =>
      _DeviceLoanCreationScreenState();
}

class _DeviceLoanCreationScreenState extends State<DeviceLoanCreationScreen> {
  final String _identifier = 'device-loan-creation-screen';

  String isDeviceSelected = "";

  Data? detailDetail;

  bool evaluateTigo = false;
  bool evalutaeMPesa = false;
  int radioValue = 0;

  num payNowTotal = 0.0;

  String telcoPartner = '';

  LoanPreviewResponseModel? loanPreviewResponseModel;

  var _value = 1;

  @override
  Widget build(BuildContext context) {
    return BaseView<DeviceLoanCreationCoordinator, DeviceLoanCreationState>(
        setupViewModel: (coordinator) async {
          telcoPartner = await coordinator.getTelcoPartner();
          detailDetail = widget.deviceLoanCreationArgs.deviceDetailData;
          if (detailDetail != null && detailDetail!.deviceId != 0) {
            loanPreviewResponseModel = await coordinator.getLoanPreview(
                context, detailDetail!.deviceId!);
            print("loanPreviewResponse${loanPreviewResponseModel}");
            setState(() {
              loanPreviewResponseModel;
            });
          }
          num joiningFee = loanPreviewResponseModel!.data!.joiningFee!;
          num dailyRepaymentAmount =
              loanPreviewResponseModel!.data!.dailyRepaymentAmount!;
          payNowTotal = joiningFee + dailyRepaymentAmount;
        },
        onStateListenCallback: (preState, newState) =>
            {_listenToStateChanges(context, newState)},
        builder: (context, state, coordinator) => CrayonPaymentScaffold(
              appBarAttributes: CrayonPaymentAppBarAttributes(
                key: const Key('CardDetailsScreen_AppBarBackButton'),
                left: [
                  const CrayonPaymentAppBarButtonType.back(),
                ],
              ),
              bottomNavigationBar: loanPreviewResponseModel != null
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 16, right: 16, bottom: 18),
                      child: selectButton(coordinator),
                    )
                  : SizedBox(),
              body: state.when(
                initialState: () => const SizedBox(),
                ready: (_, __, ___) => _buildMainUIWithLoading(
                  context,
                  coordinator,
                  (state as DeviceLoanCreationStateReady),
                ),
              ),
            ));
  }

  Widget _buildMainUIWithLoading(
    BuildContext context,
    DeviceLoanCreationCoordinator coordinator,
    DeviceLoanCreationStateReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(DeviceLoanCreationStateReady stateReady) {
    return const CenteredCircularProgressBar(color: PRIMARY_COLOR);
  }

  void _listenToStateChanges(
      BuildContext context, DeviceLoanCreationState state) {}

  Widget _buildMainUI(context, DeviceLoanCreationCoordinator coordinator,
      DeviceLoanCreationStateReady stateReady) {
    return ListView(
      children: [
        _buildOptionTitle(context),
        dynamicHSpacer(30),
        _buildTitle(context),
        dynamicHSpacer(10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.deviceLoanCreationArgs.image,
              width: 95,
              height: 132,
              package: 'shared_data_models',
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  dynamicHSpacer(10),
                  CrayonPaymentText(
                    key: Key('${_identifier}_' + detailDetail!.brand!),
                    text: TextUIDataModel(
                        detailDetail!.brand! + "-" + detailDetail!.modelNumber!,
                        styleVariant: CrayonPaymentTextStyleVariant.overline1,
                        color: AN_CardTitle,
                        fontWeight: FontWeight.bold),
                  ),
                  dynamicHSpacer(6),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: CrayonPaymentText(
                      key: Key('${_identifier}_' + detailDetail!.memory!),
                      text: TextUIDataModel(
                        detailDetail!.memory! +
                            "|" +
                            detailDetail!.processor! +
                            "|" +
                            detailDetail!.operatingSystem!,
                        styleVariant: CrayonPaymentTextStyleVariant.overline1,
                        color: SU_carrier_message_color,
                      ),
                    ),
                  ),
                  dynamicHSpacer(20),
                ],
              ),
            ),
          ],
        ),
        dynamicHSpacer(10),
        Divider(),
        dynamicHSpacer(10),
        loanPreviewResponseModel == null ? SizedBox() : _loanDetails(context),
        dynamicHSpacer(20),
      ],
    );
  }

  Widget _buildOptionTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_Device_Loan_Creation'),
      text: TextUIDataModel('DLC_Device_Loan'.tr,
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600),
    );
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_DD_Title'),
      text: TextUIDataModel('DLC_Device_Title'.tr,
          styleVariant: CrayonPaymentTextStyleVariant.headline4,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600),
    );
  }

  Widget selectButton(DeviceLoanCreationCoordinator coordinator) {
    return CrayonPaymentDockedButton(
      key: Key('Select'),
      title: "${'DLC_pay_now'.tr} ${payNowTotal} TZSHS",
      borderRadius: 8,
      height: CrayonPaymentDimensions.marginFortyEight,
      buttonColor: radioValue != 0 ? LS_ButtonColor : ES_grey_button_color,
      textColor: White,
      textStyleVariant: CrayonPaymentTextStyleVariant.headline4,
      onPressed: () {
        coordinator.showErrorBottomSheet(
            _getOutOfStockUI(context, coordinator), context);

        // if (radioValue != 0) {
        //   switch (radioValue) {
        //     case 1:
        //       coordinator.navigateToDownPayment(
        //           payNowTotal.toString(),
        //           detailDetail!.deviceId,
        //           "${detailDetail!.brand!}" +
        //               ' ' +
        //               '-' +
        //               ' ' +
        //               "${detailDetail!.modelNumber}");
        //       break;
        //     case 2:
        //       coordinator.navigateToOtherScreen(
        //           widget.deviceLoanCreationArgs.deviceDetailData.deviceId!,
        //           "${detailDetail!.brand!}" +
        //               ' ' +
        //               '-' +
        //               ' ' +
        //               "${detailDetail!.modelNumber}",
        //           double.parse(payNowTotal.toString()),
        //           widget.deviceLoanCreationArgs.image);
        //       break;
        //     case 3:
        //       break;
        //     case 4:
        //       coordinator.navigateToDownPayment(
        //           payNowTotal.toString(),
        //           detailDetail!.deviceId,
        //           "${detailDetail!.brand!}" +
        //               ' ' +
        //               '-' +
        //               ' ' +
        //               "${detailDetail!.modelNumber}");
        //   }
        //   // if(radioValue == 2){
        //   //   coordinator.navigateToOtherScreen(
        //   //       widget.deviceLoanCreationArgs.deviceDetailData.deviceId!,
        //   //       "${detailDetail!.brand!}" + ' ' + '-' + ' ' + "${detailDetail!.modelNumber}",
        //   //       double.parse(payNowTotal.toString()),
        //   //       widget.deviceLoanCreationArgs.image);
        //   //   }
        //   // }else{
        //   //   coordinator.navigateToDownPayment(
        //   //       payNowTotal.toString(),
        //   //       detailDetail!.deviceId,
        //   //       "${detailDetail!.brand!}" + ' ' + '-' + ' ' + "${detailDetail!.modelNumber}");
        //   // }
        // }
      },
    );
  }

  _loanDetails(context) {
    print(loanPreviewResponseModel!.data!.toJson());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrayonPaymentText(
          key: Key('loan details'),
          text: TextUIDataModel('DLC_Loan_Details'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline4,
              color: AN_CardTitle,
              fontWeight: FontWeight.w600),
        ),
        dynamicHSpacer(30),
        _rowTitleValue('D0_JoiningFee'.tr,
            loanPreviewResponseModel!.data!.joiningFee!.toString() + " TZSHS"),
        _rowTitleValue(
            'DLC_Daily_Repayment'.tr,
            loanPreviewResponseModel!.data!.dailyRepaymentAmount!.toString() +
                " TZSHS"),
        _rowTitleValue(
            'DLC_Total_Amount_Repaid'.tr,
            loanPreviewResponseModel!.data!.totalAmountToBeRepaid!.toString() +
                " TZSHS"),
        _rowTitleValue('DLC_Final_Payment_Date'.tr,
            loanPreviewResponseModel!.data!.finalPaymentDate.toString()),
        dynamicHSpacer(40),
        CrayonPaymentText(
          key: Key('paymnet date'),
          text: TextUIDataModel('DLC_Wallets_Title'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline4,
              color: AN_CardTitle,
              fontWeight: FontWeight.w600),
        ),
        dynamicHSpacer(20),
        radioCase()
      ],
    );
  }

  _rowTitleValue(String key, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: CrayonPaymentText(
                key: Key('key value'),
                text: TextUIDataModel(key,
                    styleVariant: CrayonPaymentTextStyleVariant.headline5,
                    color: AN_CardTitle,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              flex: 1,
              child: CrayonPaymentText(
                key: Key('data value'),
                text: TextUIDataModel(value,
                    styleVariant: CrayonPaymentTextStyleVariant.headline5,
                    color: AN_CardTitle,
                    textAlign: TextAlign.right,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
        dynamicHSpacer(5),
        Divider(),
      ],
    );
  }

  _radioOtherButton(bool isEnabled) {
    return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F7FB),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xff263238), width: 0.1),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/other_payments.png"),
              SizedBox(width: 10),
              CrayonPaymentText(
                key: Key('${_identifier}_Device_Loan_Airtel_Pay'),
                text: TextUIDataModel('Other Payment'.tr,
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: isEnabled
                        ? SECONDARY_COLOR
                        : SECONDARY_COLOR.withOpacity(.30),
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Radio(
                value: 2,
                groupValue: radioValue,
                activeColor: isEnabled
                    ? SU_button_color
                    : SU_button_color.withOpacity(.30),
                onChanged: (value) {
                  if (isEnabled) {
                    setState(() {
                      radioValue = value as int;
                    });
                  }
                },
              )
            ],
          ),
        ));
  }

  _radioButton(bool isEnabled) {
    return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F7FB),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xff263238), width: 0.1),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/airtel_money.png"),
              SizedBox(width: 10),
              CrayonPaymentText(
                key: Key('${_identifier}_Device_Loan_Airtel_Pay'),
                text: TextUIDataModel('DLC_Airtel_Pay'.tr,
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: isEnabled
                        ? SECONDARY_COLOR
                        : SECONDARY_COLOR.withOpacity(.30),
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Radio(
                value: 1,
                groupValue: radioValue,
                activeColor: isEnabled
                    ? SU_button_color
                    : SU_button_color.withOpacity(.30),
                onChanged: (value) {
                  setState(() {
                    if (isEnabled) {
                      radioValue = value as int;
                    }
                  });
                },
              )
            ],
          ),
        ));
  }

  _radioTigoButton(bool isEnabled) {
    return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F7FB),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xff263238), width: 0.1),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/tigo.png"),
              SizedBox(width: 10),
              CrayonPaymentText(
                key: Key('${_identifier}_Device_Loan_Airtel_Pay'),
                text: TextUIDataModel('DC_tigo_pesa'.tr,
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: isEnabled
                        ? SECONDARY_COLOR
                        : SECONDARY_COLOR.withOpacity(.30),
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Radio(
                value: 3,
                groupValue: 1,
                activeColor: isEnabled
                    ? SU_button_color
                    : SU_button_color.withOpacity(.30),
                onChanged: (value) => evaluateTigo ? null : value = 0,
              )
            ],
          ),
        ));
  }

  _radioMPesaButton(bool isEnabled) {
    return Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(0xFFF5F7FB),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xff263238), width: 0.1),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset("assets/images/m_pesa.png"),
              SizedBox(width: 10),
              CrayonPaymentText(
                key: Key('${_identifier}_Device_Loan_Airtel_Pay'),
                text: TextUIDataModel('DC_m-pesa'.tr,
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: isEnabled
                        ? SECONDARY_COLOR
                        : SECONDARY_COLOR.withOpacity(.30),
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Radio(
                value: 4,
                groupValue: radioValue,
                activeColor: isEnabled
                    ? SU_button_color
                    : SU_button_color.withOpacity(.30),
                onChanged: (value) {
                  if (isEnabled) {
                    setState(() {
                      radioValue = value as int;
                    });
                  }
                  // radioValue = value as int;
                  // setState(() {});
                },
              )
            ],
          ),
        ));
  }

  Widget radioCase() {
    switch (telcoPartner) {
      case 'Airtel':
        return Column(
          children: [
            _radioButton(true),
            dynamicHSpacer(5),
            _radioOtherButton(true),
            dynamicHSpacer(5),
            _radioTigoButton(false),
            dynamicHSpacer(5),
            _radioMPesaButton(false)
          ],
        );
      case 'TIGO':
        return Column(
          children: [
            _radioOtherButton(true),
            dynamicHSpacer(5),
            _radioButton(false),
            dynamicHSpacer(5),
            _radioTigoButton(false),
            dynamicHSpacer(5),
            _radioMPesaButton(false)
          ],
        );
      case 'Vodacom':
        return Column(
          children: [
            _radioOtherButton(true),
            dynamicHSpacer(5),
            _radioMPesaButton(true),
            dynamicHSpacer(5),
            _radioButton(false),
            dynamicHSpacer(5),
            _radioTigoButton(false),
            dynamicHSpacer(5),
          ],
        );
      default:
        return SizedBox();
    }
  }

  Widget _getOutOfStockUI(
      BuildContext context, DeviceLoanCreationCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          SvgPicture.asset(
              "packages/widget_library/assets/images/stocks_img.svg"),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(
              percentage: 4,
            ),
          ),
          CrayonPaymentText(
            key: Key('${_identifier}_Device_Stock_Availability'),
            text: TextUIDataModel('DLC_device_stock_availability'.tr,
                textAlign: TextAlign.center,
                styleVariant: CrayonPaymentTextStyleVariant.bodyText1,
                color: Black,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(
              percentage: 5,
            ),
          ),

          Center(
            child: RichText(
              text: TextSpan(
                text: "DLC_please_confirm_availability".tr,
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                    color: VO_ResendTextColor,
                    fontWeight: FontWeight.w400),
                children: <TextSpan>[
                  TextSpan(
                      text: ' Samsung\n- A03 Core ',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  TextSpan(

                      text: "DLC_inventory_continue_joining_fee_payment".tr,

                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: VO_ResendTextColor,
                          fontSize: 14)),
                ],
              ),
            ),
          ),
          // CrayonPaymentText(
          //   key: Key('${_identifier}_DLC_device_stock_availability_desc'),
          //   text: TextUIDataModel('DLC_device_stock_availability_desc'.tr,
          //       textAlign: TextAlign.center,
          //       styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          //       color: AN_SubTitleColor,
          //       fontWeight: FontWeight.w400),
          // ),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(
              percentage: 5,
            ),
          ),
          _buildStockAvailableButton(context, coordinator),
          _buildOutOfStockButton(context, coordinator),
          _buildOutOfStockOnBoardLaterButton(context, coordinator)
        ],
      ),
    );
  }

  Widget _buildStockAvailableButton(
      BuildContext context, DeviceLoanCreationCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          if(radioValue == 1){
            coordinator.navigateToDownPayment(payNowTotal.toString(), widget.deviceLoanCreationArgs.deviceDetailData.deviceId, widget.deviceLoanCreationArgs.deviceDetailData.modelNumber.toString(),false, true);
          }else if (radioValue == 2){
            coordinator.navigateToOtherScreen(widget.deviceLoanCreationArgs.deviceDetailData.deviceId!, widget.deviceLoanCreationArgs.deviceDetailData.modelNumber.toString(), double.parse(payNowTotal.toString()), widget.deviceLoanCreationArgs.image,false,true);
          }
    else if (radioValue == 3){
            coordinator.navigateToDownPayment(payNowTotal.toString(), widget.deviceLoanCreationArgs.deviceDetailData.deviceId, widget.deviceLoanCreationArgs.deviceDetailData.modelNumber.toString(),false, true);
    }

        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: SU_button_color, borderRadius: BorderRadius.circular(2.0)),
          child: Center(
            child: Text(
              'DLC_stock_available'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  _buildOutOfStockButton(
      BuildContext context, DeviceLoanCreationCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {},
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.0),
            border: Border.all(color: PRIMARY_COLOR, width: 1),
          ),
          child: Center(
            child: Text(
              'DLC_out_of_stock_joining_fee'.tr,
              style: KYC_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  _buildOutOfStockOnBoardLaterButton(
      BuildContext context, DeviceLoanCreationCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          coordinator.goHomeScreen();

        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(2.0),
            border: Border.all(color: SECONDARY_COLOR, width: 1),
          ),
          child: Center(
            child: Text(
              "DLC_out_of_stock_onboard_later".tr,
              style: KYC_button_text_style_black,
            ),
          ),
        ),
      ),
    );
  }
}
