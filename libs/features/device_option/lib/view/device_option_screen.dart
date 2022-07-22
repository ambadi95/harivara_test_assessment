import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/device_option/device_option_mockup.dart';
import 'package:shared_data_models/device_option/device_option_model.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/search_bar/search_bar_widget_model.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/widget_library.dart';
import '../device_option_module.dart';
import '../state/device_option_state.dart';
import '../viewmodel/device_option_coordinator.dart';


class DeviceOption extends StatelessWidget {
  factory DeviceOption.forCustomerApp() => const DeviceOption();
  final String _identifier = 'device-option-screen';
  static const String viewPath =
      '${DeviceOptionModule.moduleIdentifier}/device-option-screen';

  const DeviceOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DeviceOptionCoordinator, DeviceOptionState>(
      setupViewModel: (coordinator) {},
      builder: (context, state, coordinator) {
        return _buildMainUI(context,coordinator);
      },
    );
  }

  Widget _buildMainUI(context,DeviceOptionCoordinator coordinator) {
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
            dynamicHSpacer(24),
            _buildSearchField(context),
            dynamicHSpacer(24),
            Expanded(child: _buildDeviceList(context,coordinator)),
            dynamicHSpacer(16),
          ],
        ));
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_DO_Title'),
      text: const TextUIDataModel(
        'DO_Title',
        styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
        color: AN_TitleColor,
        fontWeight: FontWeight.w800
      ),
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
              ),),
          dataModel: const SearchBarDataModel(
              hint: 'DO_Search',
              variant: CrayonPaymentTextStyleVariant.headline5)),
    );
  }

  Widget _buildDeviceList(context,DeviceOptionCoordinator coordinator) {
    return ListView.separated(
      separatorBuilder: (context, index)=> divider(),
      shrinkWrap: true,
      itemCount: deviceMockData.length,
      itemBuilder: (context, index) => _buildDeviceCard(context,deviceMockData[index],index,coordinator),
    );
  }

  Widget _buildDeviceCard(context, DeviceOptionModel device, int index,DeviceOptionCoordinator coordinator){
    return InkWell(
      onTap: (){
        coordinator.navigateToDeviceDetailScreen();
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(device.imagePath!,width: 95,package: 'shared_data_models',),
          dynamicWSpacer(8),
          Column(
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
                      CrayonPaymentText(
                        key: Key('${_identifier}_'+device.brand!),
                        text: TextUIDataModel(
                          device.brand!,
                          styleVariant: CrayonPaymentTextStyleVariant.overline1,
                          color: AN_CardTitle,
                            fontWeight: FontWeight.bold

                        ),
                      ),
                      dynamicHSpacer(4),
                      CrayonPaymentText(
                        key: Key('${_identifier}_'+device.model!),
                        text: TextUIDataModel(
                            device.model!,
                            styleVariant: CrayonPaymentTextStyleVariant.headline4,
                            color: AN_CardTitle,
                            fontWeight: FontWeight.w900

                        ),
                      ),
                    ],
                  ),
                  dynamicWSpacer(54),
                  Image.asset(index.isOdd ? DO_selectFavorites : DO_favorites,width: 16,height: 16,)
                ],
              ),

              dynamicHSpacer(6),
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: CrayonPaymentText(
                  key: Key('${_identifier}_'+device.storage!),
                  text: TextUIDataModel(
                    device.storage! + "|" + device.chip! + "|" + device.os!,
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: SU_carrier_message_color,
                  ),
                ),
              ),
              dynamicHSpacer(6),
              CrayonPaymentText(
                key: Key('${_identifier}_color_label'),
                text: const TextUIDataModel(
                  'Colour option - Alpine Green',
                  styleVariant: CrayonPaymentTextStyleVariant.headline4,
                  color: AN_CardSubTitle,
                ),
              ),
              dynamicHSpacer(6),
              Row(
                children: [
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                      color: Colors.red,
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.red)
                    ),
                  ),
                  dynamicWSpacer(6),
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.deepPurpleAccent)
                    ),
                  ),
                  dynamicWSpacer(6),
                  Container(
                    height: 16,
                    width: 16,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.black)
                    ),
                  ),
                ],
              ),
              dynamicHSpacer(10),
              CrayonPaymentText(
                key: Key('${_identifier}_pricing_label'),
                text: const TextUIDataModel(
                  'Pricing option',
                  styleVariant: CrayonPaymentTextStyleVariant.headline4,
                  color: AN_CardSubTitle,
                ),
              ),
              dynamicHSpacer(4),
              Row(

                children: [
                  priceButton(context,'TZS 94,666/mo.','Y9 loan 12 months '),
                  dynamicWSpacer(18),
                  priceButton(context,'TZS 2,300,000','Full Retail Price'),

                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget priceButton(context,String price,String label){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 10),
      decoration: BoxDecoration(
          color:  AN_CardActionBG1,
          borderRadius: BorderRadius.circular(2.0)
      ),
      child: Column(
        children: [
          Text(price,style: const TextStyle(fontSize: 12,color: AN_ActionText,fontWeight: FontWeight.w600),),
          dynamicHSpacer(4),
          Text(label,style: const TextStyle(fontSize: 10,color: AN_ActionText,fontWeight: FontWeight.w600),),
        ],
      ),
    );
  }

  Widget divider(){
    return const Padding(
      padding:  EdgeInsets.symmetric(vertical: 16),
      child:  Divider(),
    );
  }
}
