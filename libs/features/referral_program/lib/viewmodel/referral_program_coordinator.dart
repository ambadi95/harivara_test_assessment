import 'package:config/Colors.dart';
import 'package:core/sheets/data_model/button_options.dart';
import 'package:core/sheets/state/crayon_payment_bottom_sheet_state.dart';
import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:referral_program/viewmodel/referral_program_usecase.dart';
import 'package:widget_library/bottom_sheet/filter_bottom_sheet.dart';
import 'package:shared_data_models/referral_program_response/referral_program_list_respobse/referral_list.dart';
import 'package:widget_library/icons/crayon_payment_bottom_sheet_icon.dart';
import '../navigation_handler/referral_program_navigation_handler.dart';
import '../state/referral_program_state.dart';
import 'package:get/get.dart';
import 'package:widget_library/bottom_sheet/alert_bottom_sheet.dart';
import '../view/widgets/apply_filter.dart';

class ReferralProgramCoordinator
    extends AnalyticsStateNotifier<ReferralProgramState> {
  final ReferralProgramNavigationHandler _navigationHandler;
  final ReferralProgramUseCase _referralProgramUsecase;

  final String mobileNumberError = '';
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController emailId = TextEditingController();

  ReferralProgramCoordinator(
      this._navigationHandler, this._referralProgramUsecase)
      : super(const ReferralProgramState());

  void tabSelected(int index) {
    state = state.copyWith(selectedTab: index);
  }

  List<ReferralList>? referralList = [
    ReferralList(customerName: 'Pradeep Kumar',lastInvite: 'Sent on 25 Jan, 2022',status: 'ONBOARDED'),
    ReferralList(customerName: 'Saravana Selvaraj',lastInvite: 'Sent on 25 Jan, 2022',status: 'ACCOUNT_ACTIVATED'),
    ReferralList(customerName: 'Srinivasan',lastInvite: 'Sent on 25 Jan, 2022',status: 'WAITING'),
  ];

  Future<void> initialSaveFilter()async{
    await _referralProgramUsecase.saveSelectedFilterIndex("0");
    await _referralProgramUsecase.saveSelectedFilter('ALL');
    await  getSelectedFilter();
  }


  Future<void> applyFilter(BuildContext context) async {
    await _navigationHandler.navigateToFilterBottomSheet(context);
  }
Future<void> navigateToSuccessReferral(BuildContext context) async {
    await _navigationHandler.navigateToSuccessReferralBottomSheet('');
  }

  Future<void> getSelectedFilter()async{
      String filterIndex =  await _referralProgramUsecase.getSelectedFilterIndex();
     state = state.copyWith(selectedFilterIndex: int.parse(filterIndex));
     String filter = await _referralProgramUsecase.getSelectedFilter();
     state = state.copyWith(selectedFilter: filter);
  }

  void selectFilter(int index) async {
    state = state.copyWith(selectedFilterIndex: index);
    await _referralProgramUsecase.saveSelectedFilterIndex(index.toString());
    switch (index){
      case 0: await _referralProgramUsecase.saveSelectedFilter('ALL');
      state = state.copyWith(selectedFilter: 'ALL');
      break;
      case 1: await _referralProgramUsecase.saveSelectedFilter('WAITING');
      state = state.copyWith(selectedFilter: 'WAITING');
      break;
      case 2: await _referralProgramUsecase.saveSelectedFilter('ONBOARDED');
      state = state.copyWith(selectedFilter: 'ONBOARDED');
      break;
      // case 3: await _referralProgramUsecase.saveSelectedFilter('ACCOUNT_ACTIVATED');
      // state = state.copyWith(selectedFilter: 'ACCOUNT_ACTIVATED');
      // break;
    }
   }

   Future<void> updateList()async{
    await getSelectedFilter();
    await getReferralList(state.selectedFilter);
     //List<ReferralList> filteresList;
     // if(state.selectedFilterIndex == 0){
     //   state = state.copyWith(referralList: referralList!);
     // }else{
     //   filteresList = referralList!.where((element) => element.status! == state.selectedFilter).toList();
     //   state = state.copyWith(referralList: filteresList);
     // }
   }

  Future<void> getReferralList(String filter)async{
    state = state.copyWith(isLoading: true);
    var response = await _referralProgramUsecase.getReferenceList((p0) => null, filter);
    if(response!.status == true){
      state = state.copyWith(referralList: response.data!.referralList!);
      state = state.copyWith(yourReferral: response.data!.totalReferral!);
      state = state.copyWith(onBoarded: response.data!.onboardedReferral!);
      state = state.copyWith(yourPoints: response.data!.referralPoint!);
      state = state.copyWith(isLoading: false);
    }

  }

  bool isValidName(String name) {
    if (name.isEmpty) {
      state = const ReferralProgramState(nameError: 'DV_name_error_text');
    }
    bool result = _referralProgramUsecase.isValidName(name);
    if (!result) {
      state = const ReferralProgramState(nameError: 'DV_name_error_text');
    } else {
      state = const ReferralProgramState(nameError: '');
    }
    return result;
  }

  bool isValidEmail(String emailId) {
    if (emailId.isEmpty) {
      state = const ReferralProgramState(emailError: 'DV_email_error_text');
    }
    bool result = _referralProgramUsecase.isValidEmailId(emailId);
    if (!result) {
      state = const ReferralProgramState(emailError: 'DV_email_error_text');
    } else {
      state = const ReferralProgramState(emailError: '');
    }
    return result;
  }

  bool isMobileNumberValid(String mobileNumber) {
    if (mobileNumber.isEmpty) {
      state =
          const ReferralProgramState(mobileNumberError: 'LS_mobile_error_text');
    }
    var result = _referralProgramUsecase.isValidMobileNumber(mobileNumber);
    if (!result) {
      state =
          const ReferralProgramState(mobileNumberError: 'LS_mobile_error_text');
    } else {
      state = const ReferralProgramState(mobileNumberError: '');
    }
    return result;
  }

  Future callInviteFriends() async {
    state = ReferralProgramState(isLoading: true, selectedTab: 0);
    String cutomerId= await _referralProgramUsecase.getCustomerId();
    var response = await _referralProgramUsecase.callInviteFriend((p0) => null,customerId: cutomerId,customerName: name.text,emailId: emailId.text,mobileNo: mobileNumber.text);
    if (response?.status == true) {
      state = ReferralProgramState(isLoading: false, selectedTab: 0);
    await _navigationHandler.navigateToSuccessReferralBottomSheet(name.text);
    name.clear();
    emailId.clear();
    mobileNumber.clear();
    } else {
      state = ReferralProgramState(isLoading: false, selectedTab: 0);
      _showAlertForErrorMessage(response!.message!);
    }
  }


  _showAlertForErrorMessage(String errorMessage) {
    Get.bottomSheet(
      AlertBottomSheet(
          alertMessage: errorMessage,
          alertTitle: 'Error',
          alertIcon: "assets/images/alert_icon.png",
          onClose: () {
            _navigationHandler.goBack();
          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: true,
    );
  }

  showFilterBottomSheet() {
    Get.bottomSheet(
      FilterBottomSheet(
          alertTitle: 'PRS_filter_by',
          widget: [
            ApplyFilter(),
          ],
          bottomButtonText: 'PRS_apply',
          onBottomButtonPress: (){
            updateList();
            _navigationHandler.goBack();
          },
          packageName: ""),
      isScrollControlled: false,
      isDismissible: false,
    );
  }



}

// class ReferralList{
//   String? name;
//   String? date;
//   int? status;
//   ReferralList({this.name,this.date,this.status});
// }
