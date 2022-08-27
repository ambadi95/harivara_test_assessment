import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:configuremdm/state/configuremdm_state.dart';
import 'package:configuremdm/viewmodel/configuremdm_coordinator.dart';
import 'package:core/view/base_view.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';
import 'package:downpayment/downpayment_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

class ConfigureMdmScreen extends StatefulWidget {
  static const viewPath =
      '${DownPaymentModule.moduleIdentifier}/configuremdmscreen';

  const ConfigureMdmScreen({Key? key}) : super(key: key);

  @override
  State<ConfigureMdmScreen> createState() => _ConfigureMdmScreenState();
}

class _ConfigureMdmScreenState extends State<ConfigureMdmScreen> {
  final String _identifier = 'configure-mdm-screen';
  bool _isBtnEnabled = false;

  @override
  Widget build(BuildContext context) =>
      BaseView<ConfigureMdmCoordinator, ConfigureMdmState>(
          setupViewModel: (coordinator) async {
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
                    (state as ConfigureMdmStateReady),
                  ),
                ),
              ));

  Widget _buildMainUIWithLoading(
    BuildContext context,
    ConfigureMdmCoordinator coordinator,
    ConfigureMdmStateReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(ConfigureMdmStateReady state) {
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
    ConfigureMdmCoordinator coordinator,
    ConfigureMdmStateReady state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        SizedBox(
          height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 5),
        ),
      ],
    );
  }

  Widget _buildContinueButton(
    BuildContext context,
    ConfigureMdmCoordinator coordinator,
    ConfigureMdmState state,
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
      key: Key('${_identifier}_ConfigureMDM_Title'),
      text: const TextUIDataModel('Configure MDM',
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }

  _title(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_Configure_Title1'),
      text: const TextUIDataModel('',
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: AN_TitleColor,
          fontWeight: FontWeight.w600),
    );
  }

  _subTitle(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_ConfigureMDM_SubTitle'),
      text: const TextUIDataModel('',
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: VO_ResendTextColor,
          fontWeight: FontWeight.w400),
    );
  }
}
