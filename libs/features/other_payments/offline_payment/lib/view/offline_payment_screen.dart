import 'dart:async';

import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/mobile_core.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_data_models/offlinepayment/offlinepayment_screen_args.dart';
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
import '../offlinepayment_module.dart';
import '../state/offlinepayment_state.dart';
import '../viewmodel/offlinepayment_coordinator.dart';
import 'package:sprintf/sprintf.dart';

class OfflinePaymentScreen extends StatefulWidget {
  static const viewPath =
      '${OfflinePaymentModule.moduleIdentifier}/offlinePaymentScreen';

  final OfflinePaymentScreenArgs offlinePaymentScreenArgs;

  const OfflinePaymentScreen({Key? key, required this.offlinePaymentScreenArgs}) : super(key: key);

  @override
  State<OfflinePaymentScreen> createState() => _OfflinePaymentScreenState();
}

class _OfflinePaymentScreenState extends State<OfflinePaymentScreen> {
  final String _identifier = 'offlinepayment-screen';
  bool _isBtnEnabled = false;
  String username = "";
  OfflinePaymentCoordinator? offlinePaymentCoordinator;
  late Timer _timer;
  num _isPaymentReceivedOffline = 0;
  final ValueNotifier<int> _startValue = ValueNotifier<int>(15);

  @override
  void initState(){
    super.initState();
    delayFun();
  }

void delayFun(){
  Future.delayed(const Duration(milliseconds: 1000), () {
    setState(() {
      _isPaymentReceivedOffline = 1;
    });
  });
}



  @override
  Widget build(BuildContext context) =>
      BaseView<OfflinePaymentCoordinator, OfflinePaymentState>(
          setupViewModel: (coordinator) async {
            offlinePaymentCoordinator=coordinator;
            coordinator.initialiseState(context);
            username = await coordinator.getNewCustomerName(); //getAgentName();
            setState(() {
              username;
            });
            coordinator.createLoan(context,widget.offlinePaymentScreenArgs);
            //coordinator.makePayment(context,widget.offlinePaymentScreenArgs.amount);
          },
          onStateListenCallback: (preState, newState) => {
                _listenToStateChanges(
                    context, newState as OfflinePaymentStateReady)
              },
          builder: (context, state, coordinator) =>
              CrayonPaymentScaffold(
                appBarAttributes: CrayonPaymentAppBarAttributes(
                  key: const Key('CardDetailsScreen_AppBarBackButton'),
                  left: [
                    const CrayonPaymentAppBarButtonType.back(),
                  ],
                ),
                bottomNavigationBar:
                    _buildContinueButton(context, coordinator, state as OfflinePaymentStateReady),
                body: state.when(
                  initialState: () => const SizedBox(),
                  ready: (
                    _,
                    __,
                    ___,
                    ____,
                    _____,
                    ______,
                  ) =>
                      _buildMainUIWithLoading(
                    context,
                    coordinator,
                    (state),
                  ),
                ),
              ));

  Widget _buildMainUIWithLoading(
    BuildContext context,
    OfflinePaymentCoordinator coordinator,
    OfflinePaymentStateReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(OfflinePaymentStateReady state) {
    if (state.isLoading) {
      return const CenteredCircularProgressBar(color: PRIMARY_COLOR);

    } else {
      return Container();
    }
  }

  Widget _buildMainUI(
    BuildContext context,
    OfflinePaymentCoordinator coordinator,
    OfflinePaymentStateReady state,
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

                _getVerticalDivider(
                    context,
                    AppUtils.appUtilsInstance
                        .getPercentageSize(percentage: 8)),
                _rowWidget(
                  context,
                  icon:  _getIcon(context, _isPaymentReceivedOffline),

                  text: _textWidget(context, 'Offline_payment_checkboxTitle1'.tr),
                ),
                _getVerticalDivider(
                    context,
                    AppUtils.appUtilsInstance
                        .getPercentageSize(percentage: 8)),
                _rowWidget(
                  context,
                  icon:  _getIcon(context,widget.offlinePaymentScreenArgs.isOutOfStock==true ? state.loanCreated : state.loanApproved),

                  text: _textWidget(context,widget.offlinePaymentScreenArgs.isOutOfStock==true ? 'DP_LoanCreated'.tr :  'Offline_payment_checkboxTitle2'.tr),
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
    return SvgPicture.asset(status == 0  ? "assets/images/circular_grey.svg" : (status == 1) ? "assets/images/circular_tick.svg" : "assets/images/circular_cross.svg",height: 20,width: 20,);
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
    OfflinePaymentCoordinator coordinator,
    OfflinePaymentStateReady state,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          if(widget.offlinePaymentScreenArgs.isOutOfStock==true && state.loanCreated==1){

            await coordinator.navigatetoSuccessScreen();
          }else if(state.loanApproved==1) {
           // await coordinator.navigateToScanCodeScreen(1, "Samsung - A03 Core");
               await coordinator.navigateToScanCodeScreen(
                   widget.offlinePaymentScreenArgs.deviceId,
                   widget.offlinePaymentScreenArgs.modelName);
          }
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
      ? letter.trim().split(' ').map((l) => l[0]).take(2).join().toUpperCase()
      : '';

  _title(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_DLC_payment_text'),
      text: TextUIDataModel(
         'Offline_payment_title'.tr,

        styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600,
    ));
  }

  _textWidget(BuildContext context, String? text) {
    return Row(
      children: [
        CrayonPaymentText(
          key: Key('${_identifier}_Waiting_Payment'),
          text: TextUIDataModel(text!,
              styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
              color: Black,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  _subTitle(BuildContext context){
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
              child:  RichText(
                text: TextSpan(
                  text: 'Offline_payment_subtitle'.tr,
                  style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14, color: DD_TextLabel, fontWeight: FontWeight.w600
                  ),
                  // children: const <TextSpan>[
                  //  TextSpan(
                  //   text: "  ",
                  //  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color : Color(0xFFDA2228))),
                  //   TextSpan(
                  //     text : "1 min 30 sec",
                  //      // text: "${value.toString()} min",
                  //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color : Color(0xFFDA2228))),
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

  _listenToStateChanges(BuildContext context, OfflinePaymentStateReady newState) async{

    if(widget.offlinePaymentScreenArgs.isOutOfStock==true && newState.loanCreated==1){
      setState(() {
        _isBtnEnabled=true;
      });
      return ;
    }
    if(newState.loanApproved == 1){
        setState(() {
           _isBtnEnabled=true;
         });
       }else if(newState.loanApproved == 2){
         return;
       }

  }
}

