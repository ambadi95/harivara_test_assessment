import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:widget_library/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../kyc_credit_module.dart';
import '../state/kyc_credit_state.dart';
import 'package:flutter_svg/svg.dart';
import '../viewmodel/kyc_credit_coordinator.dart';

import 'package:get/get.dart';

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

  bool _isKycCreditLoanEnabled = false;
  bool _isKycPassEnabled = false;
  bool _eligibilityFound = false;

  KycCreditCoordinator? kycCreditCoordinator;

  @override
  Widget build(BuildContext context) =>
      BaseView<KycCreditCoordinator, KycCreditState>(
          setupViewModel: (coordinator) {
            coordinator.initialiseState(context);
            kycCreditCoordinator = coordinator;
            coordinator.callKycCheck(context);
          },
          onStateListenCallback: (preState, newState) =>
              {_listenToStateChanges(context, newState as KycCreditStateReady)},
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
                    ____,
                    _____,
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
      return const CenteredCircularProgressBar(color: PRIMARY_COLOR);

    } else {
      return Container();
    }
  }

  Widget _buildMainUI(
    BuildContext context,
    KycCreditCoordinator coordinator,
    KycCreditStateReady state,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 12),
          ),
         Row(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
           Expanded(
               flex: 1,
               child: Column(
                 children: [
                 Container(
                 width: 1,
                 height: 10,
                 color: Colors.white,
               ),
                 _getCircularIcon(
                   context,
                 ),
                 _getVerticalDivider(
                     context,
                     AppUtils.appUtilsInstance
                         .getPercentageSize(percentage: 41)),
               ],)),
           Expanded(
             flex: 8,
            child: Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
               _getImage(coordinator, context),
               SizedBox(
                 height: AppUtils.appUtilsInstance
                     .getPercentageSize(percentage: 5),
               ),
               (_isKycPassEnabled || _isKycCreditLoanEnabled)
                   ? _kycCreditTitle(context)
                   : _title(context),
               SizedBox(
                 height: AppUtils.appUtilsInstance
                     .getPercentageSize(percentage: 2),
               ),
               _subTitle(context),
           ],),
            ))
         ],),

          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(children: [
                    _getVerticalDivider(
                        context,
                        AppUtils.appUtilsInstance
                            .getPercentageSize(percentage: 13)),
                  ],)),
              Expanded(
                flex: 8,
                child: SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(percentage: 13),
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Column(children: [
                    _getCheckedIcon(
                      context,
                      !_isKycPassEnabled
                          ? Colors.grey
                          : SU_telco_green_checkbox_color,
                    ),
                    _getVerticalDivider(
                        context,
                        AppUtils.appUtilsInstance
                            .getPercentageSize(percentage: 7)),
                    _getCheckedIcon(
                      context,
                      !_isKycCreditLoanEnabled
                          ? Colors.grey
                          : SU_telco_green_checkbox_color,
                    ),
                  ],)),
              Expanded(
                  flex: 8,
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      _kycPassCheckText(context),
                      SizedBox(
                        height: AppUtils.appUtilsInstance
                            .getPercentageSize(percentage: 8),
                      ),
                      _kycLoanCheckText(context),
                    ],),
                  ))
            ],),
          SizedBox(
            height: AppUtils.appUtilsInstance
                .getPercentageSize(percentage: 20),
          ),
          _buildContinueButton(context, coordinator, state)

          // Expanded(
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     children: [
          //       Column(
          //         children: [
          //           _getCircularIcon(
          //             context,
          //           ),
          //           _getVerticalDivider(
          //               context,
          //               AppUtils.appUtilsInstance
          //                   .getPercentageSize(percentage: 57)),
          //           _getCheckedIcon(
          //             context,
          //             !_isKycPassEnabled
          //                 ? Colors.grey
          //                 : SU_telco_green_checkbox_color,
          //           ),
          //           _getVerticalDivider(
          //               context,
          //               AppUtils.appUtilsInstance
          //                   .getPercentageSize(percentage: 8)),
          //           _getCheckedIcon(
          //             context,
          //             !_isKycCreditLoanEnabled
          //                 ? Colors.grey
          //                 : SU_telco_green_checkbox_color,
          //           ),
          //           // const Spacer(
          //           //   flex: 9,
          //           // ),
          //         ],
          //       ),
          //       const SizedBox(
          //         width: 20,
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           _getImage(coordinator, context),
          //           SizedBox(
          //             height: AppUtils.appUtilsInstance
          //                 .getPercentageSize(percentage: 5),
          //           ),
          //           (_isKycPassEnabled || _isKycCreditLoanEnabled)
          //               ? _kycCreditTitle(context)
          //               : _title(context),
          //           SizedBox(
          //             height: AppUtils.appUtilsInstance
          //                 .getPercentageSize(percentage: 2),
          //           ),
          //           _subTitle(context),
          //           SizedBox(
          //             height: AppUtils.appUtilsInstance
          //                 .getPercentageSize(percentage: 17),
          //           ),
          //           _kycPassCheckText(context),
          //           SizedBox(
          //             height: AppUtils.appUtilsInstance
          //                 .getPercentageSize(percentage: 8),
          //           ),
          //           _kycLoanCheckText(context),
          //           const Spacer(
          //             flex: 1,
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),

          //_buildContinueButton(context, coordinator, state)
        ],
      ),
    );
  }

  Widget _getCircularIcon(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: AN_VerticalDivider,
      ),
      margin: EdgeInsets.only(
        top: AppUtils.appUtilsInstance.getPercentageSize(
          percentage: 8,
        ),
      ),
      height: 5,
      width: 5,
    );
  }

  Widget _getCheckedIcon(BuildContext context, Color color) {
    return Icon(
      Icons.check_circle,
      color: color,
      size: AppUtils.appUtilsInstance.getPercentageSize(
        percentage: 5,
      ),
    );
  }

  Widget _getVerticalDivider(BuildContext context, double height) {
    return Container(
      width: 1,
      height: height,
      color: AN_VerticalDivider,
    );
  }

  Widget _getKycValidationFailedUi(
    BuildContext context,
    KycCreditCoordinator coordinator,
    KycCreditState state,
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
            key: Key('${_identifier}_KYC_Verification_Failed'),
            text: const TextUIDataModel('KYC_Verification_Failed',
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
            key: Key('${_identifier}_KYC_Verification_Failed_Title'),
            text: const TextUIDataModel('KYC_Verification_Failed_Title',
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
          CrayonPaymentText(
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
          ),
          _buildGoBackButton(context, coordinator, state),
        ],
      ),
    );
  }

  Widget _getCreditCheckValidationFailedUi(
    BuildContext context,
    KycCreditCoordinator coordinator,
    KycCreditState state,
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
            key: Key('${_identifier}_Credit_Check_Failed'),
            text: const TextUIDataModel('Credit_Check_Failed',
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
            key: Key('${_identifier}_Credit_Check_Failed_Title'),
            text: const TextUIDataModel('Credit_Check_Failed_Title',
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
          CrayonPaymentText(
            key: Key('${_identifier}_Credit_Check_Failed_SubTitle'),
            text: const TextUIDataModel('Credit_Check_Failed_SubTitle',
                styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
                textAlign: TextAlign.center,
                color: AN_SubTitleColor,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(
              percentage: 8,
            ),
          ),
          _buildGoBackButton(context, coordinator, state),
        ],
      ),
    );
  }

  Widget _buildGoBackButton(
    BuildContext context,
    KycCreditCoordinator coordinator,
    KycCreditState state,
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

  Widget _buildContinueButton(
    BuildContext context,
    KycCreditCoordinator coordinator,
    KycCreditStateReady state,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          if (_isKycPassEnabled == true && _isKycCreditLoanEnabled == true) {
            kycCreditCoordinator!.navigateToDeviceOption(
                false, UserType.AgentCustomer);
          }

          //   await coordinator.callKycCheck(context);
          // } else if (!_isKycCreditLoanEnabled) {
          //   await coordinator.callCreditScore(context);
          // }
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: (_isKycPassEnabled == true && _isKycCreditLoanEnabled == true) ?  SU_button_color  :SU_grey_color,
              borderRadius: BorderRadius.circular(2.0)),
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

  Widget _getImage(KycCreditCoordinator coordinator, BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(75.0),
      child: Image(
        image: AssetImage((_isKycPassEnabled || _isKycCreditLoanEnabled)
            ? AN_Kyc_Credit_Check
            : AN_Kyc_Airtel),
        height: 90,
        width: 90,
      ),
    );
  }

  _title(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_KYC_Validation_With_Airtel'),
      text: const TextUIDataModel('KYC_Validation_With_Airtel',
          styleVariant: CrayonPaymentTextStyleVariant.headline3,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600),
    );
  }

  _kycCreditTitle(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}Credit_Score_With_Telco'),
      text: const TextUIDataModel('Credit_Score_With_Telco',
          styleVariant: CrayonPaymentTextStyleVariant.headline3,
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
          fontWeight: FontWeight.w600),
    );
  }

  _kycPassCheckText(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_KYC_Validation_With_Airtel_Pass_Check'),
      text: const TextUIDataModel('KYC_Validation_With_Airtel_Pass_Check',
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: Black,
          fontWeight: FontWeight.w600),
    );
  }

  _subTitle(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.6,
      child: Text('KYC_Validation_With_Airtel_Subtitle'.tr,
            style: const TextStyle(
            color: AN_SubTitleColor,
            fontSize: 12,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400),
      ),
    );
  }

  _listenToStateChanges(BuildContext context, KycCreditStateReady state) async {
    //kyc done
    if (state.isKycError == false && state.error == "Kyc Done") {
      setState(() {
        _isKycPassEnabled = true;
      });
      await kycCreditCoordinator!.callCreditScore(context);

//showing kyc error
    } else if (state.isKycError == true && state.error.isNotEmpty == true) {
      kycCreditCoordinator!.showErrorBottomSheet(
          _getKycValidationFailedUi(context, kycCreditCoordinator!, state),
          context);
      return;
    } else if (state.isCreditCheckError == false &&
        state.error == 'Credit Eligible') {
      setState(() {
        _isKycCreditLoanEnabled = true;
      });
      return;
    } else if (state.isCreditCheckError == true &&
        state.error.isNotEmpty == true) {
      kycCreditCoordinator!.showErrorBottomSheet(
          _getCreditCheckValidationFailedUi(
              context, kycCreditCoordinator!, state),
          context);
    }
  }
}
