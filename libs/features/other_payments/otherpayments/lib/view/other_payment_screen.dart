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
  late Timer _timer;
  final ValueNotifier<int> _startValue = ValueNotifier<int>(15);

  String transactionIdError = '';
  String mobileNumberError = '';
  String agentIdError = '';
  TextEditingController transactionController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  void startTimer() {
    const oneMintue = Duration(minutes: 15);
    _timer = Timer.periodic(
      oneMintue,
      (Timer timer) {
        if (_startValue.value == 0) {
          if (mounted) {
            setState(() {
              timer.cancel();
            });
          }
        } else {
          if (mounted) {
            _startValue.value--;
          }
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
  }

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
          },
          onStateListenCallback: (preState, newState) => {
                _listenToStateChanges(
                    context, newState as OtherPaymentStateReady)
              },
          builder: (context, state, coordinator) => CrayonPaymentScaffold(
                appBarAttributes: CrayonPaymentAppBarAttributes(
                  key: const Key('CardDetailsScreen_AppBarBackButton'),
                  left: [
                    const CrayonPaymentAppBarButtonType.back(),
                  ],
                ),
                bottomNavigationBar: _buildContinueButton(
                    context, coordinator, state as OtherPaymentStateReady),
                body: state.when(
                  initialState: () => const SizedBox(),
                  ready: (
                    _,
                    __,
                    ___,
                    ____,
                    _____,
                  ) =>
                      _buildMainUIWithLoading(
                    context,
                    coordinator,
                    (state),
                  ),
                ),
              ));

  Widget _buildMainUIWithLoading(
    BuildContext context,
    OtherPaymentCoordinator coordinator,
    OtherPaymentStateReady state,
  ) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        if (state.isLoading) _createLoading(state),
      ],
    );
  }

  Widget _createLoading(OtherPaymentStateReady state) {
    if (state.isLoading) {
      return const CenteredCircularProgressBar(color: PRIMARY_COLOR);
    } else {
      return Container();
    }
  }

  Widget _buildMainUI(
    BuildContext context,
    OtherPaymentCoordinator coordinator,
    OtherPaymentStateReady state,
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
                    child: const Center(
                        child: Image(
                      image: AssetImage("assets/a03.png"),
                      height: 40,
                      width: 40,
                    )),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:  [
                      const Text(
                        "Down payment",
                        style: TextStyle(
                            color: Color(0xff676767),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        "${widget.otherPaymentScreenArgs.amount} TZSHS",
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            _buildLabelTextField(
                'other_payment_transaction_id_title',
                transactionController,
                coordinator,
                'other_payment_transaction_id_hint',
                transactionIdError,
                TextInputType.number),
            const SizedBox(
              height: 48,
            ),
            _buildLabelTextFieldMobNumber(
              'SU_mobile_no_label',
              mobileController,
              coordinator,
              'SU_subtitle_hint',
            )
          ],
        ),
      ),
    );
  }

  Widget _sub_title(OtherPaymentCoordinator coordinator) {
    return CrayonPaymentText(
        key: Key('${_identifier}_Other_payment_subtitle'),
        text: TextUIDataModel(
          'Other_payment_subtitle'.tr,
          styleVariant: CrayonPaymentTextStyleVariant.headline6,
          color: AN_TitleColor,
          fontWeight: FontWeight.w500,
        ));
  }

  Widget _buildLabelTextField(
      String label,
      TextEditingController controller,
      OtherPaymentCoordinator coordinator,
      String hint,
      String errorText,
      TextInputType textInputType) {
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
          textCapitalization: TextCapitalization.characters,
          onChanged: (value) {
            /*   _validateForm(coordinator);
            if (nidaNumberError.isNotEmpty || nidaNumber.text.length > 23) {
              coordinator.isValidNidaNumber(nidaNumber.text);
            }
            if (agentIdError.isNotEmpty) {
              coordinator.isValidAgentId(agentId.text);
            }*/
          },
        ),
      ),
    );
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
            /*_validateForm(coordinator);
            if (mobileNumberError.isNotEmpty || mobileNumber.text.length > 11) {
              coordinator.isValidMobileNumber(mobileNumber.text);
            }*/
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
          //coordinator.isValidNidaNumber(nidaNumber.text);
        }
        break;
      case 'SU_mobile_no_label':
        if (mobileNumberError.isNotEmpty ||
            mobileController.text.isNotEmpty == true) {
          print("ffg");
          //coordinator.isValidMobileNumber(mobileNumber.text);
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
          if (_isBtnEnabled) {
            coordinator.makePayment(
              context,
                 widget.otherPaymentScreenArgs.amount,
              mobileController.text.trim(),
              transactionController.text.trim(),
            );
            /* coordinator.isValidNidaNumber(nidaNumber.text);
            coordinator.isValidMobileNumber(mobileNumber.text);
            coordinator.isValidAgentId(agentId.text);
            if (_isBtnEnabled &&
                coordinator.isValidNidaNumber(nidaNumber.text)) {
              coordinator.signup(widget.signUpArguments, mobileNumber.text,
                  nidaNumber.text, agentId.text);
            }*/
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

  String _getCaptialUserName(String letter) => letter.isNotEmpty
      ? letter.trim().split(' ').map((l) => l[0]).take(2).join()
      : '';

  _title(BuildContext context) {
    return CrayonPaymentText(
        key: Key('${_identifier}_Other_Payments_title'),
        text: TextUIDataModel(
          'Other_Payments_title'.tr,
          styleVariant: CrayonPaymentTextStyleVariant.headline4,
          color: AN_TitleColor,

          fontWeight: FontWeight.w600,
        ));
  }

  _textWidget(BuildContext context, String? text, bool isResend) {
    return Row(
      children: [
        CrayonPaymentText(
          key: Key('${_identifier}_Waiting_Payment'),
          text: TextUIDataModel(text!,
              styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
              color: Black,
              fontWeight: FontWeight.w500),
        ),
        dynamicWSpacer(30),
        isResend
            ? InkWell(
                onTap: () {
                  /*otherPaymentCoordinator!.makePayment(
                      context, widget.otherPaymentScreenArgs.amount);*/
                },
                child: Text('DLC_resend'.tr,
                    style: const TextStyle(
                        decoration: TextDecoration.underline,
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: SU_subtitle_terms_color)),
              )
            : Text("")
      ],
    );
  }

  _subTitle(BuildContext context) {
    return
        //       CrayonPaymentText(
        //       key: Key('${_identifier}_DLC_Down_Payment_Subtitle'),
        //       text: const TextUIDataModel(
        //           'DLC_Down_Payment_Subtitle',
        //           styleVariant: CrayonPaymentTextStyleVariant.subtitle2,
        //           color: VO_ResendTextColor,
        //           fontWeight: FontWeight.w400),
        // );

        ValueListenableBuilder<int>(
            valueListenable: _startValue,
            builder: (BuildContext context, int value, Widget? child) {
              return Align(
                  alignment: Alignment.topLeft,
                  child: RichText(
                    text: TextSpan(
                      text: 'DLC_Down_Payment_Subtitle'.tr,
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          color: DD_TextLabel,
                          fontWeight: FontWeight.w600),
                      children: <TextSpan>[
                        const TextSpan(
                            text: "  ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(0xFFDA2228))),
                        TextSpan(
                            text: "${value.toString()} min",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(0xFFDA2228))),
                      ],
                    ),
                  ));
            });
  }

  _rowWidget(BuildContext context, {Widget? icon, Widget? text}) {
    return Row(
      children: [
        icon!,
        SizedBox(
          width: AppUtils.appUtilsInstance
              .getPercentageSize(percentage: 7, ofWidth: true),
        ),
        text!
      ],
    );
  }

  _listenToStateChanges(
      BuildContext context, OtherPaymentStateReady newState) async {
    if (newState.loanApproved == 1) {
      setState(() {
        _isBtnEnabled = true;
      });
    } else if (newState.loanApproved == 2) {
      return;
    }
  }
}
