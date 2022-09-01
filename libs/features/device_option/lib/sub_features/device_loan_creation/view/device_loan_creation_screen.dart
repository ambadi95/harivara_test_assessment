import 'package:config/Colors.dart';
import 'package:config/Config.dart';
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
import '../../../device_option_module.dart';
import 'package:shared_data_models/device_option/detail_detail_response/data.dart';
import 'package:shared_data_models/deviceloancreation/devicecreation_screen_args.dart';
import 'package:get/get.dart';

import '../state/device_loan_creation_state.dart';
import '../viewmodel/device_loan_creation_coordinator.dart';

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

  LoanPreviewResponseModel? loanPreviewResponseModel;

  var _value = 1;

  @override
  Widget build(BuildContext context) {
    return BaseView<DeviceLoanCreationCoordinator, DeviceLoanCreationState>(
      setupViewModel: (coordinator) async {
        detailDetail = widget.deviceLoanCreationArgs.deviceDetailData;
        if (detailDetail != null && detailDetail!.deviceId != 0) {
          loanPreviewResponseModel =
              await coordinator.getLoanPreview(detailDetail!.deviceId!);
          print("loanPreviewResponse${loanPreviewResponseModel}");
          setState(() {
            loanPreviewResponseModel;
          });
        }
      },
      onStateListenCallback: (preState, newState) =>
          {_listenToStateChanges(context, newState)},
      builder: (context, state, coordinator) {
        return detailDetail.isNotEmptyOrNull
            ? _buildMainUI(context, coordinator)
            : _createLoading();
      },
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

  void _listenToStateChanges(
      BuildContext context, DeviceLoanCreationState state) {}

  Widget _buildMainUI(context, DeviceLoanCreationCoordinator coordinator) {
    return CrayonPaymentScaffold(
      appBarAttributes: CrayonPaymentAppBarAttributes(
        key: const Key('CardDetailsScreen_AppBarBackButton'),
        left: [
          const CrayonPaymentAppBarButtonType.back(),
        ],
      ),
      bottomNavigationBar: loanPreviewResponseModel != null
          ? Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 18),
              child: selectButton(coordinator),
            )
          : SizedBox(),
      body: ListView(
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
                          detailDetail!.brand! +
                              "-" +
                              detailDetail!.modelNumber!,
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
          loanPreviewResponseModel == null
              ? CrayonPaymentText(
                  key: Key('${_identifier}_ERROR_API'),
                  text: TextUIDataModel(
                      'Something went wrong,Please try again later!',
                      styleVariant: CrayonPaymentTextStyleVariant.headline4,
                      color: AN_TitleColor,
                      fontWeight: FontWeight.w600),
                )
              : _loanDetails(context),
          dynamicHSpacer(20),
        ],
      ),
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
      key: const Key('Select'),
      title:
          'Pay Now ${loanPreviewResponseModel!.data!.totalAmountToBeRepaid}TZHS',
      borderRadius: 8,
      height: CrayonPaymentDimensions.marginFortyEight,
      buttonColor: LS_ButtonColor,
      textColor: White,
      textStyleVariant: CrayonPaymentTextStyleVariant.headline4,
      onPressed: () {
        coordinator.navigateToDownPayment(detailDetail?.deviceId);
      },
    );
  }

  _loanDetails(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrayonPaymentText(
          key: Key(''),
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
          key: Key(''),
          text: TextUIDataModel('DLC_Wallets_Title'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline4,
              color: AN_CardTitle,
              fontWeight: FontWeight.w600),
        ),
        dynamicHSpacer(20),
        _radioButton(),
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
                key: Key(''),
                text: TextUIDataModel(key,
                    styleVariant: CrayonPaymentTextStyleVariant.headline5,
                    color: AN_CardTitle,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Expanded(
              flex: 1,
              child: CrayonPaymentText(
                key: Key(''),
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

  _radioButton() {
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
              Image.asset("assets/images/airtel.png"),
              SizedBox(width: 10),
              CrayonPaymentText(
                key: Key('${_identifier}_Device_Loan_Airtel_Pay'),
                text: TextUIDataModel('DLC_Airtel_Pay'.tr,
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: SECONDARY_COLOR,
                    fontWeight: FontWeight.w600),
              ),
              Spacer(),
              Radio(
                value: 1,
                groupValue: 1,
                activeColor: SU_button_color,
                onChanged: (value) {},
              )
            ],
          ),
        ));
  }
}
