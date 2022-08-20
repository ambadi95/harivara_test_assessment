import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:passcode/passcode_module.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';
import 'package:shared_data_models/kyc/kyc_type.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/icon_utils.dart';

import '../kyc_credit_module.dart';
import '../state/kyc_credit_state.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../viewmodel/kyc_credit_coordinator.dart';

class KycCreditScreen extends StatefulWidget {
  static const viewPath = '${KycCreditModule.moduleIdentifier}/kycscreen';
  final KycScreenArgs kycScreenArgs;

  const KycCreditScreen({Key? key, required this.kycScreenArgs})
      : super(key: key);

  @override
  State<KycCreditScreen> createState() => _KycCreditScreenState();
}

class _KycCreditScreenState extends State<KycCreditScreen> {
  final String _identifier = 'kyc_credit-screen';
  bool _isBtnEnabled = false;
  bool _isKycPassEnabled = false;

  bool _isKycCreditLoanEnabled = false;

  @override
  Widget build(BuildContext context) =>
      BaseView<KycCreditCoordinator, KycCreditState>(
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
                    (state as KycCreditStateReady),
                  ),
                ),
              ));

  Widget _buildMainUIWithLoading(
    BuildContext context,
    KycCreditCoordinator coordinator,
    KycCreditStateReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(KycCreditStateReady state) {
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
    KycCreditCoordinator coordinator,
    KycCreditStateReady state,
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
                          .getPercentageSize(percentage: 10)),
                  _getCheckedIcon(
                    context,
                    !_isKycPassEnabled ? Colors.grey : Colors.green,
                  ),
                  _getVerticalDivider(
                      context,
                      AppUtils.appUtilsInstance
                          .getPercentageSize(percentage: 15)),
                  _getCheckedIcon(
                    context,
                    !_isKycCreditLoanEnabled ? Colors.grey : Colors.green,
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
              const SizedBox(
                width: 34,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getImage(context),
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
                  _kycPassCheckText(context),
                  SizedBox(
                    height: AppUtils.appUtilsInstance
                        .getPercentageSize(percentage: 15),
                  ),
                  _kycLoanCheckText(context),
                  const Spacer(
                    flex: 1,
                  ),
                ],
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
    KycCreditCoordinator coordinator,
    KycCreditState state,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            if (!_isKycPassEnabled) {
              _isKycPassEnabled = true;
            } else if (!_isKycCreditLoanEnabled) {
              _isKycCreditLoanEnabled = true;
              _isBtnEnabled = true;
            }
          });
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
      key: Key('${_identifier}_KYC_Titlee'),
      text: const TextUIDataModel('KYC_Title',
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }

  Widget _getImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(75.0),
      child: const Image(
        image: AssetImage(AN_Kyc_Airtel),
        height: 90,
        width: 90,
      ),
    );
  }



  _title(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_KYC_Validation_With_Airtel'),
      text: const TextUIDataModel('KYC_Validation_With_Airtel',
          styleVariant: CrayonPaymentTextStyleVariant.headline2,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600),
    );
  }

  _kycLoanCheckText(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_KYC_Validation_With_Airtel_Loan_Check'),
      text: const TextUIDataModel('KYC_Validation_With_Airtel_Loan_Check',
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: Black,
          fontWeight: FontWeight.w500),
    );
  }

  _kycPassCheckText(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_KYC_Validation_With_Airtel_Pass_Check'),
      text: const TextUIDataModel('KYC_Validation_With_Airtel_Pass_Check',
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: Black,
          fontWeight: FontWeight.w500),
    );
  }

  _subTitle(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_KYC_Validation_With_Airtel_Subtitle'),
      text: const TextUIDataModel('KYC_Validation_With_Airtel_Subtitle',
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: AN_SubTitleColor,
          fontWeight: FontWeight.w400),
    );
  }




}
