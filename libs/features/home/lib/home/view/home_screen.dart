import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:settings/model/settings_arguments.dart';
import 'package:settings/view/settings_view.dart';
import 'package:widget_library/utils/icon_utils.dart';
import 'package:shared_data_models/loan_detail/response/loan_detail_response/loan_detail_response.dart';
import '../constants/image_constant.dart';
import '../home_module.dart';
import '../state/home_screen_state.dart';
import '../viewmodel/home_coordinator.dart';
import 'package:shared_data_models/home/customerCount/customer_count_response/data.dart';

class CrayonHomeScreen extends StatefulWidget {
  static const viewPath = '${HomeModule.moduleIdentifier}/CrayonHomeScreen';
  final HomeScreenArgs homeScreenArgs;

  const CrayonHomeScreen({Key? key, required this.homeScreenArgs})
      : super(key: key);

  @override
  State<CrayonHomeScreen> createState() => _CrayonCustomerHomeScreenState();

  factory CrayonHomeScreen.forCustomerApp() => CrayonHomeScreen(
        homeScreenArgs: HomeScreenArgs(
          userType: UserType.Customer,
          isAgent: false,
        ),
      );
}

class _CrayonCustomerHomeScreenState extends State<CrayonHomeScreen> {
  late BuildContext context;
  int selectedIndex = 0;
  String username = '';
  String userId = '';
  String? deviceLoan;
  String? outstandingAmount;
  String? repaidAmount;

  Data customerCount =
      const Data(initiatedCustomer: '0', enrolledCustomer: '0');
  LoanDetailResponse loanDetailResponse = LoanDetailResponse();

  @override
  Widget build(BuildContext context) =>
      BaseView<HomeCoordinator, HomeScreenState>(
        onStateListenCallback: (preState, newState) => {},
        setupViewModel: (coordinator) async {
          coordinator.initialiseState(
              context, '', widget.homeScreenArgs.isAgent, false);

          if (widget.homeScreenArgs.isAgent) {
            username = await coordinator.getAgentName();
            userId = await coordinator.getAgentId();
            setState(() {
              username;
              userId;
            });
            customerCount = await coordinator.getCustomerCount();
            setState(() {});
          } else {
            username = await coordinator.getCustomerName();
            userId = await coordinator.getCustomerId();
            setState(() {
              username;
              userId;
            });
            loanDetailResponse = (await coordinator.getLoanDetails())!;
            deviceLoan = loanDetailResponse.data?.loanId ?? "-";
            outstandingAmount =
                loanDetailResponse.data?.outStandingAmount ?? "-";
            repaidAmount = loanDetailResponse.data?.repaymentFee ?? "-";
            setState(() {});
          }
        },
        builder: (context, state, coordinator) => Scaffold(
          body: SafeArea(
            bottom: false,
            child: state.when(
              initialState: () => SizedBox(),
              ready: (
                _,
                __,
                ___,
                ____,
              ) =>
                  _buildMainUIWithLoading(
                context,
                coordinator,
                (state as HomeScreenReady),
              ),
            ),
          ),
        ),
      );

  Widget _userInfoView() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          _userImage(),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                greeting(),
                style: HS_morning_text_style,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(username, style: HS_name_text_style),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }

  Widget _redBoxView(HomeCoordinator coordinator) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(20.0),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        color: OB_WelcomeThirdTtileColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              isAgent()
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HS_AccountId'.tr,
                          style: HS_title_style,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(userId.tr, style: HS_account_id_style),
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HS_CardList1Title'.tr,
                          style: HS_title_style,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(deviceLoan ?? "-", style: HS_account_id_style),
                      ],
                    ),
              const Spacer(),
              Image.asset(
                OB_AppLogo,
                height: 60,
                width: 60,
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          (isAgent() == true)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HS_TotalOnBoarderCustomers'.tr,
                          style: HS_title_style,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(customerCount.enrolledCustomer!,
                            style: HS_account_id_style),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HS_PendingCustomerRequests'.tr,
                          style: HS_title_style,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text('-', style: HS_account_id_style),
                      ],
                    ),
                  ],
                )
              : Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HS_Daily_Repayment_amount'.tr,
                          style: HS_title_style,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(outstandingAmount ?? '-',
                                style: HS_account_id_style),
                            const Text(" TZSHS", style: HS_card_items_style_w)
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'HS_CardList3Title'.tr,
                          style: HS_title_style,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(children: [
                          Text(repaidAmount ?? "-", style: HS_account_id_style),
                          const Text(" TZSHS", style: HS_card_items_style_w)
                        ]),
                      ],
                    ),
                  ],
                ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
            child: (widget.homeScreenArgs.isAgent)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          coordinator.navigateToCustomerRegister();
                        },
                        child: _actionCommonView(
                            'HS_Customer_OnBoarding'.tr, HS_CustomerMangIcon),
                      ),
                      InkWell(onTap:()  {
                        coordinator.devicereg();
                      },
                     child: _actionCommonView(
                          'HS_Customer_DeviceSwap'.tr, HS_DeviceSwapIcon)),
                      _actionCommonView(
                          'HS_Customer_AgentSupport'.tr, HS_AgentSupportIcon),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          coordinator.navigationToBottomSheet();
                        },
                        child: _actionCommonView(
                            'HS_LoanRepayment'.tr, HS_LoanRepayment),
                      ),
                      InkWell(
                        onTap: () {
                          coordinator
                              .navigateToLoanDetailScreen(loanDetailResponse);
                        },
                        child: _actionCommonView(
                            'HS_LoanDetails'.tr, HS_LoanDetail),
                      ),
                    ],
                  ),
          )
        ],
      ),
    );
  }

  bool isAgent() {
    bool isAgent = false;
    if (widget.homeScreenArgs.isAgent) {
      return isAgent = true;
    }
    return isAgent;
  }

  Widget _actionCommonView(String title, String imagePath) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.all(2.0),
          padding: const EdgeInsets.all(14.0),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: const BoxDecoration(
              color: HS_RedCardIconsBackColor, shape: BoxShape.circle),
          child: getSvg(
            imagePath,
            color: (title == 'HS_Customer_DeviceSwap'.tr ||
                    title == 'HS_Customer_AgentSupport'.tr)
                ? SU_border_color
                : OB_WelcomeThirdTtileColor,
          ),
          //   Image.asset(
          //     imagePath,
          //     width: 20,
          //     height: 20,
          //     // color: (title == 'HS_Customer_DeviceSwap'.tr ||
          //     //         title == 'HS_Customer_AgentSupport'.tr)
          //     //     ? SU_border_color
          //     //     : OB_WelcomeThirdTtileColor,
          //   ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: (title == 'HS_Customer_DeviceSwap'.tr ||
                  title == 'HS_Customer_AgentSupport'.tr)
              ? HS_card_items_grey_style
              : HS_card_items_style,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Widget _inviteAgentBoxView() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.all(20.0),
      width: double.maxFinite,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        color: HS_InviteBoxBackColor,
        borderRadius: BorderRadius.all(
          Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 10,
          ),
          RichText(
              text: TextSpan(
            text: ' ',
            children: <TextSpan>[
              TextSpan(
                  text: 'HS_Agent_Refer_Program'.tr,
                  style: HS_invite_your_friends_style),
              TextSpan(
                  text: 'HS_Agent_Stay_Tunned'.tr, style: HS_stay_tunned_style),
            ],
          )),
          const SizedBox(
            height: 10,
          ),
          Text(
            'HS_Agent_Refer_Text'.tr,
            style: HS_invite_friends_y9_style,
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              HS_InviteIcon,
              width: 180,
              height: 110,
            ),
          )
        ],
      ),
    );
  }

  Widget _inviteBoxView() {
    return Card(
      elevation: 20,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(20.0),
        width: double.maxFinite,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: const BoxDecoration(
          color: READINGVIEW_COLOR,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text('HS_Widget1Title'.tr, style: HS_invite_your_friends_style),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HS_Widget1Description'.tr,
                      style: HS_invite_friends_y9_style,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      'HS_explore'.tr,
                      style: HS_explore_title_style,
                    ),
                  ],
                ),
                Image.asset(
                  HS_Reading,
                  height: 110,
                )
              ],
            )
          ],
        ),
      ),
    );
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
      height: 40,
      width: 40,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: profilePicHolderYellowColor,
      ),
      child: Center(
          child: Text(
        initial,
        style: AN_TextFieldLabel_FF,
      )),
    );
  }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return  'HS_GoodMorning'.tr;
    }
    if (hour < 17) {
      return 'HS_GoodAfternoon'.tr;
    }
    return 'HS_GoodEvening'.tr;
  }

  _buildMainUIWithLoading(BuildContext context, HomeCoordinator coordinator,
      HomeScreenReady state) {
    return Stack(
      children: [
        _buildMainUI(context, coordinator, state),
        // if (state.isLoading) _createLoading(state),
      ],
    );
  }

  _buildMainUI(
    BuildContext context,
    HomeCoordinator coordinator,
    HomeScreenReady state,
  ) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: SizedBox(
          height: 55,
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: getSvg(HS_HomeIcon,
                      color: selectedIndex == 0
                          ? const Color(0xFFDA2228)
                          : const Color(0xFF000000)),
                  // Image.asset(
                  //   HS_HomeIcon,
                  //   scale: 2.0,
                  // ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: getSvg(HS_SettingIcon,
                      color: selectedIndex == 1
                          ? const Color(0xFFDA2228)
                          : const Color(0xFF000000)),

                  //   HS_SettingIcon,
                  //   scale: 2.0,
                  // ),
                  label: '')
            ],
            onTap: (index) {
              // Image.asset(
              setState(() {
                selectedIndex = index;
              });
              // if(index == 1){
              // coordinator.navigateToSettingsScreen();
              // }
            },
          ),
        ),
        body: selectedIndex == 0
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        _userInfoView(),
                        _redBoxView(coordinator),
                        widget.homeScreenArgs.isAgent
                            ? _inviteAgentBoxView()
                            : _inviteBoxView(),
                      ],
                    )
                  ],
                ),
              )
            : Settings(
                screenArgs: SettingsScreenArgs(
                    isAgent: isAgent(),
                    userType: widget.homeScreenArgs.userType),
              ));
  }
}
