import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:crayon_payment_customer/home/constants/image_constant.dart';
import 'package:crayon_payment_customer/home/home_module.dart';
import 'package:crayon_payment_customer/home/state/home_screen_state.dart';
import 'package:crayon_payment_customer/home/viewmodel/home_coordinator.dart';
import 'package:flutter/material.dart';

class CrayonCustomerHomeScreen extends StatefulWidget {
  static const viewPath =
      '${CustomerHomeModule.moduleIdentifier}/crayonCustomerHomeScreen';

  @override
  State<CrayonCustomerHomeScreen> createState() =>
      _CrayonCustomerHomeScreenState();
}

class _CrayonCustomerHomeScreenState extends State<CrayonCustomerHomeScreen> {
  late BuildContext context;

  @override
  Widget build(BuildContext context) =>
      BaseView<CustomerHomeCoordinator, CustomerHomeScreenState>(
        onStateListenCallback: (preState, newState) => {},
        setupViewModel: (coordinator) async {},
        builder: (context, state, coordinator) => SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: Image.asset(
                HS_ScanIcon,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniCenterDocked,
            bottomNavigationBar: SizedBox(
              height: 55,
              child: BottomNavigationBar(
                currentIndex: 0,
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
                onTap: (index) {},
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  _userInfoView(),
                  _redBoxView(),
                  _inviteBoxView(),
                ],
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
            children: const [
              Text(
                "Good Morning",
                style: HS_morning_text_style,
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                "Emmanual Jisula",
                style: HS_name_text_style
              ),
            ],
          ),
          const Spacer(),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Image.asset(
                  HS_NotificationIcon,
                  width: 30,
                  height: 30,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 20,
                  width: 20,
                  alignment: Alignment.center,
                  child: const Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                    ),
                  ),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: HS_NotificationCountColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _redBoxView() {
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
                children: const [
                  Text(
                    "Y9 Account Id",
                    style: HS_title_style,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "648960359535569",
                    style: HS_account_id_style
                  ),
                ],
              ),
              const Spacer(),
             Image.asset(OB_AppLogo,height: 60,width: 60,)
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Your Balance",
                    style: HS_title_style,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "TZ xx,xxxxx",
                    style: HS_account_id_style
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _actionCommonView("Load Wallet", HS_LoadWalletIcon),
                _actionCommonView("Send Money", HS_SendMoneyIcon),
                _actionCommonView("Loan Repayment", HS_LoanRepaymentIcon),
                _actionCommonView("Loan Repayment", HS_LoanRepayment1Icon),
              ],
            ),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
            ),
          )
        ],
      ),
    );
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
          child: Image.asset(
            imagePath,
            width: 20,
            height: 20,
            color: OB_WelcomeThirdTtileColor,
          ),
          decoration: const BoxDecoration(
              color: HS_RedCardIconsBackColor, shape: BoxShape.circle),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title.replaceAll(" ", "\n"),
          textAlign: TextAlign.center,
          style: HS_card_items_style,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
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
          const Text(
            "Invite your friends to Y9",
            style: HS_invite_your_friends_style
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Invite Friends to Y9 and get rewards when your friend sends their first payment.",
            style: HS_invite_friends_y9_style,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: const [
              Text(
                "Referal code",
                style: HS_referal_code_title_style,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
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
}
