
import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/icon_utils.dart';
import '../referral_program_module.dart';
import '../state/referral_program_state.dart';
import '../viewmodel/referral_program_coordinator.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ReferralProgramStatusScreen extends StatelessWidget {
  final String _identifier = 'referral-program-status-screen';
  static const String viewPath =
      '${ReferralProgramModule.moduleIdentifier}/referral-program=status-screen';
  const ReferralProgramStatusScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BaseView<ReferralProgramCoordinator, ReferralProgramState>(
      setupViewModel: (coordinator) async {
        await coordinator.initialSaveFilter();
        await coordinator.getReferralList('ALL');
      },
      builder: (context, state, coordinator) {
        return Padding(
          padding: const EdgeInsets.only(right: 9,left: 9),
          child: _buildMainUI(context,coordinator, state),
        );
      },
    );
  }

  Widget _createLoading() {
    return Column(
      children: [
        SizedBox(height: 40,),
        Container(
          child: const CenteredCircularProgressBar(color: PRIMARY_COLOR),
        ),
      ],
    );
  }

  _buildMainUI(BuildContext context,ReferralProgramCoordinator coordinator, ReferralProgramState state){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18,),
        _buildTopCard(state),
        SizedBox(height: 18,),
        _buildReferralStatusText(coordinator,context),
        SizedBox(height: 18,),
        Stack(
          children: [
            state.referralList.isEmpty && state.isLoading == false ? Center(child: Text('RPS_no_referral_found'.tr)) :
            _buildList(state),
            state.isLoading == true ? _createLoading() : SizedBox()
          ],
        )

      ],
    );
  }

  _buildList(ReferralProgramState state){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: state.referralList.length,
        shrinkWrap: true,
        itemBuilder: (context, index){
      return _buildReferralListStatusCard(state.referralList[index].customerName!,state.referralList[index].lastInvite!,state.referralList[index].status!);
    });
  }

  _buildTopCard(ReferralProgramState state){
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoCard('RPS_your_referral', state.yourReferral.toString()),
          _buildInfoCard('PRS_onboarded',state.onBoarded.toString()),
          _buildInfoCard('RPS_your_point',state.yourPoints.toString())
        ],
      ),
    );
  }

  _buildInfoCard(String title, String subTitle){
    return Container(
      height: 62,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: SU_grey_icon_bg
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 13, left: 21,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title.tr,style: TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 5,),
            Text(subTitle.tr,style: TextStyle(
                fontSize: 16,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600
            ),)
          ],
        ),
      ),
    );
  }

  _buildReferralStatusText(ReferralProgramCoordinator coordinator, BuildContext context){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color:RP_background_grey
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CrayonPaymentText(
            key: Key('${_identifier}_AN_Title'),
            text: const TextUIDataModel(
              'RPS_referral_Status',
              styleVariant: CrayonPaymentTextStyleVariant.headline18,
              fontWeight: FontWeight.bold,
              color: AN_TitleColor,
            ),
          ),
          InkWell(
            onTap: ()async{
             await coordinator.showFilterBottomSheet();
            },
              child: getSvg(RPS_filter_icon)),
        ],
      ),
    );
  }

  _buildReferralListStatusCard(String title, String subTitle,String status){
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CrayonPaymentText(
                      key: Key('${_identifier}_RP_referral_Title'),
                      text: TextUIDataModel(
                        title,
                        styleVariant: CrayonPaymentTextStyleVariant.headline4,
                        fontWeight: FontWeight.bold,
                        color: AN_TitleColor,
                      ),
                    ),
                    SizedBox(height: 6,),
                    CrayonPaymentText(
                      key: Key('${_identifier}_RP_referral_SubTitle'),
                      text:  TextUIDataModel(
                       'Sent on '+ subTitle,
                        styleVariant: CrayonPaymentTextStyleVariant.overline1,
                        fontWeight: FontWeight.w500,
                        color: AN_TitleColor,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: status == 'ACCOUNT_ACTIVATED' ? RP_active_green_bg : status == 'WAITING' ? RP_non_active_red_bg : RP_onboarded_blue_bg,
                    borderRadius: BorderRadius.circular(14)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 6,top: 4,bottom: 4,right: 6),
                    child: Text( status == 'ACCOUNT_ACTIVATED' ? 'RPS_account_activated'.tr : status ==  'WAITING' ? 'PRS_waiting'.tr : 'PRS_onboarded'.tr ,style: TextStyle(fontSize: 10,color: status == 'ACCOUNT_ACTIVATED' ? RP_active_text : status == 'WAITING' ? RP_waiting_text : RPS_onBoarded_text),),
                  ),
                )
              ],
            ),
          ),
          Divider()
        ],
      ),
    );
  }

}
