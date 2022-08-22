import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/signup/sign_up_type.dart';
import 'package:welcome/sub_features/signup/state/signup_state.dart';
import 'package:welcome/sub_features/signup/viewmodel/signup_coordinator.dart';
import 'package:welcome/welcome_module.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/progress_bar/onboarding_progress_bar.dart';
import 'package:widget_library/buttons/crayon_back_button.dart';
import 'package:config/Colors.dart' as config_color;
import 'package:get/get.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';

import '../../../../../data_model/sign_up_arguments.dart';
import '../viewmodel/registration_approval_coordinator.dart';


class RegistrationApproval extends StatefulWidget {
  final SignUpArguments signUpArguments;
  static const viewPath = '${WelcomeModule.moduleIdentifier}/registrationApproval';

  const RegistrationApproval({required this.signUpArguments, Key? key}) : super(key: key);

  @override
  State<RegistrationApproval> createState() => _SignUpState();
}

class _SignUpState extends State<RegistrationApproval> {
  bool _isBtnEnabled = true;
  bool _agentAidCustomerOnBoarding = true;
  bool _customerApproval = false;

  @override
  Widget build(BuildContext context) =>
      BaseView<RegistrationApprovalCoordinator, SignUpState>(
          onStateListenCallback: (preState, newState) =>
          {_listenToStateChanges(context, newState)},
          setupViewModel: (coordinator) async {},
          builder: (context, state, coordinator) => SafeArea(
            child: Scaffold(
              bottomNavigationBar: state.maybeWhen(
                loadingState: () =>
                    _buildMainUIWithLoading(context, coordinator),
                orElse: () => SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 23,
                      ),
                      _buildContinueButton(context, coordinator, state)
                    ],
                  ),
                ),
              ),
              body: state.maybeWhen(
                orElse: () => SingleChildScrollView(
                    child: SafeArea(
                      child: _UI(coordinator),
                    )),
              ),
            ),
          ));

  Widget _UI(RegistrationApprovalCoordinator coordinator) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTopContainer(context, coordinator),
        _buildMainUI(coordinator),
      ],
    );
  }

  Widget _buildMainUIWithLoading(
      BuildContext context,
      RegistrationApprovalCoordinator coordinator,
      ) {
    return Stack(
      children: [
        _UI(coordinator),
        _createLoading(),
      ],
    );
  }

  Widget _buildTopContainer(
      BuildContext context,
      RegistrationApprovalCoordinator coordinator,
      ) {
    return Column(
      children: [
        widget.signUpArguments.signupType == SignupType.agentAidedCustomerOnBoarding ? const SizedBox() :  _onBoardingProgressBar(),
        _buildBackBtn(context, coordinator),
      ],
    );
  }

  Widget _createLoading() {
    return Center(
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: const CenteredCircularProgressBar(
            color: config_color.PRIMARY_COLOR),
      ),
    );
  }

  Widget _buildMainUI(RegistrationApprovalCoordinator coordinator) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _title(),
          const SizedBox(
            height: 16,
          ),
          _sub_title(coordinator),
          const SizedBox(
            height: 94,
          ),
          selectableList()
        ],
      ),
    );
  }

  Widget _onBoardingProgressBar() {
    return widget.signUpArguments.isProgressBarVisible
        ? const Padding(
      padding:
      EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 0),
      child: OnBoardingProgressBar(
        currentStep: 1,
        totalSteps: 4,
      ),
    )
        : const SizedBox();
  }

  Widget _buildBackBtn(
      BuildContext context,
      RegistrationApprovalCoordinator coordinator,
      ) {
    return Align(
      alignment: Alignment.topLeft,
      child: CrayonBackButton(
        key: const Key('signup_backButton'),
        color: Colors.black,
        onPressed: () {
          coordinator.goBack();
        },
      ),
    );
  }

  Widget _title() {
    return Text(
      widget.signUpArguments.title.tr,
      style: SU_title_style,
    );
  }

  Widget _sub_title(RegistrationApprovalCoordinator coordinator) {
    return RichTextDescription(
      key: const Key('SU_SubTitle'),
      description: widget.signUpArguments.subTitle,
      linkTextStyle: SU_subtitle_terms_style,
      descriptionTextStyle: SU_subtitle_style,
      onLinkClicked: (text, link) {
        coordinator.navigateToTermsCondition();
      },
    );
  }


  Widget _buildContinueButton(
      BuildContext context,
      RegistrationApprovalCoordinator coordinator,
      SignUpState state,
      ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          if(_agentAidCustomerOnBoarding == true){
            coordinator.navigateToAgentAidedCustomer();
          }else if(_customerApproval == true){
            coordinator.navigateCustomerOnBoardingApproval();
          }
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: _isBtnEnabled
                  ? config_color.SU_button_color
                  : config_color.SU_grey_color,
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
            child: Text(
              'SU_button_text'.tr,
              style: SU_button_text_style,
            ),
          ),
        ),
      ),
    );
  }

  Widget _selectableCard (bool selected, String image, String title, Function() onTap){
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 98,
        decoration: BoxDecoration(
          border: Border.all(width:selected ? 2 : 1,color: selected ? RC_greyColor : SU_border_color),
          borderRadius: BorderRadius.circular(8)
        ),
        child: Center(
          child: Row(
            children: [
              const SizedBox(
                width: 26,
              ),
              Image.asset(image,height: 24, width: 30,),
             const SizedBox(
                width: 26,
              ),
              CrayonPaymentText(text: TextUIDataModel(
                title.tr,
                styleVariant: CrayonPaymentTextStyleVariant.bodyText2,
                color: AN_TitleColor,
              ),),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectableList(){
    return ListView(
      shrinkWrap: true,
      children: [
        _selectableCard (_agentAidCustomerOnBoarding, RC_new_customer,'RC_agent_new_customer',() {
          setState(() {
            _agentAidCustomerOnBoarding = true;
            _customerApproval = false;
            _isBtnEnabled = true;
          });
        }),
        const SizedBox(
          height: 24,
        ),
        // _selectableCard (_customerApproval,RC_customer_approval,'RC_customer_approval',(){
        //   setState(() {
        //     _agentAidCustomerOnBoarding = false;
        //     _customerApproval = true;
        //     _isBtnEnabled = true;
        //   });
        // })
      ],
    );
  }

  void _listenToStateChanges(BuildContext context, SignUpState state) {
    state.maybeWhen(
        SignUpFormState: (isValid) {
          _isBtnEnabled = isValid;
        },
        orElse: () => null);
  }
}
