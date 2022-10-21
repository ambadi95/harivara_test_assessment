import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:referral_program/view/referral_program_status_screen.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/formatter/nida_input_formatter.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/input_fields/input_number_field_with_label.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../referral_program_module.dart';
import '../state/referral_program_state.dart';
import '../viewmodel/referral_program_coordinator.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ReferralProgram extends StatelessWidget {
  static const String viewPath =
      '${ReferralProgramModule.moduleIdentifier}/referral-program-screen';

  const ReferralProgram({Key? key}) : super(key: key);

  final String _identifier = 'referral-program-screen';

  @override
  Widget build(BuildContext context) {
    return BaseView<ReferralProgramCoordinator, ReferralProgramState>(

      setupViewModel: (coordinator) async {},
      builder: (context, state, coordinator) {
        return Stack(
          children: [_buildMainUI(context, state, coordinator),
            state.isLoading == true ? _createLoading() : SizedBox()
          ],
        );
      },
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

  _buildMainUI(BuildContext context, ReferralProgramState state,
      ReferralProgramCoordinator coordinator) {
    return CrayonPaymentScaffold(
      appBarAttributes: CrayonPaymentAppBarAttributes(
        key: const Key('CardDetailsScreen_AppBarBackButton'),
        left: [
          const CrayonPaymentAppBarButtonType.back(),
        ],
      ),
      bottomNavigationBar: state.selectedTab == 0
          ? _buildContinueButton(context, coordinator)
          : SizedBox(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            SizedBox(
              height: 18,
            ),
            _buildTabBar(context, state, coordinator),
            _buildTabView(context, coordinator, state)
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton(
    BuildContext context,
    ReferralProgramCoordinator coordinator,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          if (coordinator.isMobileNumberValid(coordinator.mobileNumber.text) &&
              coordinator.isValidName(coordinator.name.text)) {

            if(coordinator.emailId.text.isNotEmpty){
              if(coordinator.isValidEmail(coordinator.emailId.text)){
                coordinator.callInviteFriends();
              }
            }else{
              coordinator.callInviteFriends();

            }


          }
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: SU_button_color, borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'REF_Invite_Friends'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_RP_Title'),
      text: const TextUIDataModel(
        'RP_Title',
        styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
        fontWeight: FontWeight.bold,
        color: AN_TitleColor,
      ),
    );
  }

  Widget _buildTabBar(BuildContext context, ReferralProgramState state,
      ReferralProgramCoordinator coordinator) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 29, left: 9, right: 9),
          child: Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        DefaultTabController(
            length: 2,
            child: TabBar(
              labelColor: Colors.red,
              unselectedLabelColor: Colors.black,
              indicatorColor: Colors.red,
              indicatorWeight: 4,
              labelPadding: EdgeInsets.only(bottom: 13),
              padding: EdgeInsets.only(left: 10, right: 10),
              labelStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold),
              onTap: (index) {
                coordinator.tabSelected(index);
              },
              tabs: [Text('RP_invite'.tr), Text('RP_status'.tr)],
            )),
      ],
    );
  }

  _buildTabView(BuildContext context, ReferralProgramCoordinator coordinator,
      ReferralProgramState state) {
    return Container(
      child: state.selectedTab == 0
          ? _widgetReferralInviteScreen(context, coordinator, state)
          : ReferralProgramStatusScreen(),
    );
  }

  _widgetReferralInviteScreen(
    BuildContext context,
    ReferralProgramCoordinator coordinator,
    ReferralProgramState state,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 18,
        ),
        Image.asset(Referral_icon),
        SizedBox(
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.only(left:30.0),
          child: CrayonPaymentText(
            key: Key('${_identifier}_REFER_Title'),
            text: TextUIDataModel(
              'HS_InviteYourFriends_GetBonus'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline18,
              fontWeight: FontWeight.bold,
              color: AN_TitleColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: CrayonPaymentText(
            key: Key('${_identifier}_REFER_Title'),
            text: TextUIDataModel(
              'Bonus_Points'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline18,
              fontWeight: FontWeight.bold,
              color: AN_TitleColor,
            ),
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Center(child: _subTitleWidget()),
        SizedBox(
          height: 25,
        ),
        _buildLabelTextFieldMobNumber(context, 'LS_Mobile'.tr, coordinator,state),
        SizedBox(
          height: 18,
        ),
        _buildLabelTextField(
            'name',
            'DV_name_label'.tr,
            coordinator.name,
            TextInputType.text,
            coordinator,
            state.nameError,
            'DV_name_hint_text',
            true,
            inputFormatter: [
              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]')),
              FilteringTextInputFormatter.deny(RegExp('[0-9]')),
            ]),
        SizedBox(
          height: 18,
        ),
        _buildLabelTextField(
            'email',
            'Email_Id_Optional'.tr,
            coordinator.emailId,
            TextInputType.emailAddress,
            coordinator,
            state.emailError,
            'DV_email_hint_text',
            true),
        SizedBox(
          height: 18,
        ),
      ],
    );
  }

  Widget _buildLabelTextField(
    String tag,
    String label,
    TextEditingController controller,
    TextInputType textInputType,
    ReferralProgramCoordinator coordinator,
    String errorText,
    String hint,
    bool enabled, {
    List<TextInputFormatter>? inputFormatter,
  }) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          _checkValid(
            tag,
            coordinator,
          );
        },
        canRequestFocus: true,
        child: InputFieldWithLabel(
          label: label,
          controller: controller,
          errorText: errorText.tr,
          enabled: enabled,
          hintText: hint.tr,
          key: const Key('detailsTextField'),
          keyboardType: textInputType,
          inputFormatters: inputFormatter ?? [],
          onChanged: (value) {
            if (errorText.isNotEmpty) {
              coordinator.isValidName(coordinator.name.text);
            }
          },
        ),
      ),
    );
  }

  void _checkValid(String label, ReferralProgramCoordinator coordinator) {
    print(label);
    switch (label) {
      case 'name':
        if (coordinator.name.text.trim().toString().isNotEmpty == true) {
          coordinator.isValidName(coordinator.name.text);
        }
        break;

      case 'email':
        if (coordinator.emailId.text.trim().toString().isNotEmpty == true) {
          coordinator.isValidEmail(coordinator.emailId.text);
        }
        break;
    }
  }

  Widget _buildLabelTextFieldMobNumber(BuildContext context, String label,
      ReferralProgramCoordinator coordinator, ReferralProgramState state) {
    return InputNumberFieldWithLabel(
      label: label,
      controller: coordinator.mobileNumber,
      errorText: state.mobileNumberError.tr,
      hintText: 'LS_mobile_hint_text'.tr,
      key: const Key('mobileNumberTextField'),
      inputFormatters: <TextInputFormatter>[
        NIDAInputFormatter(mask: 'xxx xxx xxx', separator: ' ')
      ],
      keyboardType: TextInputType.number,
      onChanged: (value) {
        if (coordinator.mobileNumberError.isNotEmpty ||
            coordinator.mobileNumber.text.length > 11) {
          coordinator.isMobileNumberValid(coordinator.mobileNumber.text);
        }
      },
    );
  }

 Widget _subTitleWidget() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CrayonPaymentText(
            key: Key('${_identifier}_REFER_SUB_Title'),
            text: TextUIDataModel(
              'Share_Code_Below'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline5,
              color: AN_TextFieldLeadingIcon,
            ),
          ),Center(
            child: CrayonPaymentText(
              key: Key('${_identifier}_REFER_SUB_Title_2'),
              text: TextUIDataModel(
                'OnBoard_Y9'.tr,
                styleVariant: CrayonPaymentTextStyleVariant.headline5,
                color: AN_TextFieldLeadingIcon,
              ),
            ),
          ),
        ],
      ),
    );
  }


}