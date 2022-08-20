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
  static const viewPath = '${DownPaymentModule.moduleIdentifier}/downpaymetnscreen';
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
          height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 10),
        ),
        // _image(context)
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  _getCircularIcon(
                    context,
                  ),
                  Expanded(
                    child: _getVerticalDivider(
                        context,
                        AppUtils.appUtilsInstance
                            .getPercentageSize(percentage: 0)),
                  ),
                  _getVerticalDivider(
                      context,
                      AppUtils.appUtilsInstance
                          .getPercentageSize(percentage: 20)),
                  _getCheckedIcon(
                    context,
                    Colors.grey,
                  ),
                  _getVerticalDivider(
                      context,
                      AppUtils.appUtilsInstance
                          .getPercentageSize(percentage: 15)),
                  _getCheckedIcon(
                    context,
                    Colors.grey,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // _getImage(context),
                    SizedBox(
                      height: AppUtils.appUtilsInstance
                          .getPercentageSize(percentage: 5),
                    ),
                    _title(context),
                    SizedBox(
                      height: AppUtils.appUtilsInstance
                          .getPercentageSize(percentage: 5),
                    ),
                    _subTitle(context),
                    SizedBox(
                      height: AppUtils.appUtilsInstance
                          .getPercentageSize(percentage: 15),
                    ),
                    _downPaymentRequestPayment(context),
                    SizedBox(
                      height: AppUtils.appUtilsInstance
                          .getPercentageSize(percentage: 15),
                    ),
                    _downpaymentWaitingPayment(context),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        _buildContinueButton(context, coordinator, state)
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
    return Container(
      width: 1,
      height: height,
      color: AN_VerticalDivider,
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

  Widget _getImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(75.0),
      child:  Image(
        image: AssetImage(''),
        height: 90,
        width: 90,
      ),
    );
  }

  Widget _image(BuildContext context) {
    return getSvg(
      widget.downPaymentScreenArgs.image,
      height: 100,
      width: 100,
    );
  }

  _title(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_Payment_Request'),
      text: const TextUIDataModel('70,000 TZSHS\npayment request has\nbeen sent to Y9',
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600),
    );
  }

  _downpaymentWaitingPayment(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_Waiting_Payment'),
      text: const TextUIDataModel('Waiting for Payment',
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: Black,
          fontWeight: FontWeight.w500),
    );
  }

  _downPaymentRequestPayment(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_Requested_for_Payment'),
      text: const TextUIDataModel('Requested for Payment',
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: Black,
          fontWeight: FontWeight.w500),
    );
  }

  _subTitle(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_Transaction_Gateway'),
      text: const TextUIDataModel('Transaction gateway will be closed in next 15 minutes',
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: VO_ResendTextColor,
          fontWeight: FontWeight.w400),
    );
  }

}
