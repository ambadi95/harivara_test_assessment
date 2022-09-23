import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Styles.dart';
import 'package:configuremdm/configuremdm_module.dart';
import 'package:configuremdm/state/configuremdm_state.dart';
import 'package:configuremdm/viewmodel/configuremdm_coordinator.dart';
import 'package:core/view/base_view.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import '../configuremdm_argument.dart';

class ConfigureMdmScreen extends StatefulWidget {
  static const viewPath =
      '${ConfigureMdmModule.moduleIdentifier}/configuremdmscreen';
  final ConfigureMdmArgs configureMdmArgs;


  const ConfigureMdmScreen({Key? key, required this.configureMdmArgs}) : super(key: key);

  @override
  State<ConfigureMdmScreen> createState() => _ConfigureMdmScreenState();
}

class _ConfigureMdmScreenState extends State<ConfigureMdmScreen> {
  final String _identifier = 'configure-mdm-screen';
  bool _isChecked = false;
  final TextEditingController imeiNumber = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BaseView<ConfigureMdmCoordinator, ConfigureMdmState>(
          setupViewModel: (coordinator) async {
            coordinator.initialiseState(context);
            imeiNumber.text=  widget.configureMdmArgs.imei1;//"351389781756236";

          },
          builder: (context, state, coordinator) => CrayonPaymentScaffold(
                appBarAttributes: CrayonPaymentAppBarAttributes(
                  key: const Key('CardDetailsScreen_AppBarBackButton'),
                  // left: [
                  //   const CrayonPaymentAppBarButtonType.back(),
                  // ],
                ),
                bottomNavigationBar:
                Container(
                  height: MediaQuery.of(context).size.height * 0.32,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        _getTermsCheckBox(context, coordinator),
                        const SizedBox(
                          height: 30,
                        ),
                        _buildContinueButton(context, coordinator, state),              ],
                    )),
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
      return const CenteredCircularProgressBar(
          color: config_colors.PRIMARY_COLOR);
    } else {
      return Container();
    }
  }

  Widget _buildMainUI(
    BuildContext context,
    ConfigureMdmCoordinator coordinator,
    ConfigureMdmStateReady state,
  ) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 5),
          ),
          _subTitle(context),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 10),
          ),
          _buildLabelTextField(
              'imeinumber',
              'MDM_input_label'.tr,
              imeiNumber,
              TextInputType.number,
              coordinator,
              '',
              'MDM_input_hint_text',
              false),
          SizedBox(
            height: AppUtils.appUtilsInstance.getPercentageSize(percentage: 40),
          ),

        ],
      ),
    );
  }

  _getTermsCheckBox(
      BuildContext context,
      ConfigureMdmCoordinator coordinator,
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
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
            ],
          ), ],
      ),
    );
  }

  Widget _checkBoxText(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_MDM_agree_text'),
      text: const TextUIDataModel('MDM_agree_text',
          styleVariant: CrayonPaymentTextStyleVariant.headline4,
          color: Black,
          fontWeight: FontWeight.w500),
    );
  }
  Widget _buildLabelTextField(
      String tag,
      String label,
      TextEditingController controller,
      TextInputType textInputType,
      ConfigureMdmCoordinator coordinator,
      String errorText,
      String hint,
      bool enabled) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {},
        canRequestFocus: true,
        child: Padding(
            padding: const EdgeInsets.only(bottom: 34),
            child: InputFieldWithLabel(
              label: label,
              controller: controller,
              errorText: errorText.tr,
              enabled: enabled,
              hintText: hint.tr,
              key: const Key('detailsTextField'),
              keyboardType: textInputType,
              onChanged: (value) {},
            )),
      ),
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
        onTap: () async {
          if(_isChecked){
            //coordinator.callMdmRegistration(context,imeiNumber.text.toString());
            coordinator.callMdmRegistration(context, widget.configureMdmArgs.imei1);
          }
          // coordinator.configureMdmSuccessFulScreen();}
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: _isChecked == true ? SU_button_color : SU_grey_color,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'MDM_button_text'.tr,
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
      text:  TextUIDataModel('MDM_title'.tr,
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }
  _subTitle(BuildContext context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_ConfigureMDM_SubTitle'),
      text: const TextUIDataModel('MDM_subheading',
          styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
          color: VO_ResendTextColor,
          fontWeight: FontWeight.w400),
    );
  }
}
