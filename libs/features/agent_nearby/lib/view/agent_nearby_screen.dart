import 'package:agent_nearby/viewmodel/agent_nearby_coordinator.dart';
import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/agent_nearby/agent_nearby_model.dart';
import 'package:shared_data_models/agent_nearby/nearby_agent_mockup.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/search_bar/search_bar_widget_model.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/widget_library.dart';
import '../agent_nearby_module.dart';
import '../state/agent_nearby_state.dart';

class AgentNearBy extends StatelessWidget {
  final String _identifier = 'agent-nearby-screen';
  static const String viewPath =
      '${AgentNearByModule.moduleIdentifier}/agent-nearby-screen';

  const AgentNearBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AgentNearbyCoordinator, AgentNearByState>(
      setupViewModel: (coordinator) {},
      builder: (context, state, coordinator) {
        return _buildMainUI(context);
      },
    );
  }

  Widget _buildMainUI(context) {
    return CrayonPaymentScaffold(
        appBarAttributes: CrayonPaymentAppBarAttributes(
          key: const Key('CardDetailsScreen_AppBarBackButton'),
          left: [
            const CrayonPaymentAppBarButtonType.back(),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(context),
            dynamicHSpacer(24),
            _buildSearchField(context),
            dynamicHSpacer(24),
            Expanded(child: _buildNearByAgentList(context)),
          ],
        ));
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_AN_Title'),
      text: const TextUIDataModel(
        'AN_Title',
        styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
        color: AN_TitleColor,
      ),
    );
  }

  Widget _buildSearchField(context) {
    return SearchBarWidget(
      attributes: SearchBarAttributes(
          appearance: SearchBarAppearance(
              cornerRadius: 20,
              backgroundColor: AN_TextFieldBackground,
              prefixIcon: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  AN_Search,
                  width: 16,
                  height: 16,
                ),
              ),),
          dataModel: const SearchBarDataModel(
              hint: 'AN_Search',
              variant: CrayonPaymentTextStyleVariant.headline5)),
    );
  }

  Widget _buildNearByAgentList(context) {
    return ListView.separated(
      separatorBuilder: (context, index)=> divider(),
      shrinkWrap: true,
      itemCount: agentMockData.length,
      itemBuilder: (context, index) => _buildAgentCard(context,agentMockData[index]),
    );
  }

  Widget _buildAgentCard(context, AgentNearbyModel agent){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(agentMock,width: 38,height: 38,),
        dynamicWSpacer(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CrayonPaymentText(
              key: Key('${_identifier}_'+agent.name!),
              text: TextUIDataModel(
                agent.name!,
                styleVariant: CrayonPaymentTextStyleVariant.headline4,
                color: AN_CardTitle,
              ),
            ),
            Row(
              children: [
                CrayonPaymentText(
                  key: Key('${_identifier}_Id_label'),
                  text: const TextUIDataModel(
                    'AN_AgentName',
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: AN_CardSubTitle,
                  ),
                ),
                CrayonPaymentText(
                  key: Key('${_identifier}_'+agent.agentId!),
                  text: TextUIDataModel(
                    agent.agentId!,
                    styleVariant: CrayonPaymentTextStyleVariant.headline4,
                    color: AN_CardSubTitle,
                  ),
                ),
              ],
            ),
            dynamicHSpacer(4),
            SizedBox(
              width: 200,
              child: CrayonPaymentText(
                key: Key('${_identifier}_'+agent.address!),
                text: TextUIDataModel(
                  agent.address!,
                  styleVariant: CrayonPaymentTextStyleVariant.headline4,
                  color: AN_CardDescription,
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Row(
            children: [
              actionButton(context,AN_Call,'Call'),
              dynamicWSpacer(10),
              actionButton(context,AN_MapDirection,'0.17KM'),
            ],
          ),
        )
      ],
    );
  }

  Widget actionButton(context,String image,String label){
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color:  AN_CardActionBG1,
              borderRadius: BorderRadius.circular(4.0)
          ),
          child: Image.asset(image,height: 12,width: 12),
        ),
        dynamicHSpacer(4),
        Text(label,style: const TextStyle(fontSize: 10,color: AN_ActionText),)
      ],
    );
  }

  Widget divider(){
    return const Padding(
      padding:  EdgeInsets.symmetric(vertical: 16),
      child:  Divider(),
    );
  }
}
