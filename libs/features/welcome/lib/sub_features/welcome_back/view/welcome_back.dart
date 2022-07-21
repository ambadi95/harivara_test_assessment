import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:config/Colors.dart' as config_color;
import 'package:core/validators/input_entry_validator/input_entry_validator.dart';
import 'package:flutter/material.dart';
import 'package:passcode/sub_features/passcode/view/passcode.dart';
import 'package:shared_data_models/passcode/passcode_screen_args.dart';
import 'package:welcome/sub_features/welcome/data_model/welcome_model.dart';
import 'package:core/view/base_view.dart';
import 'package:get/get.dart';

import '../../../welcome_module.dart';
import '../../welcome/state/welcome_screen_state.dart';
import '../../welcome/viewmodel/welcome_coordinatior.dart';

class CrayonWelcomBackScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/welcomeback';
  final WelcomeScreenArgs welcomeScreenArgs;

  const CrayonWelcomBackScreen({
    Key? key,
    required this.welcomeScreenArgs,
  }) : super(key: key);

  @override
  State<CrayonWelcomBackScreen> createState() => _CrayonWelcomBackScreenState();

  factory CrayonWelcomBackScreen.forCustomerBackApp() => CrayonWelcomBackScreen(
        welcomeScreenArgs: WelcomeScreenArgs(
          '',
          '',
          'Customer',
        ),
      );
}

class _CrayonWelcomBackScreenState extends State<CrayonWelcomBackScreen> {
  @override
  Widget build(BuildContext context) =>
      BaseView<WelcomeCoordinator, WelcomeScreenState>(
        setupViewModel: (coordinator) async {},
        builder: (context, state, welcomeCoordinator) => Scaffold(
          body: _buildMainUIWithLoading(context, welcomeCoordinator, state),
        ),
      );

  Widget _buildMainUIWithLoading(context, WelcomeCoordinator welcomeCoordinator,
      WelcomeScreenState state) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildMainUI(context, welcomeCoordinator, state),
          ],
        ),
      ),
    );
  }

  Widget _buildMainUI(BuildContext context,
      WelcomeCoordinator welcomeCoordinator, WelcomeScreenState state) {
    return _buidlWelcomeBackUI(context, state, welcomeCoordinator);
  }

  Widget _buidlWelcomeBackUI(BuildContext context, WelcomeScreenState state,
      WelcomeCoordinator welcomeCoordinator) {
    return Stack(
      children: [
        // _createBackgroundImage(),
        // _createOverLay(),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 14,
            bottom: 10,
            top: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildLanguageChangeButton(context, state, welcomeCoordinator),
              const SizedBox(height: 40),
              _buildLogo(context),
              _buildSizedBox(),
              _buildTitle(context),
              _buildSizedBox(),
              _userImage(),
              const SizedBox(height: 10),
              _userInfo(context),const SizedBox(height: 30),
              _enterPassCodeTitle(context),const SizedBox(height: 10),
              Image.asset(
                "assets/welcomeback/orIcon.png",
              ),const SizedBox(height: 10),

              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSizedBox() {
    return const SizedBox(height: 32);
  }

  _userImage() {
    return Container(
      height: 40,
      width: 40,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      child: Image.network('https://picsum.photos/id/237/50/50'),
    );
  }

  Widget _buildLanguageChangeButton(BuildContext context,
      WelcomeScreenState state, WelcomeCoordinator welcomeCoordinator) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
          onPressed: () {
            var languageCode = '';
            if (state.currentLanguageCode == 'en') {
              languageCode = 'sw';
            } else {
              languageCode = 'en';
            }

            welcomeCoordinator.setCurrentLocale(languageCode);
          },
          child: Text(
            'OB_Lang'.tr,
            style: const TextStyle(color: Colors.black),
          )),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Image.asset(
      OB_AppLogo,
      key: const Key('welcomeLogoImage'),
      fit: BoxFit.fill,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text('Welcome back to Y9', style: WB_title_style);
  }

  Widget _userInfo(BuildContext context) {
    return Text('${'Emmanual Jisula\n    (684029684)'}', style: WB_user_info_style);
  }

  Widget _enterPassCodeTitle(BuildContext context) {
    return Text('Enter Passcode', style: WB_enter_passcode_title_style);
  }
}
