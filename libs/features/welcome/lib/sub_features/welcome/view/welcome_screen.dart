import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:config/Colors.dart' as config_color;
import 'package:flutter/material.dart';
import 'package:welcome/sub_features/welcome/data_model/welcome_model.dart';
import 'package:core/view/base_view.dart';
import 'package:get/get.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/utils/launcher_utils.dart';

import '../../../welcome_module.dart';
import '../../welcome_back/view/welcome_back.dart';
import '../state/welcome_screen_state.dart';
import '../viewmodel/welcome_coordinatior.dart';

class CrayonWelcomScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/welcome';
  final WelcomeScreenArgs welcomeScreenArgs;

  const CrayonWelcomScreen({
    Key? key,
    required this.welcomeScreenArgs,
  }) : super(key: key);

  @override
  State<CrayonWelcomScreen> createState() => _CrayonWelcomScreenState();
}

class _CrayonWelcomScreenState extends State<CrayonWelcomScreen> {
  @override
  Widget build(BuildContext context) =>
      BaseView<WelcomeCoordinator, WelcomeScreenState>(
        setupViewModel: (coordinator) async {
          await coordinator.getCurrentLocale();
        },
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
    return Padding(
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
          widget.welcomeScreenArgs.isSigned
              ? Expanded(child: _buildSignedUI())
              : Expanded(
                  child:
                      _buildNonSignedInUI(context, state, welcomeCoordinator)),
        ],
      ),
    );
  }

  Widget _buildNonSignedInUI(BuildContext context, WelcomeScreenState state,
      WelcomeCoordinator welcomeCoordinator) {
    return Stack(
      children: [
        // _createBackgroundImage(),
        // _createOverLay(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            _buildLogo(context),
            _niBoraText(),
            _buildSizedBox(),
            _buildTitle(context),
            _buildSizedBox(),
            _buildSubTitle(context),
            const SizedBox(height: 5),
            _buildThirdTitle(context),
            const Spacer(),
            _buildButtons(context, welcomeCoordinator, state),
          ],
        ),
      ],
    );
  }

  Widget _buildSizedBox() {
    return const SizedBox(height: 32);
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

            welcomeCoordinator.setCurrentLocale(
                languageCode, widget.welcomeScreenArgs.userType);
          },
          child: Text(
            'OB_Lang'.tr,
            style: const TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Image.asset(
      OB_AppLogo,
      key: const Key('welcomeLogoImage'),
      height: 150,
      width: 150,
      fit: BoxFit.fill,
    );
  }

  Widget _niBoraText() {
    return RichTextDescription(
        key: const Key('OB_ni_bora'),
        description: 'OB_ni_bora'.tr,
        linkTextStyle: WELCOME_NI_TEXT_STYLE,
        descriptionTextStyle: WELCOME_BORA_TEXT_STYLE);
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'OB_WelcomeTitle'.tr,
      style: WELCOME_HEADING_STYLE,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubTitle(BuildContext context) {
    return Text('OB_WelcomeSubTitle'.tr,
        textAlign: TextAlign.center, style: WELCOME_SUBHEADING_STYLE);
  }

  Widget _buildThirdTitle(BuildContext context) {
    return InkWell(
        onTap: () {
          LauncherUtils.launcherUtilsInstance
              .launchInBrowser(url: "https://www.y9bank.com/");
        },
        child:
            Text('OB_WelcomeThirdTitle'.tr, style: WELCOME_THIRDHEADING_STYLE));
  }

  Widget _buildButtons(
    BuildContext context,
    WelcomeCoordinator welcomeCoordinator,
    WelcomeScreenState state,
  ) {
    return Row(
      children: [
        Expanded(child: _buildSignUpButton(context, welcomeCoordinator, state)),
        dynamicWSpacer(10),
        Expanded(child: _buildSignInButton(context, welcomeCoordinator, state)),
      ],
    );
  }

  Widget _buildSignUpButton(
    BuildContext context,
    WelcomeCoordinator welcomeCoordinator,
    WelcomeScreenState state,
  ) {
    return GestureDetector(
      onTap: () {
        welcomeCoordinator
            .navigateToSignUpScreen(widget.welcomeScreenArgs.userType);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: config_color.PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(8.0)),
        child: Center(
          child: Text(
            'OB_SignUp'.tr,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInButton(
    BuildContext context,
    WelcomeCoordinator welcomeCoordinator,
    WelcomeScreenState state,
  ) {
    return InkWell(
      onTap: () {
        welcomeCoordinator.navigateToLogin(widget.welcomeScreenArgs.userType);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(width: 1)),
        child: Center(
          child: Text(
            'OB_SignIn'.tr,
            style: const TextStyle(color: config_color.SECONDARY_COLOR),
          ),
        ),
      ),
    );
  }

  Widget _createBackgroundImage() {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Image.asset(
        OB_Background,
        key: Key('welcomeBackgroundImage'),
        width: double.infinity,
        filterQuality: FilterQuality.high,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildSignedUI() {
    return CrayonWelcomBackScreen(
      userType: widget.welcomeScreenArgs.userType,
    );
  }
}
