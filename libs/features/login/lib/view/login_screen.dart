import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/buttons/docked_button.dart';
import 'package:widget_library/dimensions/crayon_payment_dimensions.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/search_bar/search_bar_widget.dart';
import 'package:widget_library/search_bar/search_bar_widget_model.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../login_module.dart';
import '../state/login_state.dart';
import '../viewmodel/login_coordinator.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  factory Login.forCustomerApp() => const Login();
  final String _identifier = 'agent-nearby-screen';
  static const String viewPath =
      '${LoginModule.moduleIdentifier}/agent-nearby-screen';

  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginCoordinator, LoginState>(
      setupViewModel: (coordinator) {},
      builder: (context, state, coordinator) {
        return _buildMainUI(context);
      },
    );
  }

  Widget _buildMainUI(context) {
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
            dynamicHSpacer(36),
            _buildMobileField(context),
            dynamicHSpacer(36),
            const Spacer(),
            actionButton(),
            dynamicHSpacer(20),
          ],
        ));
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_LS_Login'),
      text: const TextUIDataModel(
        'LS_Login',
        styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
        color: AN_TitleColor,
        fontWeight: FontWeight.w800
      ),
    );
  }

  Widget _buildMobileField(context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CrayonPaymentText(
        key: Key('${_identifier}_LS_Mobile'),
        text: const TextUIDataModel(
          'LS_Mobile',
          styleVariant: CrayonPaymentTextStyleVariant.headline5,
          color: AN_TitleColor,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      SearchBarWidget(
        attributes: SearchBarAttributes(
            appearance: SearchBarAppearance(
              cornerRadius: 8,
              backgroundColor: AN_TextFieldBackground,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      LS_Flag,
                      width: 22,
                      height: 16,
                    ),
                    dynamicWSpacer(8),
                    CrayonPaymentText(
                      key: Key('${_identifier}_LS_Code'),
                      text: const TextUIDataModel(
                        '+255',
                        styleVariant: CrayonPaymentTextStyleVariant.headline5,
                        color: AN_TitleColor,
                      ),
                    ),
                  ],
                ),
              ),),
            dataModel: const SearchBarDataModel(
                hint: '',
                variant: CrayonPaymentTextStyleVariant.headline4)),
      ),
    ]);
  }

  Widget actionButton() {
    return CrayonPaymentDockedButton(
      key: const Key('SignInButton'),
      title: 'LS_SignIn'.tr,
      borderRadius: 8,
      height: CrayonPaymentDimensions.marginFortyEight,
      buttonColor: LS_ButtonColor,
      textColor: White,
      textStyleVariant: CrayonPaymentTextStyleVariant.headline5,
      onPressed: () {},
    );
  }

}
