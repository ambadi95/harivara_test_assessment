import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:settings/settings_model.dart';
import 'package:settings/view_model/settings_coordinator.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:get/get.dart';
import 'package:widget_library/utils/launcher_utils.dart';
import '../state/settings_state.dart';

class Settings extends StatefulWidget {
  final String _identifier = 'settings';
  static const String viewPath = '${SettingsModule.moduleIdentifier}/settings';

  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) =>
      BaseView<SettingsCoordinator, SettingsState>(
        setupViewModel: (coordinator) async {},
        builder: (context, state, coordinator) => Scaffold(
          body: SafeArea(child: _buildMainUI(context, coordinator, state)),
        ),
      );

  Widget _buildMainUI(BuildContext context, SettingsCoordinator coordinator,
      SettingsState state) {
    return Padding(
      padding: const EdgeInsets.only(top: 23, left: 17, right: 17, bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTitle(context),
          const SizedBox(
            height: 48,
          ),
          _buildDescription(context),
          const SizedBox(
            height: 20,
          ),
          _buildOptionList(coordinator),
          const Spacer(),
          _buildContactText(context)
        ],
      ),
    );
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${widget._identifier}_ST_Title'),
      text: TextUIDataModel('ST_title'.tr,
          styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
          color: AN_TitleColor,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center),
    );
  }

  Widget _buildDescription(context) {
    return CrayonPaymentText(
      key: Key('${widget._identifier}_ST_Description'),
      text: TextUIDataModel('ST_subTitle'.tr,
          styleVariant: CrayonPaymentTextStyleVariant.bodyText2,
          color: AN_TitleColor,
          fontWeight: FontWeight.w800),
    );
  }

  Widget _buildContactText(context) {
    return InkWell(
      onTap: () {
        LauncherUtils.launcherUtilsInstance
            .makePhoneCall(phoneNumber: LauncherUtils.CONTACT_NUMBER);
      },
      child: Center(
        child: CrayonPaymentText(
          key: Key('${widget._identifier}_ST_contact'),
          text: TextUIDataModel('ST_contact_text'.tr,
              styleVariant: CrayonPaymentTextStyleVariant.headline5,
              color: VO_ResendTextColor,
              fontWeight: FontWeight.w100,
              textAlign: TextAlign.center),
        ),
      ),
    );
  }

  Widget _buildOptionList(SettingsCoordinator coordinator) {
    return Column(
      children: [
        _buildOptions(context, 'ST_view_profile', ST_view_profile, () async {
          await coordinator.navigateToUpdateProfile();
        }),
        // _buildOptions(context, 'ST_update_passcode', ST_update_passcode,
        //     () async {
        //   await coordinator.resetPasscode();
        // }),
        _buildOptions(context, 'ST_App_Language', ST_language, () async {
          await coordinator.changeLanguage();
        }),
        const SizedBox(
          height: 30,
        ),
        _buildOptions(context, 'ST_sign_out', ST_sign_out, () async {
          await coordinator.signOut();
        }),
      ],
    );
  }

  Widget _buildOptions(context, String label, String image, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, top: 20),
        child: Row(
          children: [
            Image.asset(
              image,
              width: 28,
              height: 28,
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: CrayonPaymentText(
                key: Key('${widget._identifier}_ST_Description'),
                text: TextUIDataModel(label.tr,
                    styleVariant: CrayonPaymentTextStyleVariant.bodyText2,
                    color: AN_TitleColor,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
