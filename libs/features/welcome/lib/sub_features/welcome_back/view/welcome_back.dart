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
import 'package:widget_library/utils/app_utils.dart';

class CrayonWelcomBackScreen extends StatefulWidget {
  static const viewPath = '${WelcomeModule.moduleIdentifier}/welcomeback';
  final UserType userType;

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
          if (widget.userType == 'Agent') {
            username = await coordinator.getUserName();
            userID = await coordinator.getUserId();
          } else {
            username = await coordinator.getCustomer();
          }
        },
        builder: (context, state, welcomeCoordinator) =>
            _buildMainUIWithLoading(context, welcomeCoordinator, state),
      );

  @override
  void dispose() {
    // passcodeController.dispose();
    super.dispose();
  }

  Widget _buildMainUIWithLoading(context,
      WelcomeBackCoordinator welcomeCoordinator, WelcomeScreenState state) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.loose,
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
    return ListView(
      children: [
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
                      .getPercentageSize(ofWidth: false, percentage: 2)),
              _buildLogo(context),
              SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(ofWidth: false, percentage: 4)),

              _buildTitle(context),
              const SizedBox(height: 27),
              _userImage(),
              SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(ofWidth: false, percentage: 2)),
              _userInfo(context, welcomeCoordinator),
              SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(ofWidth: false, percentage: 5)),
              _enterPassCodeTitle(context),
              _passcodeWidget(context, welcomeCoordinator),
              SizedBox(
                  height: AppUtils.appUtilsInstance
                      .getPercentageSize(ofWidth: false, percentage: 2)),
              Text(state.error, style: label_input_error_style),
              _buildResetPasscode(welcomeCoordinator)
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSizedBox() {
    return const SizedBox(height: 32);
  }
  String _getUserInitials() {
    if (username != null && username.contains(" ")) {
      var details = username.split(" ");
      return "${details[0].substring(0, 1).toString().toUpperCase()}${details[1].substring(0, 1).toString().toUpperCase()}";
    } else {
      if (username != null && username.length > 2) {
        return username.substring(0, 2).toUpperCase();
      } else {
        return "";
      }
    }
  }
  Widget _userImage() {
    String initial = _getUserInitials();
    return Container(
      height: 70,
      width: 70,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: profilePicHolderYellowColor,
      ),
      child: Center(
          child: Text(
            initial,
            style: AN_CardTitle_FF,
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
            children: [
              Text(
                'FORGET_PASSCODE'.tr,
                style: WB_forget_passcode_text_style,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'RESET_NOW'.tr,
                style: WB_reset_passcode_text_style,
              )
            ],
          ),
        ),
      ),
    );
  }
}
