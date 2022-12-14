import 'dart:async';
import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/mobile_core.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_data_models/downpayment/downpayment_screen_args.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/utils/app_utils.dart';
import 'package:downpayment/downpayment_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../state/downpayment_state.dart';
import '../viewmodel/downpayment_coordinator.dart';
import 'package:sprintf/sprintf.dart';

class DownPaymentScreen extends StatefulWidget {
  static const viewPath =
      '${DownPaymentModule.moduleIdentifier}/downpaymetnscreen';

  final DownPaymentScreenArgs downPaymentScreenArgs;

  const DownPaymentScreen({Key? key, required this.downPaymentScreenArgs})
      : super(key: key);

  @override
  State<DownPaymentScreen> createState() => _DownPaymentScreenState();
}

class _DownPaymentScreenState extends State<DownPaymentScreen> {
  final String _identifier = 'downpayment-screen';
  bool _isBtnEnabled = false;
  String username = "";
  DownPaymentCoordinator? downPaymentCoordinator;
  late Timer _timer;
  final ValueNotifier<int> _startValue = ValueNotifier<int>(15);

  void startTimer() {
    const oneMintue = Duration(minutes: 15);
    _timer = Timer.periodic(
      oneMintue,
      (Timer timer) {
        if (_startValue.value == 0) {
          if (mounted) {
            setState(() {
              timer.cancel();
            });
          }
        } else {
          if (mounted) {
            _startValue.value--;
          }
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) =>
      BaseView<DownPaymentCoordinator, DownPaymentState>(
          setupViewModel: (coordinator) async {
            downPaymentCoordinator = coordinator;
            coordinator.initialiseState(context);
            username = await coordinator.getNewCustomerName(); //getAgentName();
            setState(() {
              username;
            });
            coordinator.setData(context, widget.downPaymentScreenArgs);
            // coordinator.makePayment(context,widget.downPaymentScreenArgs.amount);
          },
          onStateListenCallback: (preState, newState) => {
                _listenToStateChanges(
                    context, newState as DownPaymentStateReady)
              },
          builder: (context, state, coordinator) => SafeArea(
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size(double.infinity, 102),
                    child: _buildAppBarAttributes(
                        context, state as DownPaymentStateReady, coordinator),
                  ),
                  bottomNavigationBar: _buildContinueButton(
                      context, coordinator, state as DownPaymentStateReady),
                  body: state.when(
                    initialState: () => const SizedBox(),
                    ready: (
                      _,
                      __,
                      ___,
                      ____,
                      _____,
                      ______,
                      _______,
                      ________,
                      _________,
                    ) =>
                        _buildMainUIWithLoading(
                      context,
                      coordinator,
                      (state as DownPaymentStateReady),
                    ),
                  ),
                ),
              ));

  _buildAppBarAttributes(BuildContext context, DownPaymentStateReady state,
      DownPaymentCoordinator coordinator) {
    return _buildBackBtn(context, state, coordinator);
  }

  Widget _buildBackBtn(BuildContext context, DownPaymentStateReady state,
      DownPaymentCoordinator coordinator) {
    return Align(
      alignment: Alignment.topLeft,
      child: CrayonBackButton(
        key: const Key('signup_backButton'),
        color: Colors.black,
        onPressed: () {
          if (!state.isLoading) {
            coordinator.pop();
          }
        },
      ),
    );
  }

  Widget _buildMainUIWithLoading(
    BuildContext context,
    DownPaymentCoordinator coordinator,
    DownPaymentStateReady state,
  ) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: _buildMainUI(context, coordinator, state),
        ),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(DownPaymentStateReady state) {
    if (state.isLoading) {
      return const CenteredCircularProgressBar(color: PRIMARY_COLOR);
    } else {
      return Container();
    }
  }

  Widget _buildMainUI(
    BuildContext context,
    DownPaymentCoordinator coordinator,
    DownPaymentStateReady state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        SizedBox(
          height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 5),
        ),
        //_image(context)

        Expanded(
          flex: 5,
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: AppUtils.appUtilsInstance
                        .getPercentageSize(percentage: 5),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7.0),
                    child: _getCircularIcon(
                      context,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: _getVerticalDivider(context, 100),
                  ),
                ],
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: AppUtils.appUtilsInstance
                          .getPercentageSize(percentage: 9)),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _image(context),
                        // FlutterLogo(),
                        SizedBox(
                          height: AppUtils.appUtilsInstance
                              .getPercentageSize(percentage: 8),
                        ),
                        _title(context),
                        SizedBox(
                          height: AppUtils.appUtilsInstance
                              .getPercentageSize(percentage: 5),
                        ),
                        _subTitle(context),
                      ],
                    ),
                  ),
                ),
              ),
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ),

        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _rowWidget(
                  context,
                  icon: _getIcon(context, state.paymentRequested),
                  text: _textWidget(context, 'DP_RequestPayment'.tr,
                      state.paymentRequested == 0 ? true : false),
                ),
                _getVerticalDivider(context,
                    AppUtils.appUtilsInstance.getPercentageSize(percentage: 8)),
                _rowWidget(
                  context,
                  icon: _getIcon(context, state.waitForPayment),
                  text: _textWidget(context, 'DP_WaitingForPayment'.tr, false),
                ),
                _getVerticalDivider(context,
                    AppUtils.appUtilsInstance.getPercentageSize(percentage: 8)),
                _rowWidget(
                  context,
                  icon: _getIcon(context, state.paymentReceived),
                  text: _textWidget(context, 'DP_PaymentReceived'.tr, false),
                ),
                _getVerticalDivider(context,
                    AppUtils.appUtilsInstance.getPercentageSize(percentage: 8)),
                _rowWidget(
                  context,
                  icon: _getIcon(context,widget.downPaymentScreenArgs.isOutOfStock==true ? state.loanCreated :  state.loanApproved),
                  text: _textWidget(context,widget.downPaymentScreenArgs.isOutOfStock==true ? 'DP_LoanCreated'.tr : 'DP_LoanApproved'.tr, false),
                ),
                SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(percentage: 8),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _getCircularIcon(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AN_VerticalDivider,
      ),
      margin: EdgeInsets.only(top: 20),
      height: 5,
      width: 5,
    );
  }

  Widget _getCheckedIcon(BuildContext context, Color color) {
    return Icon(
      Icons.check_circle,
      color: color,
      size: 20,
    );
  }

  Widget _getIcon(BuildContext context, num status) {
    return SvgPicture.asset(
      status == 0
          ? "assets/images/circular_grey.svg"
          : (status == 1)
              ? "assets/images/circular_tick.svg"
              : "assets/images/circular_cross.svg",
      height: 20,
      width: 20,
    );
  }

  Widget _getVerticalDivider(BuildContext context, double height) {
    return Padding(
      padding: const EdgeInsets.only(left: 9.0),
      child: Container(
        width: 1,
        height: height,
        color: AN_VerticalDivider,
      ),
    );
  }

  Widget _buildContinueButton(
    BuildContext context,
    DownPaymentCoordinator coordinator,
    DownPaymentStateReady state,
  ) {
    //print("testing loan status====> ${state.loanApproved}");
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          if(widget.downPaymentScreenArgs.isOutOfStock==true && state.loanCreated==1){
            await coordinator.navigatetoSuccessScreen();
          }
          if (state.loanApproved == 1) {
            await coordinator.navigateToScanCodeScreen(
                widget.downPaymentScreenArgs.deviceId,
                widget.downPaymentScreenArgs.modelName);
          } else {
            _isBtnEnabled = false;
          }

          // if(state.loanApproved==1) {
          //   _isBtnEnabled = true;
          //     if(_isBtnEnabled){
          //     await coordinator.navigateToScanCodeScreen(
          //         widget.downPaymentScreenArgs.deviceId,
          //         widget.downPaymentScreenArgs.modelName);
          //   } else {
          //       _isBtnEnabled = false;
          //     }
          // }
          // else {
          //   _isBtnEnabled = false;
          // }
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: _isBtnEnabled ? SU_button_color : SU_grey_color,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'SU_button_text'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_DLC_Down_Payment'),
      text: const TextUIDataModel('DLC_Down_Payment',
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }

  Widget _image(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: DP_CircleColor,
      ),
      height: 70,
      width: 70,
      child: Center(
          child: CrayonPaymentText(
        key: Key('${_identifier}_Agent_Name'),
        text: TextUIDataModel(_getCaptialUserName(username),
            styleVariant: CrayonPaymentTextStyleVariant.headline6,
            color: AN_TitleColor,
            fontWeight: FontWeight.w600),
      )),
    );
  }

  String _getCaptialUserName(String letter) => letter.isNotEmpty
      ? letter.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  _title(BuildContext context) {
    return CrayonPaymentText(
        key: Key('${_identifier}_DLC_payment_text'),
        text: TextUIDataModel(
          '${widget.downPaymentScreenArgs.amount.toString()} ${'DLC_payment_text'.tr}',
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600,
        ));
  }

  _textWidget(BuildContext context, String? text, bool isResend) {
    return Row(
      children: [
        CrayonPaymentText(
          key: Key('${_identifier}_Waiting_Payment'),
          text: TextUIDataModel(text!,
              styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
              color: Black,
              fontWeight: FontWeight.w500),
        ),
        dynamicWSpacer(30),
        isResend
            ? InkWell(
                onTap: () {
                  downPaymentCoordinator!.makePayment(
                      context, widget.downPaymentScreenArgs.amount);
                },
                child: Text('DLC_resend'.tr,
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: SU_subtitle_terms_color)),
              )
            : Text("")
      ],
    );
  }

  _subTitle(BuildContext context) {
    return
        //       CrayonPaymentText(
        //       key: Key('${_identifier}_DLC_Down_Payment_Subtitle'),
        //       text: const TextUIDataModel(
        //           'DLC_Down_Payment_Subtitle',
        //           styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
        //           color: VO_ResendTextColor,
        //           fontWeight: FontWeight.w400),
        // );

        ValueListenableBuilder<int>(
            valueListenable: _startValue,
            builder: (BuildContext context, int value, Widget? child) {
              return Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'DLC_Down_Payment_Subtitle'.tr,
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: DD_TextLabel,
                          fontWeight: FontWeight.w600),
                      //
                      // children: const <TextSpan>[
                      //  TextSpan(
                      //   text: "  ",
                      //  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color : Color(0xFFDA2228))),
                      //   TextSpan(
                      //       text: "1 min 34 sec",
                      //       style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color : Color(0xFFDA2228))),
                      //
                      // ],
                    ),
                  ));
            });
  }

  _rowWidget(BuildContext context, {Widget? icon, Widget? text}) {
    return Row(
      children: [
        icon!,
        SizedBox(
          width: AppUtils.appUtilsInstance
              .getPercentageSize(percentage: 7, ofWidth: true),
        ),
        text!
      ],
    );
  }

  _listenToStateChanges(
      BuildContext context, DownPaymentStateReady newState) async {
    String paymentFailed = await downPaymentCoordinator!.checkPaymentFailed();
    String paymentCalled = await downPaymentCoordinator!.getPaymentStatus();

    String paymentStatusAPICalled = "";
    // if (paymentFailed == "Payment Failed") {
    //   return;
    // }

    //to show the stock sheet in case of the loan created and came from work flow
    if(widget.downPaymentScreenArgs.isBottomSheetShown == true && newState.loanCreated == 1){
      downPaymentCoordinator!.showErrorBottomSheet(
          _getOutOfStockUI(context, downPaymentCoordinator!), context);
      return;
    }
    //showing button enabled on loan creation and out of stock is selected from device loan screen
    if(widget.downPaymentScreenArgs.isOutOfStock==true && newState.loanCreated==1){
        setState(() {
          _isBtnEnabled = true;
        });

      return;
    }
    if (newState.loanApproved == 1) {
      setState(() {
        _isBtnEnabled = true;
      });
    } else if (paymentFailed == "Payment Failed") {
      return;
    } else if (newState.loanApproved == 2) {
      return;
    } else {
      if (newState.waitForPayment == 1 &&
          newState.paymentRequested == 1 &&
          newState.createLoan == 0 &&
          paymentStatusAPICalled == "") {
        Future.delayed(const Duration(seconds: 10), () {
          paymentStatusAPICalled = "true";
          if (paymentCalled == "") {
            downPaymentCoordinator!.checkPaymentStatus(context);
          }
        });
      }
    }
  }

  Widget _getOutOfStockUI(
      BuildContext context, DownPaymentCoordinator coordinator) {
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
                 const TextSpan(
                      text: ' Samsung\n- A03 Core ',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  TextSpan(
                      text: "DLC_inventory_continue_joining_fee_payment".tr,
                      style: const TextStyle(
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
          _buildOutOfStockOnBoardLaterButton(context, coordinator)
        ],
      ),
    );
  }

  Widget _buildStockAvailableButton(
      BuildContext context, DownPaymentCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {

          coordinator.goBack();
          coordinator.loanApproval(widget.downPaymentScreenArgs.subTitle, context);
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


  _buildOutOfStockOnBoardLaterButton(
      BuildContext context, DownPaymentCoordinator coordinator) {
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
