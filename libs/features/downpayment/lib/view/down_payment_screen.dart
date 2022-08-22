import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:downpayment/downpayment_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_data_models/downpayment/downpayment_screen_args.dart';
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

  const DownPaymentScreen({Key? key, required this.downPaymentScreenArgs})
      : super(key: key);

  @override
  State<DownPaymentScreen> createState() => _DownPaymentScreenState();
}

class _DownPaymentScreenState extends State<DownPaymentScreen> {
  final String _identifier = 'downpayment-screen';
  bool _isBtnEnabled = false;

  @override
  Widget build(BuildContext context) =>
      BaseView<DownPaymentCoordinator, DownPaymentState>(
          setupViewModel: (coordinator) {
            coordinator.initialiseState(context);
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

          child: Stack(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 7.0),
                          child: _getCircularIcon(
                            context,
                          ),
                        ),
                        _getVerticalDivider(
                            context,
                            AppUtils.appUtilsInstance
                                .getPercentageSize(percentage: 70)),
                        _rowWidget(
                          context,
                          icon: _getCheckedIcon(
                            context,
                            Colors.green,
                          ),
                          text: _textWidget(context, 'DP_RequestPayment'.tr),
                        ),
                        _getVerticalDivider(
                            context,
                            AppUtils.appUtilsInstance
                                .getPercentageSize(percentage: 10)),
                        _rowWidget(
                          context,
                          icon: _getCheckedIcon(
                            context,
                            Colors.grey,
                          ),
                          text: _textWidget(context, 'DP_WaitingForPayment'.tr),
                        ),
                        _getVerticalDivider(
                            context,
                            AppUtils.appUtilsInstance
                                .getPercentageSize(percentage: 10)),
                        _rowWidget(
                          context,
                          icon: _getCheckedIcon(
                            context,
                            Colors.grey,
                          ),
                          text: _textWidget(context, 'DP_PaymentReceived'.tr),
                        ),
                        _getVerticalDivider(
                            context,
                            AppUtils.appUtilsInstance
                                .getPercentageSize(percentage: 10)),
                        _rowWidget(
                          context,
                          icon: _getCheckedIcon(
                            context,
                            Colors.grey,
                          ),
                          text: _textWidget(context, 'DP_LoanApproved'.tr),
                        ),
                        SizedBox(
                          height: AppUtils.appUtilsInstance
                              .getPercentageSize(percentage: 10),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: AppUtils.appUtilsInstance
                        .getPercentageSize(percentage: 7)),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _image(context),
                      // FlutterLogo(),
                      SizedBox(
                        height: AppUtils.appUtilsInstance
                            .getPercentageSize(percentage: 10),
                      ),
                      _title(context),
                      SizedBox(
                        height: AppUtils.appUtilsInstance
                            .getPercentageSize(percentage: 5),
                      ),
                      _subTitle(context),

                      const Spacer(
                        flex: 1,
                      ),
                    ],
                  ),
                ),
              )
            ],
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
      margin: const EdgeInsets.only(top: 30),
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
        onTap: () async {},
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
    return getSvg(
      "assets/images/downpay_circle.svg",
      height: 70,
      width: 70,
    );
  }

  _title(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_Payment_Request'),
      text: const TextUIDataModel(
          '70,000 TZSHS\npayment request has\nbeen sent to Y9',
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
              .getPercentageSize(percentage: 4, ofWidth: true),
        ),
        text!
      ],
    );
  }
}
