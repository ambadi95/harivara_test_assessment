import 'dart:async';
import 'package:config/Colors.dart' as config_color;
import 'package:config/Colors.dart' as config_colors;
import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/mobile_core.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_data_models/otherpayment/otherpayment_screen_args.dart';
import 'package:widget_library/formatter/nida_input_formatter.dart';
import 'package:widget_library/html/rich_text_description.dart';
import 'package:widget_library/input_fields/input_field_with_label.dart';
import 'package:widget_library/input_fields/input_number_field_with_label.dart';

import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/utils/app_utils.dart';
import 'package:downpayment/downpayment_module.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import '../otherpayment_module.dart';
import '../state/otherpayment_state.dart';
import '../viewmodel/otherpayment_coordinator.dart';
import 'package:sprintf/sprintf.dart';

class OtherPaymentScreen extends StatefulWidget {
  static const viewPath =
      '${OtherPaymentModule.moduleIdentifier}/otherpaymetnscreen';

  final OtherPaymentScreenArgs otherPaymentScreenArgs;

  const OtherPaymentScreen({Key? key, required this.otherPaymentScreenArgs})
      : super(key: key);

  @override
  State<OtherPaymentScreen> createState() => _OtherPaymentScreenState();
}

class _OtherPaymentScreenState extends State<OtherPaymentScreen> {
  final String _identifier = 'otherpayment-screen';
  bool _isBtnEnabled = false;
  String username = "";
  OtherPaymentCoordinator? otherPaymentCoordinator;

  String transactionIdError = '';
  String mobileNumberError = '';
  String agentIdError = '';
  TextEditingController transactionController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController customerMembershipID = TextEditingController();


  @override
  Widget build(BuildContext context) =>
      BaseView<OtherPaymentCoordinator, OtherPaymentState>(
          setupViewModel: (coordinator) async {
            otherPaymentCoordinator = coordinator;
            coordinator.initialiseState(context);
            /*username = await coordinator.getNewCustomerName(); //getAgentName();
            setState(() {
              username;
            });*/
            // coordinator.makePayment(context,widget.otherPaymentScreenArgs.amount);

              customerMembershipID.text = await coordinator.getCustomerID();
            setState(()  {
              customerMembershipID.text;
            });
          },
          onStateListenCallback: (preState, newState) => {
                _listenToStateChanges(
                    context, newState)
              },
          builder: (context, state, coordinator) => CrayonPaymentScaffold(
                appBarAttributes: CrayonPaymentAppBarAttributes(
                  key: const Key('CardDetailsScreen_AppBarBackButton'),
                  left: [
                    const CrayonPaymentAppBarButtonType.back(),
                  ],
                ),
                // bottomNavigationBar: _buildContinueButton(
                //     context, coordinator, state as OtherPaymentStateReady),
              bottomNavigationBar: state.maybeWhen(
                loadingState: () =>
                    _buildMainUIWithLoading(context, coordinator),
                orElse: () => SizedBox(
                  height: 120,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 14,
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      _buildContinueButton(context, coordinator, state),
                    ],
                  ),
                ),
              ),
            body: state.maybeWhen(
              orElse: () => SingleChildScrollView(
                  child: SafeArea(
                    child: _buildMainUI(coordinator),
                  )),
            ),

                // state.when(
                //   initialState: () => const SizedBox(),
                //   ready: (
                //     _,
                //     __,
                //     ___,
                //     ____,
                //     _____,
                //   ) =>
                //       _buildMainUIWithLoading(
                //     context,
                //     coordinator,
                //     (state),
                //   ),
                // ),
              ));

  Widget _buildMainUIWithLoading(
    BuildContext context,
    OtherPaymentCoordinator coordinator,
  ) {
    return Stack(
      children: [
        _buildMainUI(coordinator),
        _createLoading(),
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

  Widget _buildMainUI(
    OtherPaymentCoordinator coordinator,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(context),
            const SizedBox(
              height: 16,
            ),
            _sub_title(coordinator),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffF4EEEB),
                borderRadius: BorderRadius.circular(4),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(color: Colors.white),
                    child:  Center(
                      child:  Image.asset(
                        widget.otherPaymentScreenArgs.image,
                        width: 95,
                        height: 132,
                        package: 'shared_data_models',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'other_down_payment'.tr,
                        style: const TextStyle(
                            color: Color(0xff676767),
                            fontSize: 16,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "${widget.otherPaymentScreenArgs.amount} TZSHS",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),_buildLabelTextField(
                'other_payment_customer_member_id',
                customerMembershipID,
                coordinator,
                '',
                '',
                TextInputType.number,
                false),
            const SizedBox(
              height: 25,
            ),
            _buildLabelTextField(
                'other_payment_transaction_id_title',
                transactionController,
                coordinator,
                'other_payment_transaction_id_hint',
                transactionIdError,
                TextInputType.text, true),
            const SizedBox(
              height: 25,
            ),
            _buildLabelTextFieldMobNumber(
              'SU_mobile_no_label',
              mobileController,
              coordinator,
              'SU_subtitle_hint',
            ),
            const SizedBox(
              height: 48,
            ),
            Container(
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffF4EEEB),
                borderRadius: BorderRadius.circular(4),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                    Container(
                      margin: EdgeInsets.only(top:16),
                      child: Image.asset(
                          "assets/images/alert_icon.png",
                          width: 40,
                          height: 40,
                        ),
                    ),

                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      Text(
                        'other_down_notes'.tr,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.6,
                        child: Text(
                          'other_down_notes_subtitle'.tr,
                          style: const TextStyle(
                              color: Color(0xff676767),
                              fontSize: 13,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _sub_title(OtherPaymentCoordinator coordinator) {
    return  RichText(
      text: TextSpan(
        text: 'Other_payment_subtitle'.tr,
        style: const TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            color: AN_TitleColor,
            fontWeight: FontWeight.w500),
        children:const  <TextSpan>[
           TextSpan(
              text: ' TRAN',
              style:
              TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Colors.black)),
        ],
      ),
    );
    // return CrayonPaymentText(
    //     key: Key('${_identifier}_Other_payment_subtitle'),
    //     text: TextUIDataModel(
    //       'Other_payment_subtitle'.tr,
    //       styleVariant: CrayonPaymentTextStyleVariant.headline6,
    //       color: AN_TitleColor,
    //       fontWeight: FontWeight.w500,
    //     ));
  }

  Widget _buildLabelTextField(
      String label,
      TextEditingController controller,
      OtherPaymentCoordinator coordinator,
      String hint,
      String errorText,
      TextInputType textInputType,
      bool enabled) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          _checkValid(
            label,
            coordinator,
          );
        },
        child: InputFieldWithLabel(
          label: label.tr,
          hintText: hint.tr,
          controller: controller,
          errorText: errorText.tr,
          keyboardType: textInputType,
          enabled: enabled,
          inputFormatters: [
            LengthLimitingTextInputFormatter(20),
          ],
          textCapitalization: TextCapitalization.characters,
          onChanged: (value) {
             _validateForm(coordinator);
            if (transactionIdError.isNotEmpty || transactionController.text.length > 21) {
              coordinator.isValidTransID(transactionController.text);
            }
          },
        ),
      ),
    );
  }

  void _validateForm(OtherPaymentCoordinator coordinator) {
    coordinator.validateForm(transactionController.text, mobileController.text);
  }

  Widget _buildLabelTextFieldMobNumber(
      String label,
      TextEditingController controller,
      OtherPaymentCoordinator coordinator,
      String hint) {
    return FocusScope(
      child: Focus(
        onFocusChange: (focus) {
          _checkValid(
            label,
            coordinator,
          );
        },
        child: InputNumberFieldWithLabel(
          label: label.tr,
          controller: controller,
          errorText: mobileNumberError.tr,
          hintText: hint.tr,
          key: const Key('mobileNumberTextField'),
          inputFormatters: <TextInputFormatter>[
            NIDAInputFormatter(mask: 'xxx xxx xxx', separator: ' ')
          ],
          keyboardType: TextInputType.number,
          onChanged: (value) {
            _validateForm(coordinator);
            if (mobileNumberError.isNotEmpty || mobileController.text.length > 11) {
              coordinator.isValidMobileNumber(mobileController.text);
            }
          },
        ),
      ),
    );
  }

  void _checkValid(String label, OtherPaymentCoordinator coordinator) {
    switch (label) {
      case 'SU_ID_no_label':
        if (transactionIdError.isNotEmpty ||
            transactionController.text.isNotEmpty == true) {
        }
        break;
      case 'SU_mobile_no_label':
        if (mobileNumberError.isNotEmpty ||
            mobileController.text.isNotEmpty == true) {
        }
        break;
    }
  }

  Widget _buildContinueButton(
    BuildContext context,
    OtherPaymentCoordinator coordinator,
    OtherPaymentState state,
  ) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: GestureDetector(
        onTap: () async {
          if (transactionController.text.trim() != '' &&
              mobileController.text.trim() != '') {
            if (coordinator.isValidTransID(transactionController.text) &&
                coordinator.isValidMobileNumber(mobileController.text)) {
              _isBtnEnabled = true;
              if (_isBtnEnabled) {
                coordinator.makePayment(
                    context,
                    widget.otherPaymentScreenArgs.amount,
                    mobileController.text.trim(),
                    transactionController.text.trim(),
                    widget.otherPaymentScreenArgs.deviceId,
                    widget.otherPaymentScreenArgs.modelName,
                    widget.otherPaymentScreenArgs
                );
              }
            } else {
              _isBtnEnabled = false;
            }
          } else {
            _isBtnEnabled = false;
          }
        },
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: _isBtnEnabled ? LS_ButtonColor : SU_grey_color,
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


  _title(BuildContext context) {
    return CrayonPaymentText(
        key: Key('${_identifier}_Other_payment_title_heading'),
        text: TextUIDataModel(
          'Other_payment_title_heading'.tr,
            styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
            color: AN_TitleColor,
            fontWeight: FontWeight.w600
        ));
  }

  _listenToStateChanges(
      BuildContext context, OtherPaymentState state) async {
    state.maybeWhen(
        transIDError: (message) {
          transactionIdError = message;
        },
        OtherPaymentFormState: (isValid) {
          _isBtnEnabled = isValid;
        },
        mobileNumberError: (message) {
          mobileNumberError = message;
        },
        orElse: () => null);
    // if (newState.loanApproved == 1) {
    //   setState(() {
    //     _isBtnEnabled = true;
    //   });
    // } else if (newState.loanApproved == 2) {
    //   return;
    // }
  }
}
