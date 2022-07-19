import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:config/Colors.dart' as config_color;
import 'package:flutter/material.dart';
import 'package:welcome/sub_features/welcome/data_model/welcome_model.dart';
import 'package:core/view/base_view.dart';
import 'package:get/get.dart';

import '../../../welcome_module.dart';
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
  factory CrayonWelcomScreen.forCustomerApp() => CrayonWelcomScreen(
    welcomeScreenArgs: WelcomeScreenArgs(
      '',
      '',
      'Customer',
    ),
  );
}

class _CrayonWelcomScreenState extends State<CrayonWelcomScreen> {
  @override
  Widget build(BuildContext context) =>
      BaseView<WelcomeCoordinator, WelcomeScreenState>(
    setupViewModel: (coordinator) async {
    },
    builder: (context, state, welcomeCoordinator) => Scaffold(
      body: _buildMainUIWithLoading(context,welcomeCoordinator, state),
    ),
  );
    Widget  _buildMainUIWithLoading(context, WelcomeCoordinator welcomeCoordinator, WelcomeScreenState state){
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
  Widget _buildMainUI(
      BuildContext context,
      WelcomeCoordinator welcomeCoordinator,
      WelcomeScreenState state
      ) {
      return _buildNonSignedInUI(context, state, welcomeCoordinator);
    }

Widget _buildNonSignedInUI(
    BuildContext context,
    WelcomeScreenState state,
    WelcomeCoordinator welcomeCoordinator
    ) {
  return Stack(
    children: [
       _createBackgroundImage(),
      // _createOverLay(),
      Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 14,
          bottom: 10,
          top: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLanguageChangeButton(context, state , welcomeCoordinator),
            const SizedBox(height: 40),
            _buildLogo(context),
            _buildSizedBox(),
            _buildNeomPayTitle(context),
            _buildSizedBox(),
             _buildNeomPaySubTitle(context),
              const Spacer(),
            _buildSignInButton(context, welcomeCoordinator, state),
            _buildSignUpButton(context, welcomeCoordinator, state),
          ],
        ),
      ),
    ],
  );
}

  Widget _buildSizedBox() {
    return const SizedBox(height: 32);
  }

  Widget _buildLanguageChangeButton(
      BuildContext context,
      WelcomeScreenState state,
      WelcomeCoordinator welcomeCoordinator
      ) {
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
          child: Text('OB_Lang'.tr,
            style: const TextStyle(
                color: Colors.black
            ),
          )
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Image.asset(
      OB_AppLogo,
      key: const Key('welcomeLogoImage'),
      height: 90,
      width: 90,
      fit: BoxFit.fill,
    );
  }

  Widget _buildNeomPayTitle(BuildContext context) {
    return Container(
      child: Text('OB_WelcomeTitle'.tr,
          style: WELCOME_HEADING_STYLE
      ),
    );
  }

  Widget _buildNeomPaySubTitle(BuildContext context) {
    return Container(
      width: 250,
      child: Text('OB_WelcomeSubTitle'.tr,
          style: WELCOME_SUBHEADING_STYLE
      ),
    );
  }

  Widget _buildSignUpButton(
      BuildContext context,
      WelcomeCoordinator welcomeCoordinator,
      WelcomeScreenState state,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color:  config_color.PRIMARY_COLOR,
            borderRadius: BorderRadius.circular(8.0)
        ),
        child: Center(
          child: Text('OB_SignIn'.tr, style: const TextStyle(
              color: Colors.white
          ),),
        ),
      ),
    );
  }

  Widget _buildSignInButton(
      BuildContext context,
      WelcomeCoordinator welcomeCoordinator,
      WelcomeScreenState state,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(width: 1)
        ),
        child: Center(
          child: Text('OB_SignUp'.tr, style: const TextStyle(
            color: config_color.SECONDARY_COLOR
          ),),
        ),
      ),
    );
  }

  Widget _createBackgroundImage() {
    return Image.asset(
      OB_Background,
      key: Key('welcomeBackgroundImage'),
      width: double.infinity,
      filterQuality: FilterQuality.high,
      fit: BoxFit.fill,
    );
  }
}
