import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:core/view/base_view.dart';
import 'package:get/get.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import '../../../welcome_module.dart';
import '../../welcome/state/welcome_screen_state.dart';
import '../viewmodel/welcome_back_coordinatior.dart';
import 'package:crayon_payment_customer/util/app_utils.dart';

class CrayonWelcomBackScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/welcomeback';
  final String userType;

  // final WelcomeScreenArgs welcomeScreenArgs;

  const CrayonWelcomBackScreen({Key? key, required this.userType
      // required this.welcomeScreenArgs,
      })
      : super(key: key);

  @override
  State<CrayonWelcomBackScreen> createState() => _CrayonWelcomBackScreenState();

// factory CrayonWelcomBackScreen.forCustomerBackApp() => CrayonWelcomBackScreen(
//       welcomeScreenArgs: WelcomeScreenArgs(
//         '',
//         '',
//         'Customer',
//       ),
//     );
}

TextEditingController passcodeController = TextEditingController();

class _CrayonWelcomBackScreenState extends State<CrayonWelcomBackScreen> {
  String username = '';
  String userID = '';

  @override
  Widget build(BuildContext context) =>
      BaseView<WelcomeBackCoordinator, WelcomeScreenState>(
        setupViewModel: (coordinator) async {
          username = await coordinator.getUserName();
          userID = await coordinator.getUserId();
        },
        builder: (context, state, welcomeCoordinator) => Scaffold(
          body: _buildMainUIWithLoading(context, welcomeCoordinator, state),
        ),
      );

  @override
  void dispose() {
    passcodeController.dispose();
    super.dispose();
  }

  Widget _buildMainUIWithLoading(context,
      WelcomeBackCoordinator welcomeCoordinator, WelcomeScreenState state) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            _buildMainUI(context, welcomeCoordinator, state),
            if (state.isLoading) _createLoading(state),
          ],
        ),
      ),
    );
  }

  Widget _createLoading(WelcomeScreenState state) {
    if (state.isLoading) {
      return const CenteredCircularProgressBar(color: PRIMARY_COLOR);
    } else {
      return Container();
    }
  }

  Widget _buildMainUI(BuildContext context,
      WelcomeBackCoordinator welcomeCoordinator, WelcomeScreenState state) {
    return _buidlWelcomeBackUI(context, state, welcomeCoordinator);
  }

  Widget _buidlWelcomeBackUI(BuildContext context, WelcomeScreenState state,
      WelcomeBackCoordinator welcomeCoordinator) {
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
              SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(ofWidth: false, percentage: 4)),

              _buildLogo(context),
              SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(ofWidth: false, percentage: 4)),

              _buildTitle(context),
              SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(ofWidth: false, percentage: 7)),
              _userImage(),
              SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(ofWidth: false, percentage: 2)),
              _userInfo(context, welcomeCoordinator),
              SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(ofWidth: false, percentage: 7)),
              _enterPassCodeTitle(context),
              _passcodeWidget(context, welcomeCoordinator),
              SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(ofWidth: false, percentage: 7)),
              Text(state.error, style: label_input_error_style),
              // const SizedBox(height: 57),
              // Image.asset(
              //   WB_OrIcon,
              // ),
              // const SizedBox(height: 15),
              // Image.asset(
              //   WB_touchIdIcon,
              //   scale: 2.0,
              // ),
              const Spacer(),
              //  _buildResetPasscode(welcomeCoordinator)
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

  Widget _buildLogo(BuildContext context) {
    return Image.asset(
      OB_AppLogo,
      key: const Key('welcomeLogoImage'),
      fit: BoxFit.fill,
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      'WB_WelcomeBack'.tr,
      style: WB_title_style,
      textAlign: TextAlign.center,
    );
  }

  Widget _userInfo(BuildContext context, WelcomeBackCoordinator coordinator) {
    return Text(username, style: WB_user_info_style);
  }

  Widget _enterPassCodeTitle(BuildContext context) {
    return Text('WB_EnterPassCode'.tr, style: WB_enter_passcode_title_style);
  }

  Widget _passcodeWidget(
      BuildContext context, WelcomeBackCoordinator coordinator) {
    return PinCodeTextField(
      appContext: context,
      pastedTextStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      length: 6,
      obscureText: true,
      obscuringCharacter: '*',
      blinkWhenObscuring: true,
      animationType: AnimationType.none,
      enabled: true,
      pinTheme: PinTheme(
          shape: PinCodeFieldShape.underline,
          fieldHeight: 50,
          fieldWidth: 50,
          borderWidth: 3,
          activeFillColor: Colors.white,
          disabledColor: Colors.white,
          selectedColor: Colors.black,
          activeColor: Colors.black,
          inactiveColor: Colors.grey),
      cursorColor: Colors.black,
      enableActiveFill: false,
      autoFocus: false,
      autoDismissKeyboard: true,
      autoDisposeControllers: false,
      //errorAnimationController: errorController,
      controller: passcodeController,
      keyboardType: TextInputType.number,
      onCompleted: (v) async {
        coordinator.onPasscodeCallback(
            passcodeController.text, widget.userType);
        passcodeController.clear();
        // await coordinator.navigationToDestination(widget.userType);
      },
      onChanged: (String value) {},
    );
  }

  Widget _buildResetPasscode(WelcomeBackCoordinator coordinator) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: InkWell(
          onTap: () {
            coordinator.navigateToResetNow(widget.userType);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                'Forget Passcode?',
                style: WB_forget_passcode_text_style,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Reset Now',
                style: WB_reset_passcode_text_style,
              )
            ],
          ),
        ),
      ),
    );
  }
}
