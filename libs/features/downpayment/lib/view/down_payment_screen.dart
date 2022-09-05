import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_data_models/downpayment/downpayment_screen_args.dart';
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
import 'package:widget_library/utils/icon_utils.dart';

import '../state/downpayment_state.dart';
import '../viewmodel/downpayment_coordinator.dart';

class DownPaymentScreen extends StatefulWidget {
  static const viewPath =
      '${DownPaymentModule.moduleIdentifier}/downpaymetnscreen';

  final DownPaymentScreenArgs downPaymentScreenArgs;

  const DownPaymentScreen({Key? key, required this.downPaymentScreenArgs}) : super(key: key);

  @override
  State<DownPaymentScreen> createState() => _DownPaymentScreenState();
}

class _DownPaymentScreenState extends State<DownPaymentScreen> {
  final String _identifier = 'downpayment-screen';
  bool _isBtnEnabled = false;

  String username = "";
  DownPaymentCoordinator? downPaymentCoordinator;

  @override
  Widget build(BuildContext context) =>
      BaseView<DownPaymentCoordinator, DownPaymentState>(
          setupViewModel: (coordinator) async {
            downPaymentCoordinator=coordinator;
            coordinator.initialiseState(context);
            username = await coordinator.getAgentName();
            setState(() {
              username;
            });
            coordinator.setData(context,widget.downPaymentScreenArgs);
            coordinator.makePayment(context,widget.downPaymentScreenArgs.amount);
          },
          onStateListenCallback: (preState, newState) => {
            _listenToStateChanges(
                context, newState as DownPaymentStateReady)
          },
          builder: (context, state, coordinator) => CrayonPaymentScaffold(
            appBarAttributes: CrayonPaymentAppBarAttributes(
              key: const Key('CardDetailsScreen_AppBarBackButton'),
              left: [
                const CrayonPaymentAppBarButtonType.back(),
              ],
            ),
            bottomNavigationBar:
            _buildContinueButton(context, coordinator, state),
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
                  ) =>
                  _buildMainUIWithLoading(
                    context,
                    coordinator,
                    (state as DownPaymentStateReady),
                  ),
            ),
          ));

  Widget _buildMainUIWithLoading(
      BuildContext context,
      DownPaymentCoordinator coordinator,
      DownPaymentStateReady state,
      ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
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
        // _image(context)

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
                  icon:  _getIcon(context,state.paymentRequested),
                  text: _textWidget(context, 'DP_RequestPayment'.tr),
                ),
                _getVerticalDivider(
                    context,
                    AppUtils.appUtilsInstance
                        .getPercentageSize(percentage: 10)),
                _rowWidget(
                  context,
                  icon:  _getIcon(context,state.waitForPayment),

                  text: _textWidget(context, 'DP_WaitingForPayment'.tr),
                ),
                _getVerticalDivider(
                    context,
                    AppUtils.appUtilsInstance
                        .getPercentageSize(percentage: 10)),
                _rowWidget(
                  context,
                  icon:  _getIcon(context,state.paymentReceived),

                  text: _textWidget(context, 'DP_PaymentReceived'.tr),
                ),
                _getVerticalDivider(
                    context,
                    AppUtils.appUtilsInstance
                        .getPercentageSize(percentage: 10)),
                _rowWidget(
                  context,
                  icon:  _getIcon(context,state.loanApproved),

                  text: _textWidget(context, 'DP_LoanApproved'.tr),
                ),
                SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(percentage: 10),
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
      DownPaymentCoordinator coordinator,
      DownPaymentState state,
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          await coordinator.navigateToScanCodeScreen(widget.downPaymentScreenArgs.deviceId);
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
      key: Key('${_identifier}_Downpayment_Title'),
      text: const TextUIDataModel('Downpayment',
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
      key: Key('${_identifier}_Payment_Request'),
      text:  TextUIDataModel(
          '${widget.downPaymentScreenArgs.amount.toString()} TZSHS\npayment request has\nbeen sent to Y9',
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600),
    );
  }

  _textWidget(BuildContext context, String? text) {
    return CrayonPaymentText(
      key: Key('${_identifier}_Waiting_Payment'),
      text: TextUIDataModel(text!,
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: Black,
          fontWeight: FontWeight.w500),
    );
  }

  _subTitle(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_Transaction_Gateway'),
      text: const TextUIDataModel(
          'Transaction gateway will be closed in next 15 minutes',
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: VO_ResendTextColor,
          fontWeight: FontWeight.w400),
    );
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

  _listenToStateChanges(BuildContext context, DownPaymentStateReady newState) {
    //kyc done
    if (newState.waitForPayment == 1 && newState.paymentReceived==0) {

      Future.delayed(const Duration(seconds: 25), () {

        downPaymentCoordinator!.checkPaymentStatus(context);


      });

    }if (newState.paymentReceived == 1) {

      downPaymentCoordinator!.createLoan(context,widget.downPaymentScreenArgs.deviceId.toString());
    }
  }
}
