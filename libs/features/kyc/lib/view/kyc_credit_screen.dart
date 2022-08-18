import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:passcode/passcode_module.dart';
import 'package:shared_data_models/kyc/kyc_screen_args.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/icon_utils.dart';

import '../state/kyc_credit_state.dart';
import '../viewmodel/kyc_credit_coordinator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class KycCreditScreen extends StatefulWidget {
  static const viewPath = '${PasscodeModule.moduleIdentifier}/kycscreen';
  final KycScreenArgs kycScreenArgs;

  const KycCreditScreen({Key? key, required this.kycScreenArgs})
      : super(key: key);

  @override
  State<KycCreditScreen> createState() => _KycCreditScreenState();
}

class _KycCreditScreenState extends State<KycCreditScreen> {
  final String _identifier = 'kyc_credit-screen';
  bool _isBtnEnabled = false;

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
    return  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
             SizedBox(height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 10),),
            // _image(context)

             FlutterLogo(),
            SizedBox(height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 5),),

            _title(context),
            SizedBox(height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 5),),
            _subTitle(context),


            Spacer(),
            _buildContinueButton(context, coordinator, state)

          ],
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

        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: _isBtnEnabled
                  ? SU_button_color
                  : SU_grey_color,
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
      key: Key('${_identifier}_KYC_Title'),
      text: const TextUIDataModel('KYC_Title',
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }


  Widget _image(BuildContext context) {
    return getSvg(widget.kycScreenArgs.image,height: 100,width: 100,);

  }

  _title(BuildContext context) {
   return CrayonPaymentText(
      key: Key('${_identifier}_KYC_Validation_With_Airtel'),
      text: const TextUIDataModel('KYC_Validation_With_Airtel',
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600),
    );
  }

  _subTitle(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_KYC_Validation_With_Airtel'),
      text: const TextUIDataModel('KYC_Validation_With_Airtel',
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600),
    );
  }




}
