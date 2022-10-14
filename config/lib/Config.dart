const OB_AppLogo = 'assets/images/logo.png';
const OB_Background = 'assets/images/bgLogo.png';

const ES_succes_icon = 'assets/images/success_icon.png';
const ES_red_succes_icon = 'assets/images/red_success.png';
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
const AN_Kyc_Vodacom = 'assets/images/vodacom.png';
const AN_Kyc_Tigo = 'assets/images/tigo_pay.png';
const AN_Kyc_Credit_Check = 'assets/images/credit_check.png';
const AN_Kyc_Credit_Main = 'assets/images/kyc_credit_main.png';
const AN_Kyc_Credit_ERROR = 'assets/images/kyc_and_credit_error.png';
// MockUp Data
const agentMock = 'assets/images/agent_mock.png';
const WB_or_icon = 'assets/images/orIcon.png';
const MO_credit_info_icon = 'assets/images/credit_info.png';

//  SETTINGS SVG IMAGES
const ST_view_profile = 'assets/images/profile.svg';
const ST_update_passcode = 'assets/images/updatePasscode.svg';
const ST_language = 'assets/images/language.svg';
const ST_sign_out = 'assets/images/logout.svg';
const ST_CallSupport = 'assets/images/call.svg';
const ST_TermsCondition = 'assets/images/termCondition.svg';
const ST_faq = 'assets/images/faq.svg';
const ST_agent = 'assets/images/agent.svg';
const ST_scan_icon = 'assets/images/scan_image.svg';

//live Link
 const customerEndpoint = 'https://customerapi.y9bank.com/customers/v1/';
//pre prod
//const customerEndpoint = 'https://customerapi-stage.y9bank.com/customers/v1/';
// const customerEndpoint = 'https://y9-dev-capi.testmaya.com/customers/v1/';
//dev
//  const customerEndpoint = 'https://y9-dev-capi.testmaya.com/customers/v1/';

const y9TermsCondition = 'https://y9bank.com/term-of-services/';
const yTermsAndConditionsAgent = 'https://y9bank.com/agents-terms/';
const yTermsAndConditionsCustomer = 'https://y9bank.com/customers-terms-of-use/';

// USERTYPE
enum UserType { Customer, Agent, AgentCustomer }

enum OTPEvent {
  Customer_Registration,
  Reset_Passcode,
  Agent_Login,
  Update_Passcode,
  Agent_Registration,
  Customer_Login
}

extension toString on OTPEvent {
  String toShortString() {
    return this.toString().split('.').last.replaceAll("_", " ");
  }
}


//PROD CUSTOMER INSTANCE
const LD_loan_detail = 'assets/images/loan_detail.png';
const LD_loan_detail_banner_image =
    'assets/images/loan_detail_banner_image.png';
const LD_loan_detail_banner_image2 =
    'assets/images/loan_detail_banner_image_2.png';

const String Initiated = "Initiated";
const String Enrolled = "Enrolled";
const String KYCInitiated = "KYC Initiated";
const String MNOConsent = "MNO_Consent";
const String KYCSuccess = "KYC Success";
const String KYCSuccessManuallyApproved = "KYC Success Manually Approved";
const String KYCFailed = "KYC Failed";
const String CreditCheckRequested = "Credit_Check_Requested";
const String CreditCheckSuccess = "Credit_Check_Success";
const String DeviceSelection = "Device_Selection";
const String DeviceSelected = "Device_Selected";
const String DownpaymentInitiated = "Downpayment_Initiated";
const String DownpaymentSuccess = "Downpayment_Success";
const String DownpaymentFailed = "Downpayment_Failed";
const String LoanInitiated = "Loan_Initiated";
const String LoanRejected = "Loan_Rejected";
const String LoanApproved = "Loan_Approved";
const String DeviceRegInitiated = "Device_Reg_Initiated";
const String DeviceRegSuccess = "Device_Reg_Success";
const String MDMRegInitiated = "MDM_Reg_Initiated";
const String MDMRegSuccess = "MDM_Reg_Success";
const String RepaymentInitiated = "Repayment_Initiated";
const String RepaymentSuccess = "Repayment_Success";

const String AIRTEL = "Airtel";
const String VODACOM = "Vodacom";
const String TIGO = "TIGO";
const String OTHER_PAYMENTS = "Other Payments";


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
