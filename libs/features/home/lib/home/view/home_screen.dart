import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home/home/home_screen_arguments.dart';
import 'package:settings/view/settings_view.dart';
import '../constants/image_constant.dart';
import '../home_module.dart';
import '../state/home_screen_state.dart';
import '../viewmodel/home_coordinator.dart';

class CrayonHomeScreen extends StatefulWidget {
  static const viewPath = '${HomeModule.moduleIdentifier}/CrayonHomeScreen';
  final HomeScreenArgs homeScreenArgs;

  const CrayonHomeScreen({Key? key, required this.homeScreenArgs})
      : super(key: key);

  @override
  State<CrayonHomeScreen> createState() => _CrayonCustomerHomeScreenState();
}

class _CrayonCustomerHomeScreenState extends State<CrayonHomeScreen> {
  late BuildContext context;
  int selectedIndex = 0;
  String username = '';
  String userId = '';

  @override
  Widget build(BuildContext context) =>
      BaseView<HomeCoordinator, HomeScreenState>(
        onStateListenCallback: (preState, newState) => {},
        setupViewModel: (coordinator) async {
          coordinator.initialiseState(
              context, '', widget.homeScreenArgs.isAgent, false);
          username = await coordinator.getAgentName();
          userId = await coordinator.getAgentId();

          setState(() {
            username;
            userId;
          });

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
                'HS_GoodMorning'.tr,
                style: HS_morning_text_style,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(username, style: HS_name_text_style),
            ],
          ),
          const Spacer(),
          // Stack(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.all(5.0),
          //       child: Image.asset(
          //         HS_NotificationIcon,
          //         width: 30,
          //         height: 30,
          //       ),
          //     ),
          //     Positioned(
          //       top: 0,
          //       right: 0,
          //       child: Container(
          //         height: 20,
          //         width: 20,
          //         alignment: Alignment.center,
          //         decoration: const BoxDecoration(
          //           shape: BoxShape.circle,
          //           color: HS_NotificationCountColor,
          //         ),
          //         child: const Center(
          //           child: Text(
          //             "3",
          //             style: TextStyle(
          //                 color: Colors.white,
          //                 fontWeight: FontWeight.w500,
          //                 fontSize: 13),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }

  Widget _redBoxView(HomeCoordinator coordinator) {
    return Container(
      margin: const EdgeInsets.all(10.0),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'HS_AccountId'.tr,
                    style: HS_title_style,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(isAgent() ? userId.tr : '', style: HS_account_id_style),
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
                        const Text("0", style: HS_account_id_style),
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
                        const Text("0", style: HS_account_id_style),
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
                          'HS_YourBalance'.tr,
                          style: HS_title_style,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text("TZ xx,xxxxx", style: HS_account_id_style),
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
            child: (widget.homeScreenArgs.isAgent == true)
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          // coordinator.navigateToCustomerRegister();
                        },
                        child: _actionCommonView(
                            'HS_Customer_OnBoarding'.tr, HS_CustomerMangIcon),
                      ),
                      _actionCommonView(
                          'HS_Customer_DeviceSwap'.tr, HS_DeviceSwapIcon),
                      _actionCommonView(
                          'HS_Customer_AgentSupport'.tr, HS_AgentSupportIcon),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _actionCommonView('HS_LoadWallet'.tr, HS_LoadWalletIcon),
                      _actionCommonView('HS_SendMoney'.tr, HS_SendMoneyIcon),
                      _actionCommonView(
                          'HS_CollectMoney'.tr, HS_CollectMoneyIcon),
                      _actionCommonView(
                          'HS_LoanRepayment'.tr, HS_LoanRepaymentIcon),
                    ],
                  ),
          )
        ],
      ),
    );
  }

  bool isAgent() {
    bool isAgent = false;
    if (widget.homeScreenArgs.isAgent == true) {
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
          child: Image.asset(
            imagePath,
            width: 20,
            height: 20,
            color: (title== 'HS_Customer_DeviceSwap'.tr || title== 'HS_Customer_AgentSupport'.tr)  ?  SU_border_color :  OB_WelcomeThirdTtileColor,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style:  (title== 'HS_Customer_DeviceSwap'.tr || title== 'HS_Customer_AgentSupport'.tr)  ? HS_card_items_grey_style : HS_card_items_style,
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
              text: new TextSpan(
            text: ' ',
            children: <TextSpan>[
              new TextSpan(
                  text: 'HS_Agent_Refer_Program'.tr,
                  style: HS_invite_your_friends_style),
              new TextSpan(
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
          Text('HS_InviteYourFriends'.tr, style: HS_invite_your_friends_style),
          const SizedBox(
            height: 10,
          ),
          Text(
            'HS_InviteFriends'.tr,
            style: HS_invite_friends_y9_style,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Text(
                'HS_ReferalCode'.tr,
                style: HS_referal_code_title_style,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "L69Gw",
                style: HS_referal_code_style,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RawMaterialButton(
                autofocus: false,
                onPressed: () {},
                fillColor: OB_WelcomeThirdTtileColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 40.0),
                  child: Text(
                    "Invite",
                    style: HS_title_style,
                  ),
                ),
              ),
              Image.asset(
                HS_InviteIcon,
                width: 180,
                height: 110,
              )
            ],
          )
        ],
      ),
    );
  }

  _userImage() {
    return Container(
      height: 40,
      width: 40,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: const BoxDecoration(
        color: Colors.grey,
        shape: BoxShape.circle,
      ),
      child: Image.network('https://picsum.photos/id/237/50/50'),
    );
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

  _buildMainUI(BuildContext context, HomeCoordinator coordinator,
      HomeScreenReady state) {
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
                  icon: Image.asset(
                    HS_HomeIcon,
                    scale: 2.0,
                  ),
                  label: ''),
              BottomNavigationBarItem(
                  icon: Image.asset(
                    HS_SettingIcon,
                    scale: 2.0,
                  ),
                  label: '')
            ],
            onTap: (index) {
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
                        widget.homeScreenArgs.isAgent == true
                            ? _inviteAgentBoxView()
                            : _inviteBoxView(),
                      ],
                    )
                  ],
                ),
              )
            : const Settings());
  }
}
