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

import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../kyccreditmain_module.dart';
import '../state/kyc_credit_main_state.dart';
import '../viewmodel/kyc_credit_main_coordinator.dart';

class KycCreditMainScreen extends StatefulWidget {
  static const viewPath =
      '${KycCreditMainModule.moduleIdentifier}/kyccreditmainscreen';
  final KycScreenArgs kycScreenArgs;

  const KycCreditMainScreen({Key? key, required this.kycScreenArgs})
      : super(key: key);

  @override
  State<KycCreditMainScreen> createState() => _KycCreditMainScreenState();
}

class _KycCreditMainScreenState extends State<KycCreditMainScreen> {
  final String _identifier = 'kyc_credit-main-screen';
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) =>
      BaseView<KycCreditMainCoordinator, KycCreditMainState>(
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
                    (state as KycCreditMainStateReady),
                  ),
                ),
              ));

  Widget _buildMainUIWithLoading(
    BuildContext context,
    KycCreditMainCoordinator coordinator,
    KycCreditMainStateReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(KycCreditMainStateReady state) {
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
    KycCreditMainCoordinator coordinator,
    KycCreditMainStateReady state,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context, coordinator),
            SizedBox(
              height:
                  AppUtils.appUtilsInstance.getPercentageSize(percentage: 5),
            ),
            _subTitleMain(context),
          ],
        ),
        const Image(image: AssetImage(AN_Kyc_Credit_Main)),
        Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Column(
            children: [
              _getTermsCheckBox(context, coordinator),
              const SizedBox(
                height: 20,
              ),
              _buildCheckNowButton(context, coordinator, state),
            ],
          ),
        )
      ],
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  Widget _getCheckBoxUnCheckErrorBottomSheetUi(
    BuildContext context,
    KycCreditMainCoordinator coordinator,
    KycCreditMainState state,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          const Image(
            image: AssetImage(AN_Kyc_Credit_ERROR),
            width: 78,
            height: 78,
          ),
          CrayonPaymentText(
            key: Key('${_identifier}_KYC_Terms_and_Condition_ERROR'),
            text: const TextUIDataModel('KYC_Terms_and_Condition',
                textAlign: TextAlign.center,
                styleVariant: CrayonPaymentTextStyleVariant.subtitle1,
                color: Black,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(
              percentage: 8,
            ),
          ),
          CrayonPaymentText(
            key: Key('${_identifier}_Terms_And_Condition_Error'),
            text: const TextUIDataModel('Terms_And_Condition_Error',
                textAlign: TextAlign.center,
                styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
                color: AN_SubTitleColor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(
              percentage: 8,
            ),
          ),
        /*  CrayonPaymentText(
            key: Key('${_identifier}_KYC_Verification_Failed_SubTitle'),
            text: const TextUIDataModel('KYC_Verification_Failed_SubTitle',
                styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
                textAlign: TextAlign.center,
                color: AN_SubTitleColor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(
              percentage: 8,
            ),
          ),*/
          _buildGoBackButton(context, coordinator, state),
        ],
      ),
    );
  }

  Widget _buildGoBackButton(
    BuildContext context,
    KycCreditMainCoordinator coordinator,
    KycCreditMainState state,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          coordinator.goBack();
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: SU_button_color, borderRadius: BorderRadius.circular(2.0)),
          child: Center(
            child: Text(
              'Back_To_Home'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckNowButton(
    BuildContext context,
    KycCreditMainCoordinator coordinator,
    KycCreditMainState state,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          if (_isChecked) {
            await coordinator.navigateToKycCreditAirtel();
          } else {
            coordinator.showErrorBottomSheet(
                _getCheckBoxUnCheckErrorBottomSheetUi(
                    context, coordinator, state),
                context);
          }
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: SU_button_color, borderRadius: BorderRadius.circular(2.0)),
          child: Center(
            child: Text(
              'KYC_Check_Now'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(
    context,
    KycCreditMainCoordinator coordinator,
  ) {
    return CrayonPaymentText(
      key: Key('${_identifier}_KYC_Titlee'),
      text: const TextUIDataModel('KYC_Title',
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }

  _getTermsCheckBox(
    BuildContext context,
    KycCreditMainCoordinator coordinator,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30,
          width: 30,
          child: Checkbox(
              value: _isChecked,
              activeColor: Black,
              onChanged: (value) {
                setState(() {
                  _isChecked = value!;
                });
              }),
        ),
        const SizedBox(
          width: 10,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _checkBoxText(context),
            _termsText(context, coordinator),
          ],
        ),

//            _buildContinueButton(context, coordinator, state)
      ],
    );
  }

  Widget _checkBoxText(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_KYC_Validation_With_Main_CheckBox'),
      text: const TextUIDataModel('KYC_Validation_With_Main_CheckBox',
          styleVariant: CrayonPaymentTextStyleVariant.headline4,
          color: Black,
          fontWeight: FontWeight.w500),
    );
  }

  Widget _termsText(
    BuildContext context,
    KycCreditMainCoordinator coordinator,
  ) {
    return InkWell(
      onTap: () {
        coordinator.navigateToTermsCondtionsScreen();
      },
      child: CrayonPaymentText(
        key: Key('${_identifier}_KYC_Terms_and_Condition'),
        text: const TextUIDataModel('KYC_Terms_and_Condition',
            styleVariant: CrayonPaymentTextStyleVariant.headline4,
            color: SU_subtitle_terms_color,
            fontWeight: FontWeight.w500),
      ),
    );
  }

  _subTitleMain(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_KYC_Validation_With_Airtel_Subtitle'),
      text: const TextUIDataModel('KYC_Validation_With_Airtel_Subtitle',
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: Black,
          fontWeight: FontWeight.w400),
    );
  }
}
