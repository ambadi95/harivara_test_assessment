import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:loan_details/loan_detail_module.dart';
import 'package:loan_details/state/loan_detail_state.dart';
import 'package:loan_details/viewmodel/loan_detail_coordinator.dart';

import 'package:shared_data_models/loan_detail/loan_detail_screen_args.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

class LoanDetailScreen extends StatefulWidget {
  static const viewPath = '${LoanDetailModule.moduleIdentifier}/loandetail';
  //final LoanDetailArgs loanDetailArgs;

  const LoanDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoanDetailScreen> createState() => _LoanDetailScreenState();
}

class _LoanDetailScreenState extends State<LoanDetailScreen> {
  final String _identifier = 'loan_detail-screen';

  @override
  Widget build(BuildContext context) =>
      BaseView<LoanDetailCoordinator, LoanDetailState>(
          setupViewModel: (coordinator) {
            coordinator.initialiseState(context);
          },
          builder: (context, state, coordinator) => CrayonPaymentScaffold(
                scaffoldBackgroundColor: Loan_Detail_Background,
                appBarAttributes: CrayonPaymentAppBarAttributes(
                  key: const Key('CardDetailsScreen_AppBarBackButton'),
                  appBarColor: Loan_Detail_Background,
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
                    (state as LoanDetailStateReady),
                  ),
                ),
              ));

  Widget _buildMainUIWithLoading(
    BuildContext context,
    LoanDetailCoordinator coordinator,
    LoanDetailStateReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(LoanDetailStateReady state) {
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
    LoanDetailCoordinator coordinator,
    LoanDetailStateReady state,
  ) {
    return ListView(
      children: [
        _buildTitle(context, coordinator),
        SizedBox(
          height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 10),
        ),
        _getLoanDetailBanner(
            title: "Y9 Device Loan",
            deviceName: "Samsung - A13",
            deviceStats: "8GB, 128GB Storage| Exynos 2100 |\nAndroid12",
            deviceImage: LD_loan_detail_banner_image,
            deviceId: "648960359535569"),
        _getSpaceBetweenWidget(4),
        _getLoanDetailWithCurrencyWidget(
            title: 'LD_Loan_Detail_Amount', value: "6,85,000 "),
        _getSpaceBetweenWidget(4),
        _getLoanDetailWithCurrencyWidget(
            title: 'LD_Loan_Detail_Down_Payment', value: "40,000 "),
        _getSpaceBetweenWidget(4),
        _getLoanDetailWidget(
            title: 'LD_Loan_Detail_Repayment', value: "Daily EMI"),
        _getSpaceBetweenWidget(4),
        _getLoanDetailWithCurrencyWidget(
            title: 'LD_Loan__Detail_Daily_Repayment_Amount', value: "2,000 "),
        _getSpaceBetweenWidget(4),
        _getLoanDetailWithCurrencyWidget(
            title: 'LD_Loan_Detail_Total_Repayed_Amount', value: "7,70,000 "),
        _getSpaceBetweenWidget(4),
        _getLoanDetailWidget(
            title: 'LD_Loan_Detail_Loan_Tenure', value: "365 days"),
        _getSpaceBetweenWidget(4),
        _getLoanDetailWidget(
            title: 'LD_Loan_Detail_Start_Date', value: "10 Aug, 2022"),
        _getSpaceBetweenWidget(4),
        _getLoanDetailWidget(
            title: 'LD_Loan_Detail_Final_Date', value: "10 Aug, 2023"),
        _getSpaceBetweenWidget(4),
        _getLoanDetailWidget(
            title: 'LD_Loan_Detail_Device_Insurance', value: "Y9 Standard"),
        _getSpaceBetweenWidget(4),
        _getLoanDetailWidget(
            title: 'LD_Loan_Detail_Device_Insurance_ID',
            value: "824596945683495"),
        _getSpaceBetweenWidget(8),
        _buildTermsAndConditionWidget(context, coordinator),
        _getSpaceBetweenWidget(10),
        _buildNoteWidget(context),
        _getSpaceBetweenWidget(10),
      ],
    );
  }

  Widget _getLoanDetailBanner({
    required String title,
    required String deviceName,
    required String deviceStats,
    required String deviceImage,
    required String deviceId,
  }) {
    return Container(
      height: 170,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Loan_Banner_Background,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: White,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
              ),
              _getSpaceBetweenWidget(2),
              Text(
                deviceId,
                style: const TextStyle(
                  color: White,
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                ),
              ),
              _getSpaceBetweenWidget(4),
              Text(
                deviceName,
                style: const TextStyle(
                  color: White,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat',
                ),
              ),
              _getSpaceBetweenWidget(2),
              Text(
                deviceStats,
                style: const TextStyle(
                  color: White,
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),
          const Image(
            image: AssetImage(LD_loan_detail_banner_image),
            width: 160,
            //fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _getSpaceBetweenWidget(double percentage) {
    return SizedBox(
      height:
          AppUtils.appUtilsInstance.getPercentageSize(percentage: percentage),
    );
  }

  Widget _buildNoteWidget(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_LD_Loan_Detail_Note'),
      text: const TextUIDataModel('LD_Loan_Detail_Note',
          textAlign: TextAlign.start,
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: VO_ResendTextColor,
          fontWeight: FontWeight.w400),
    );
  }

  Widget _buildTermsAndConditionWidget(
    BuildContext context,
    LoanDetailCoordinator coordinator,
  ) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: 'LD_Loan_Detail_Terms_and_conditions'.tr,
            style: const TextStyle(
              color: Black,
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
          TextSpan(
            text: 'LD_Loan_Detail_Terms'.tr,
            recognizer: TapGestureRecognizer()
              ..onTap = () => coordinator.navigateToTermsCondtionsScreen(),
            style: const TextStyle(
              color: SU_subtitle_terms_color,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(
    context,
    LoanDetailCoordinator coordinator,
  ) {
    return CrayonPaymentText(
      key: Key('${_identifier}_LD_Loan_Detail'),
      text: const TextUIDataModel('LD_Loan_Detail',
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }

  Widget _getLoanDetailWithCurrencyWidget(
      {required String title, required String value}) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: White,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: _getTitleWidget(context, title)),
          _getCurrencyValueWidget(context, value),
        ],
      ),
    );
  }

  Widget _getLoanDetailWidget({required String title, required String value}) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: White,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(flex: 2, child: _getTitleWidget(context, title)),
          _getValueWidget(context, value),
        ],
      ),
    );
  }

  Widget _getCurrencyValueWidget(context, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CrayonPaymentText(
          key: Key('${_identifier}_$value'),
          text: TextUIDataModel(value,
              textAlign: TextAlign.center,
              styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
              color: AN_TitleColor,
              fontWeight: FontWeight.w600),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            "TZSHS",
            style: TextStyle(
                color: Colors.black, fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }

  Widget _getValueWidget(context, String value) {
    return CrayonPaymentText(
      key: Key('${_identifier}_$value'),
      text: TextUIDataModel(value,
          textAlign: TextAlign.center,
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600),
    );
  }

  Widget _getTitleWidget(context, String title) {
    return CrayonPaymentText(
      key: Key('${_identifier}_$title'),
      text: TextUIDataModel(title,
          styleVariant: CrayonPaymentTextStyleVariant.headline4,
          color: AN_TitleColor,
          fontWeight: FontWeight.w400),
    );
  }
}
