import 'package:flutter/material.dart';

import 'Colors.dart';
import 'Config.dart';

const WELCOME_HEADING_STYLE = TextStyle(
    fontSize: 36,
    color: SECONDARY_COLOR,
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w900,
    letterSpacing: 1,
);

const WELCOME_SUBHEADING_STYLE = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  fontFamily: 'Montserrat',
  color: TERTIARY_COLOR,
);

const AN_Title_FF = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  color: AN_TitleColor,
);

const AN_TextFieldLabel_FF = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  color: AN_TextFieldLabel,
);

const AN_CardTitle_FF = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w400,
  fontFamily: 'Montserrat',
  color: AN_CardTitle,
);

const AN_CardSubtitle_FF = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  color: AN_CardSubTitle,
);

const AN_CardDescription_FF = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  color: AN_CardDescription,
);

const AN_ActionText_FF = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  color: AN_ActionText,
);




const WELCOME_THIRDHEADING_STYLE = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  color: OB_WelcomeThirdTtileColor,
  decoration: TextDecoration.underline,
);

const WELCOME_NI_TEXT_STYLE = const TextStyle(
    color: OB_WelcomeThirdTtileColor,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.italic);

const WELCOME_BORA_TEXT_STYLE = const TextStyle(
    color: OB_WelcomeThirdTtileColor,
    fontSize: 28,
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.italic);

const SU_title_style = TextStyle(
  fontSize: 32,
  fontWeight: FontWeight.w900,
  fontFamily: 'Montserrat',
  color: SU_title_color,
);

const SU_subtitle_style = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontFamily: 'Montserrat',
  color: SU_subtitle_color,
  height: 1.5
);

const SU_subtitle_terms_style = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  fontFamily: 'Montserrat',
  color: SU_subtitle_terms_color,
);

const SU_label_style = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  color: SU_label_color,
);

const label_input_error_style = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  color: HS_NotificationCountColor,
);
const label_input_error_red_style = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  color: PRIMARY_COLOR,
);
const label_input_error_white_style = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  color: Colors.white,
);
const label_input_error_18_style = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  color: SU_label_color,
);

const SU_text_input_style =
TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  color: SECONDARY_COLOR,
);

const SU_text_input_border_style = InputDecoration(
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide:  BorderSide(color: SU_border_color)
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide:  BorderSide(color: Colors.grey, width: 2),
  ),
);

const input_text_border_style =  OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide:  BorderSide(color: SU_border_color),
);

const input_enabled_border_style =  OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(8.0)),
    borderSide:  BorderSide(color: SU_border_color)
);

const input_text_error_border_style =  OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(8.0)),
  borderSide:  BorderSide(color: SU_border_color),
);

var SU_text_input_number_border_style = InputDecoration(
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide:  BorderSide(color: SU_border_color),
  ),
  prefixIcon: SizedBox(
    width: 100,
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset(
            LS_Flag,
            width: 22,
            height: 16,
          ),
        ),
        const Expanded(child: Text('+255  ', style: SU_text_input_style))
      ],
    ),
  ),
);

const SU_carrier_message_style = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  color: SU_carrier_message_color,
);

const SU_button_text_style = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  color: SU_button_text_color,
);

const SU_text_input_address_style = InputDecoration(
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      borderSide:  BorderSide(color: SU_border_color)
  ),
);

const ES_success_text = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  color: SECONDARY_COLOR,
);



const ES_bold_text = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  fontFamily: 'Montserrat',
  color: SECONDARY_COLOR,
);


const HS_name_text_style = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  fontStyle: FontStyle.normal,
  color: SECONDARY_COLOR,
);

const HS_morning_text_style = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  fontStyle: FontStyle.normal,
  color: HS_MorningTextColor,
);
const HS_title_style = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  fontStyle: FontStyle.normal,
  color: Colors.white,
);
const HS_account_id_style = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  fontFamily: 'Montserrat',
  fontStyle: FontStyle.normal,
  color: Colors.white,
);

const HS_card_items_style = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  fontStyle: FontStyle.normal,
  color: Colors.black,
);

const HS_card_items_style_w = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  fontStyle: FontStyle.normal,
  color: Colors.white,
);
const HS_card_items_grey_style = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
  fontFamily: 'Montserrat',
  fontStyle: FontStyle.normal,
  color: SU_border_color,
);
const HS_invite_your_friends_style = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    color: Colors.black,
    letterSpacing: -0.02
);
const HS_stay_tunned_style = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    color: Color(0xFFC83732),
    letterSpacing: -0.02
);
const HS_invite_friends_y9_style = TextStyle(
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14);



const HS_referal_code_title_style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontSize: 18);

const HS_explore_title_style = TextStyle(
    color: Color(0xFFC83732),
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontSize: 14);

const HS_referal_code_style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontSize: 18);


const WB_title_style = TextStyle(
    color: WB_TitleColor,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontSize: 20);

const WB_user_info_style = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontSize: 16);

const WB_enter_passcode_title_style = TextStyle(
    color: WB_EnterPassCodeTitleColor,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
    fontStyle: FontStyle.normal,
    fontSize: 14);

const ES_agent_contact_text_style = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Montserrat',
  color: WB_EnterPassCodeTitleColor,
);

const WB_forget_passcode_text_style = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Montserrat',
  color: WB_EnterPassCodeTitleColor,
);

const WB_reset_passcode_text_style = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  fontFamily: 'Montserrat',
  color: PRIMARY_COLOR,
  decoration: TextDecoration.underline,
);

const LR_payment_label = TextStyle(
    fontSize: 12,
    fontFamily: 'Montserrat',
    color: LR_Color565451
);

const LR_selected_payment_label = TextStyle(
    fontSize: 12,
    fontFamily: 'Montserrat',
    color: LR_White
);

const LR_payment_amount = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: LR_Black
);

const LR_selected_payment_amount = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: LR_White
);

const LR_device_loan_label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: LR_Color676767
);

const LR_device_loan_value = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: LR_Black
);

const LR_title = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: LR_Black
);

const LR_button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: LR_White
);

const LR_payCustom = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: LR_Black
);
const LR_payCustomSelected = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: LR_White
);

const LR_payStatusLabel = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.bold,
    fontFamily: 'Montserrat',
    color: LR_Color00384E
);



