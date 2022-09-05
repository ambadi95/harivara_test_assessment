import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/customer_onboard/membership/response/device_list_response/datum.dart';
import 'package:shared_data_models/device_option/device_option_mockup.dart';
import 'package:shared_data_models/device_option/device_option_model.dart';
import 'package:shared_data_models/device_option/device_option_args.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/image/svg_image.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/search_bar/search_bar_widget_model.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/icon_utils.dart';
import 'package:widget_library/widget_library.dart';
import '../device_option_module.dart';
import '../state/device_option_state.dart';
import '../viewmodel/device_option_coordinator.dart';
import 'package:get/get.dart';
import 'package:widget_library/utils/app_utils.dart';

class DeviceOption extends StatefulWidget {
  static const String viewPath =
      '${DeviceOptionModule.moduleIdentifier}/device-option-screen';

  final DeviceOptionArgs deviceOptionArgs;

  DeviceOption({Key? key, required this.deviceOptionArgs}) : super(key: key);

  // factory DeviceOption.forCustomerApp() =>
  //     DeviceOption(deviceOptionArgs: DeviceOptionArgs(false, '',UserType.AgentCustomer));

  @override
  State<DeviceOption> createState() => _DeviceOptionState();
}

class _DeviceOptionState extends State<DeviceOption> {
  final String _identifier = 'device-option-screen';

  List<Datum> deviceList = [];

  @override
  Widget build(BuildContext context) {
    return BaseView<DeviceOptionCoordinator, DeviceOptionState>(
      setupViewModel: (coordinator) async {
        deviceList = await coordinator.fetchDeviceList(
            widget.deviceOptionArgs.isMember,
            widget.deviceOptionArgs.destinationPath);
        setState(() {});
        coordinator.initialiseState(widget.deviceOptionArgs.isMember,
            widget.deviceOptionArgs.destinationPath);
      },
      // onStateListenCallback: (preState, newState) =>
      // {_listenToStateChanges(context, newState)},
      builder: (context, state, coordinator) {
        return deviceList.isNotEmpty
            ? _buildMainUI(context, coordinator)
            : _buildMainUIWithLoading(context, coordinator);
      },
    );
  }

  Widget _buildMainUIWithLoading(
    BuildContext context,
    DeviceOptionCoordinator coordinator,
  ) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMainUI(context, coordinator),
          _createLoading(),
        ],
      ),
    );
  }

  Widget _createLoading() {
    return Center(
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: const CenteredCircularProgressBar(color: PRIMARY_COLOR),
      ),
    );
  }

  // void _listenToStateChanges(BuildContext context, DeviceOptionState state) {
  Widget _buildMainUI(context, DeviceOptionCoordinator coordinator) {
    return CrayonPaymentScaffold(
        appBarAttributes: CrayonPaymentAppBarAttributes(
          key: const Key('CardDetailsScreen_AppBarBackButton'),
          left: [
            const CrayonPaymentAppBarButtonType.back(),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            dynamicHSpacer(28),
            _creditScoreInfo(),
            dynamicHSpacer(20),
            // _buildSearchField(context),
            Expanded(child: _buildDeviceList(context, coordinator)),
            dynamicHSpacer(16),
          ],
        ));
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_DO_Title'),
      text: const TextUIDataModel('DO_Title',
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }

  Widget _creditScoreInfo() {
    return widget.deviceOptionArgs.userType == UserType.AgentCustomer
        ? Container(
            width: double.infinity,
            height: 102,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: MO_credit_info_bg),
            child: Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Image.asset(
                      MO_credit_info_icon,
                      height: 54,
                      width: 54,
                    )
                    // getSvg(MO_credit_info_icon,
                    // width: 54, height: 54,
                    // ),
                    ),
                Padding(
                  padding: const EdgeInsets.only(top: 17, left: 11),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CrayonPaymentText(
                        key: Key('${_identifier}_DO_CREDIT_SCORE'),
                        text: TextUIDataModel('DO_credit_score'.tr,
                            styleVariant:
                                CrayonPaymentTextStyleVariant.headline5,
                            color: AN_TitleColor,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      CrayonPaymentText(
                        key: Key('${_identifier}_DO_CREDIT_SCORE_DESC'),
                        text: TextUIDataModel('DO_credit_score_desc'.tr,
                            styleVariant:
                                CrayonPaymentTextStyleVariant.headline5,
                            color: AN_TitleColor,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        : SizedBox();
  }

  Widget _buildSearchField(context) {
    return SearchBarWidget(
      attributes: SearchBarAttributes(
          appearance: SearchBarAppearance(
            cornerRadius: 20,
            backgroundColor: AN_TextFieldBackground,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                AN_Search,
                width: 16,
                height: 16,
              ),
            ),
          ),
          dataModel: const SearchBarDataModel(
              hint: 'DO_Search',
              variant: CrayonPaymentTextStyleVariant.headline5)),
    );
  }

  Widget _buildDeviceList(context, DeviceOptionCoordinator coordinator) {
    return ListView.separated(
      separatorBuilder: (context, index) => divider(),
      shrinkWrap: true,
      itemCount: deviceList.length,
      itemBuilder: (context, index) =>
          _buildDeviceCard(context, deviceList[index], index, coordinator),
    );
  }

  Widget _buildDeviceCard(
      context, Datum device, int index, DeviceOptionCoordinator coordinator) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                deviceList[index].deviceId == 1
                    ? 'assets/a13.png'
                    : 'assets/a03.png',
                width: 80,
                package: 'shared_data_models',
              ),
            ),
            SizedBox(
              width: 11,
            ),
            Expanded(
              flex:3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: AppUtils.appUtilsInstance.getPercentageSize(
                                    percentage: 100, ofWidth: true) /
                                1.5,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: CrayonPaymentText(
                                    key: Key('${_identifier}_' + device.brand!),
                                    text: TextUIDataModel(
                                        'Option ' + (index + 1).toString(),
                                        styleVariant:
                                            CrayonPaymentTextStyleVariant
                                                .overline1,
                                        color: AN_CardTitle,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                deviceList[index].isSelected!
                                    ? Row(
                                        children: [
                                          Icon(
                                            Icons.check_circle_outline_outlined,
                                            color: Green,
                                            size: 14,
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          SizedBox(
                                            child: CrayonPaymentText(
                                              key: Key('${_identifier}_' +
                                                  'selected_device'),
                                              text: TextUIDataModel('Selected',
                                                  styleVariant:
                                                      CrayonPaymentTextStyleVariant
                                                          .overline1,
                                                  color: Green,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          ),
                          dynamicHSpacer(4),
                          CrayonPaymentText(
                            key: Key('${_identifier}_' + device.brand!),
                            text: TextUIDataModel(
                                device.brand! + ' ' + device.modelNumber!,
                                styleVariant:
                                    CrayonPaymentTextStyleVariant.headline4,
                                color: AN_CardTitle,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ],
                  ),
                  dynamicHSpacer(6),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .6,
                    child: CrayonPaymentText(
                      key: Key('${_identifier}_' + device.memory!),
                      text: TextUIDataModel(
                        device.memory! +
                            "|" +
                            device.processor! +
                            "|" +
                            device.operatingSystem!,
                        styleVariant: CrayonPaymentTextStyleVariant.overline1,
                        color: SU_carrier_message_color,
                      ),
                    ),
                  ),
                  // dynamicHSpacer(6),
                  // CrayonPaymentText(
                  //   key: Key('${_identifier}_color_label'),
                  //   text: const TextUIDataModel(
                  //     'Colour option - Alpine Green',
                  //     styleVariant: CrayonPaymentTextStyleVariant.headline4,
                  //     color: AN_CardSubTitle,
                  //   ),
                  // ),
                  // dynamicHSpacer(6),
                  // Row(
                  //   children: [
                  //     Container(
                  //       height: 16,
                  //       width: 16,
                  //       decoration: BoxDecoration(
                  //         color: Colors.red,
                  //           shape: BoxShape.circle,
                  //           border: Border.all(width: 1, color: Colors.red)
                  //       ),
                  //     ),
                  //     dynamicWSpacer(6),
                  //     Container(
                  //       height: 16,
                  //       width: 16,
                  //       decoration: BoxDecoration(
                  //           color: Colors.deepPurpleAccent,
                  //           shape: BoxShape.circle,
                  //           border: Border.all(width: 1, color: Colors.deepPurpleAccent)
                  //       ),
                  //     ),
                  //     dynamicWSpacer(6),
                  //     Container(
                  //       height: 16,
                  //       width: 16,
                  //       decoration: BoxDecoration(
                  //           color: Colors.black,
                  //           shape: BoxShape.circle,
                  //           border: Border.all(width: 1, color: Colors.black)
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  dynamicHSpacer(7),
                  CrayonPaymentText(
                    key: Key('${_identifier}_pricing_label'),
                    text: const TextUIDataModel(
                      'DO_Pricing_option',
                      styleVariant: CrayonPaymentTextStyleVariant.headline5,
                      color: DD_TextValue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  dynamicHSpacer(6),
                  Row(
                    children: [
                      priceButton(context, 'D0_JoiningFee'.tr,
                          deviceList[index].joiningFees.toString()),
                      dynamicWSpacer(18),
                      priceButton(context, 'D0_DailyFee'.tr,
                          deviceList[index].dailyFees.toString()),
                    ],
                  ),
                  dynamicHSpacer(20),

                ],
              ),
            ),
          ],
        ),

        selectButton(coordinator, deviceList[index].deviceId!)
      ],
    );
  }

  Widget priceButton(context, String price, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          price,
          style: const TextStyle(
            fontSize: 12,
            color: DD_TextLabel,
            fontFamily: 'Montserrat',
          ),
        ),

        dynamicHSpacer(1),
        RichText(
          text: TextSpan(
            text:  label,
            style: const TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 14, color: DD_TextLabel, fontWeight: FontWeight.w600
            ),
            children: <TextSpan>[
              TextSpan(
                  text: '  TZSHS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 9)),

            ],
          ),
        ),
      ],
    );
  }

  Widget selectButton(DeviceOptionCoordinator coordinator, int id) {
    return CrayonPaymentDockedButton(
      key: const Key('Select'),
      title: 'D0_ViewDetails'.tr,
      borderRadius: 5,
      height: CrayonPaymentDimensions.marginFortyEight,
      buttonColor: LS_ButtonColor,
      textColor: White,
      textStyleVariant: CrayonPaymentTextStyleVariant.headline4,
      onPressed: () {
        coordinator.navigateToDeviceDetailScreen(
            id, widget.deviceOptionArgs.userType);
      },
    );
  }

  Widget selectedButton(DeviceOptionCoordinator coordinator) {
    return CrayonPaymentDockedButton(
      key: const Key('Selected'),
      title: 'DO_Selected',
      borderRadius: 8,
      height: CrayonPaymentDimensions.marginFortyEight,
      buttonColor: Colors.white,
      textColor: Green,
      borderColor: Green,
      icon: Icons.check_circle_outline,
      iconColor: Green,
      textStyleVariant: CrayonPaymentTextStyleVariant.headline4,
      onPressed: () {},
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(),
    );
  }
}
