import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/device_option/device_option_mockup.dart';
import 'package:shared_data_models/device_option/device_option_model.dart';
import 'package:shared_data_models/device_option/device_option_args.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/search_bar/search_bar_widget_model.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/widget_library.dart';
import '../device_option_module.dart';
import '../state/device_option_state.dart';
import '../viewmodel/device_option_coordinator.dart';
import 'package:get/get.dart';

class DeviceOption extends StatelessWidget {
  final String _identifier = 'device-option-screen';
  static const String viewPath =
      '${DeviceOptionModule.moduleIdentifier}/device-option-screen';

  final DeviceOptionArgs deviceOptionArgs;

  const DeviceOption({Key? key, required this.deviceOptionArgs})
      : super(key: key);

  factory DeviceOption.forCustomerApp() =>
      DeviceOption(deviceOptionArgs: DeviceOptionArgs(false, ''));

  @override
  Widget build(BuildContext context) {
    return BaseView<DeviceOptionCoordinator, DeviceOptionState>(
      setupViewModel: (coordinator) {
        coordinator.initialiseState(
            deviceOptionArgs.isMember, deviceOptionArgs.destinationPath);
      },
      builder: (context, state, coordinator) {
        return _buildMainUI(context, coordinator);
      },
    );
  }

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
            // dynamicHSpacer(24),
            // _buildSearchField(context),
            dynamicHSpacer(24),
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
      itemCount: deviceMockData.length,
      itemBuilder: (context, index) =>
          _buildDeviceCard(context, deviceMockData[index], index, coordinator),
    );
  }

  Widget _buildDeviceCard(context, DeviceOptionModel device, int index,
      DeviceOptionCoordinator coordinator) {
    return InkWell(
      onTap: () {
       // coordinator.navigateToDeviceDetailScreen();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            device.imagePath!,
            width: 65,
            package: 'shared_data_models',
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
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
                          width : 290,
                          child: Row(
                            mainAxisAlignment : MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: CrayonPaymentText(
                                  key: Key('${_identifier}_' + device.brand!),
                                  text: TextUIDataModel(device.brand!,
                                      styleVariant:
                                          CrayonPaymentTextStyleVariant.overline1,
                                      color: AN_CardTitle,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              deviceOptionArgs.isMember ?
                              Row(
                                children: [
                                  Icon(Icons.check_circle_outline_outlined,
                                    color: Green,
                                    size: 14,
                                  ),
                                  SizedBox(width: 4,),
                                  SizedBox(
                                    child: CrayonPaymentText(
                                      key: Key('${_identifier}_' + 'selected_device'),
                                      text: TextUIDataModel('Selected',
                                          styleVariant:
                                          CrayonPaymentTextStyleVariant.overline1,
                                          color: Green,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ) : SizedBox(),
                            ],
                          ),
                        ),
                        dynamicHSpacer(4),
                        CrayonPaymentText(
                          key: Key('${_identifier}_' + device.model!),
                          text: TextUIDataModel(device.model!,
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
                    key: Key('${_identifier}_' + device.storage!),
                    text: TextUIDataModel(
                      device.storage! + "|" + device.chip! + "|" + device.os!,
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
                dynamicHSpacer(20),
                CrayonPaymentText(
                  key: Key('${_identifier}_pricing_label'),
                  text: const TextUIDataModel(
                    'Pricing option',
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: DD_TextValue,
                  ),
                ),
                dynamicHSpacer(10),
                Row(
                  children: [
                    priceButton(context, 'D0_JoiningFee'.tr, '4,000 TZSHS  '),
                    dynamicWSpacer(18),
                    priceButton(context, 'D0_DailyFee'.tr, '2,000 TZSHS '),
                  ],
                ),
                dynamicHSpacer(20),
                    selectButton(coordinator)
              ],
            ),
          ),
        ],
      ),
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
          ),
        ),
        dynamicHSpacer(7),
        Text(
          label,
          style: const TextStyle(
              fontSize: 14, color: DD_TextLabel, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }

  Widget selectButton(DeviceOptionCoordinator coordinator) {
    return CrayonPaymentDockedButton(
      key: const Key('Select'),
      title: 'View Detail',
      borderRadius: 8,
      height: CrayonPaymentDimensions.marginFortyEight,
      buttonColor: LS_ButtonColor,
      textColor: White,
      textStyleVariant: CrayonPaymentTextStyleVariant.headline4,
      onPressed: () {
        coordinator.navigateToDeviceDetailScreen();
      },
    );
  }

  Widget selectedButton(DeviceOptionCoordinator coordinator) {
    return CrayonPaymentDockedButton(
      key: const Key('Selected'),
      title: 'Selected',
      borderRadius: 8,
      height: CrayonPaymentDimensions.marginFortyEight,
      buttonColor: Colors.white,
      textColor: Green,
      borderColor: Green,
      icon: Icons.check_circle_outline,
      iconColor: Green,
      textStyleVariant: CrayonPaymentTextStyleVariant.headline4,
      onPressed: () {

      },
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(),
    );
  }
}
