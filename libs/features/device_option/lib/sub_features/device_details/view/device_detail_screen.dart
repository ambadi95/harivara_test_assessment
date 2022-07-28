import 'package:config/Colors.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/device_option/device_detail_mockup.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../../../device_option_module.dart';
import '../state/device_detail_state.dart';
import '../viewmodel/device_detail_coordinator.dart';
import 'package:get/get.dart';

class DeviceDetailScreen extends StatelessWidget {
  factory DeviceDetailScreen.forCustomerApp() => const DeviceDetailScreen();
  final String _identifier = 'device-detail-screen';
  static const String viewPath =
      '${DeviceOptionModule.moduleIdentifier}/device-detail-screen';
  const DeviceDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<DeviceDetailCoordinator, DeviceDetailState>(
      setupViewModel: (coordinator) {},
      builder: (context, state, coordinator) {
        return _buildMainUI(context,coordinator);
      },
    );
  }

  Widget _buildMainUI(context,DeviceDetailCoordinator coordinator){
    return CrayonPaymentScaffold(
      appBarAttributes: CrayonPaymentAppBarAttributes(
        key: const Key('CardDetailsScreen_AppBarBackButton'),
        left: [
          const CrayonPaymentAppBarButtonType.back(),
        ],
      ), body: ListView(
      children: [
        _buildTitle(context),
        Image.asset('assets/mobile_1.png',width: 222,height: 300,package: 'shared_data_models',),
        actionButton(),
        dynamicHSpacer(22),
        productDetail(context),
        dynamicHSpacer(22),
        _membershipBenefitTitle(context),
        dynamicHSpacer(20),

        _membershipList(context),
        dynamicHSpacer(22),
        _membershipTermsTitle(context),
        dynamicHSpacer(15),
        _membershipTermButton(context),
        dynamicHSpacer(22),
        selectButton(),
        dynamicHSpacer(22),

      ],
      
    ),
    );
    
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_DD_Title'),
      text: const TextUIDataModel(
          'SamsungGalaxy S21 FE 5G',
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800
      ),
    );
  }

  Widget actionButton() {
    return CrayonPaymentDockedButton(
      key: const Key('SignInButton'),
      title: 'DD_SelectDevice'.tr,
      borderRadius: 8,
      height: CrayonPaymentDimensions.marginFortyEight,
      buttonColor: LS_ButtonColor,
      textColor: White,
      textStyleVariant: CrayonPaymentTextStyleVariant.headline5,
      onPressed: () {
      },
    );
  }

  Widget productDetail(context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CrayonPaymentText(
          key: Key('${_identifier}_DD_Title'),
          text: const TextUIDataModel(
              'DD_product',
              styleVariant: CrayonPaymentTextStyleVariant.headline4,
              color: AN_TitleColor,
              fontWeight: FontWeight.w800
          ),
        ),
        dynamicHSpacer(8),
        dynamicHSpacer(8),
        productSpecLabel(label: 'DD_Brand', value: getMockupData.brand!),
        divider(),
        productSpecLabel(label: 'DD_ModelNumber', value: getMockupData.model!),
        divider(),
        productSpecLabel(label: 'DD_HumanInterfaceInput', value:getMockupData.humanInterfaceInput!),
        divider(),
        productSpecLabel(label: 'DD_WirelessCarrier', value: getMockupData.wirelessCarrier!),
        divider(),
        productSpecLabel(label: 'DD_CellularTechnology', value: getMockupData.cellularTechnology!),
        divider(),
        productSpecLabel(label: 'DD_OperatingSystem', value: getMockupData.os!),
        divider(),
        productSpecLabel(label: 'DD_MemoryStorage', value: getMockupData.storage!),
        divider(),
        productSpecLabel(label: 'DD_WaterResistanceLevel', value: getMockupData.waterResistanceLevel!),
        divider(),
        productSpecLabel(label: 'DD_Color', value: getMockupData.colour!),
        divider(),
        productSpecLabel(label: 'DD_Price', value: getMockupData.price!),
        divider(),
        productSpecLabel(label: 'DD_EMIMonth', value: getMockupData.monthlyPrice!),
        divider(),
        productSpecLabel(label: 'DD_Interest', value: getMockupData.interest!),
        divider(),
        productSpecLabel(label: 'DD_TotalAmountPaid', value: getMockupData.amountToPaid!),
        dynamicHSpacer(8),
      ],
    );
  }

  Widget divider(){
    return Column(
      children: [
        const Divider(),
        dynamicHSpacer(8),
      ],
    );
  }

  Widget productSpecLabel({required String label,required String value}){
    return Table(
      children: [
        TableRow(
          children: [
            CrayonPaymentText(
              key: Key('${_identifier}_'+label),
              text:  TextUIDataModel(
                  label,
                  styleVariant: CrayonPaymentTextStyleVariant.headline4,
                  color: DD_TextLabel,
                  fontWeight: FontWeight.w400
              ),
            ),
            CrayonPaymentText(
              key: Key('${_identifier}_'+value),
              text:  TextUIDataModel(
                  value,
                  styleVariant: CrayonPaymentTextStyleVariant.headline4,
                  color: DD_TextValue,
                  fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
      ],
    );
  }

  _membershipBenefitTitle(context) {
    return  CrayonPaymentText(
      key: Key('Y9 Membership Benefits'),
      text: const TextUIDataModel(
          'Y9 Membership Benefits',
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: DD_TextValue,
          fontWeight: FontWeight.w600
      ),
    );
  }

  _membershipTermsTitle(context) {
    return  CrayonPaymentText(
      key: Key('Membership Terms'),
      text: const TextUIDataModel(
          'Membership Terms',
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: DD_TextValue,
          fontWeight: FontWeight.w600
      ),
    );
  }

  _membershipList(context) {
      return ListView.separated(
        separatorBuilder: (context, index) => SizedBox(),
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) =>
            _buildDeviceCard(context, index, ),
      );

  }

  _buildDeviceCard(BuildContext context, int index) {
    return Padding(
      padding: const EdgeInsets.only(top:5.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 10),
        decoration: BoxDecoration(
            color:  DD_BUTTON_COLOR,
            borderRadius: BorderRadius.circular(2.0)
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.asset(
              "assets/mobile_0.png",
              width: 65,
              height: 45,
              scale: 8.0,
              package: 'shared_data_models',
            ),
            SizedBox(
              width: 5,
            ),
            CrayonPaymentText(
              key: Key(''),
              text: TextUIDataModel("Test",
                  styleVariant:
                  CrayonPaymentTextStyleVariant.overline1,
                  color: AN_CardTitle,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }

  _membershipTermButton(BuildContext context) {
    return Row(children: [
      Expanded(child: _buttonWidget(context, "Joining Fee (one off)", "60,000 TZSHS ")),
       SizedBox(width: 20,),
      Expanded(child: _buttonWidget(context, "Daily Fee", "4,000 TZSHS ")),

    ],);
  }


  Widget _buttonWidget(context,String price,String label){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10  ,vertical: 10),
      decoration: BoxDecoration(
          color:  DD_BUTTON_COLOR,
          borderRadius: BorderRadius.circular(2.0)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(price,style: const TextStyle(fontSize: 12,color: DD_TextValue,fontWeight: FontWeight.w500),),
            dynamicHSpacer(4),
            Text(label,style: const TextStyle(fontSize: 14,color: DD_TextValue,fontWeight: FontWeight.w600),),
          ],
        ),
      ),
    );
  }


  Widget selectButton() {
    return CrayonPaymentDockedButton(
      key: const Key('Select'),
      title: 'Select Device',
      borderRadius: 8,
      height: CrayonPaymentDimensions.marginFortyEight,
      buttonColor: LS_ButtonColor,
      textColor: White,
      textStyleVariant: CrayonPaymentTextStyleVariant.headline5,
      onPressed: () {},
    );
  }

}
