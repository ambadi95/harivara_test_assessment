

const OB_AppLogo = 'assets/images/logo.png';
const OB_Background = 'assets/images/bgLogo.png';

const ES_succes_icon = 'assets/images/success_icon.png';
const AN_BackArrow = 'assets/images/back_arrow.png';
const AN_Search = 'assets/images/search.png';
const AN_Call = 'assets/images/call.png';
const AN_MapDirection = 'assets/images/direction.png';
const DO_favorites = 'assets/images/fav.png';
const DO_selectFavorites = 'assets/images/select_fav.png';
const DO_BackArrow = 'assets/images/back_arrow.png';
const LS_BackArrow = 'assets/images/back_arrow.png';
const LS_Flag = 'assets/images/flag.png';
const RC_new_customer = 'assets/images/new_customer_icon.svg';
const RC_customer_approval = 'assets/images/customer_approval_icon.svg';

const AN_Kyc_Airtel = 'assets/images/kyc_airtel.png';
const AN_Kyc_Credit_Check = 'assets/images/credit_check.png';
const AN_Kyc_Credit_Main = 'assets/images/kyc_credit_main.png';
const AN_Kyc_Credit_ERROR = 'assets/images/kyc_and_credit_error.png';
// MockUp Data
const agentMock = 'assets/images/agent_mock.png';
const WB_or_icon = 'assets/images/orIcon.png';
const MO_credit_info_icon = 'assets/images/credit_info.png';

// const ST_view_profile = 'assets/images/view_profile_icon.png';
// const ST_update_passcode = 'assets/images/update_passcode_icon.png';
// const ST_language = 'assets/images/language_icon.png';
// const ST_sign_out = 'assets/images/sign_out_icon.png';
// const ST_CallSupport = 'assets/images/call_support.png';
// const ST_TermsCondition = 'assets/images/terms_condition.png';
// const ST_faq = 'assets/images/faq.png';
// const ST_agent = 'assets/images/agent.png';

//  SETTINGS SVG IMAGES
const ST_view_profile = 'assets/images/profile.svg';
const ST_update_passcode = 'assets/images/updatePasscode.svg';
const ST_language = 'assets/images/language.svg';
const ST_sign_out = 'assets/images/logout.svg';
const ST_CallSupport = 'assets/images/call.svg';
const ST_TermsCondition = 'assets/images/term'
    'Condition.svg';
const ST_faq = 'assets/images/faq.svg';
const ST_agent = 'assets/images/agent.svg';
const ST_scan_icon = 'assets/images/scan_image.svg';

// USERTYPE
enum UserType { Customer, Agent, AgentCustomer }

//DEV CUSTOMER INSTANCE
const customerEndpoint = 'https://y9-dev-capi.testmaya.com/customers/v1/';

//PROD CUSTOMER INSTANCE
const LD_loan_detail = 'assets/images/loan_detail.png';
const LD_loan_detail_banner_image =
    'assets/images/loan_detail_banner_image.png';
const LD_loan_detail_banner_image2 = 'assets/images/loan_detail_banner_image_2.png';

enum WorkFlowStatus {
  Initiated,
  Enrolled,
  KYC_Initiated,
  KYC_Success,
  Credit_Check_Requested,
  Credit_Check_Success,
  Device_Selection,
  Device_Selected,
  Downpayment_Initiated,
  Downpayment_Scuccess,
  Downpayment_Failed,
  Loan_Initiated,
  Loan_Approved,
  Device_Reg_Initiated,
  Device_Reg_Success,
  MDM_Reg_Initiated,
  MDM_Reg_Success,
  Repayment_Initiated,
  Repayment_Success
}
