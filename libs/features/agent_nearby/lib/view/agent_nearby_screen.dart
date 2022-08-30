import 'package:agent_nearby/viewmodel/agent_nearby_coordinator.dart';
import 'package:config/Colors.dart';
import 'package:config/Config.dart';
import 'package:config/Styles.dart';
import 'package:core/view/base_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_data_models/agent_nearby/agents_near_by_response/datum.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_attributes.dart';
import 'package:widget_library/app_bars/crayon_payment_app_bar_button_type.dart';
import 'package:widget_library/page_header/text_ui_data_model.dart';
import 'package:widget_library/progress_bar/centered_circular_progress_bar.dart';
import 'package:widget_library/scaffold/crayon_payment_scaffold.dart';
import 'package:widget_library/search_bar/search_bar_widget_model.dart';
import 'package:widget_library/spacers/crayon_payment_spacers.dart';
import 'package:widget_library/static_text/crayon_payment_text.dart';
import 'package:widget_library/utils/launcher_utils.dart';
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
      setupViewModel: (coordinator) async {
        await coordinator.hasValidLocation(context);
        coordinator.agentNearbyList('');
        coordinator.search('');
      },
      builder: (context, state, coordinator) {
        return Stack(
          children: [
            _buildMainUI(context, coordinator, state),
            state.isLoading == true ? _createLoading() : SizedBox(),
            state.isFetchingLocation == true
                ? _createLocationFetchingLoader()
                : SizedBox()
          ],
        );
      },
    );
  }

  Widget _buildMainUI(
      context, AgentNearbyCoordinator coordinator, AgentNearByState state) {
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
            _buildSearchField(context, coordinator),
            dynamicHSpacer(24),
            Expanded(child: _buildNearByAgentList(context, coordinator, state)),
            dynamicHSpacer(24),
          ],
        ));
  }

  Widget _buildTitle(context) {
    return CrayonPaymentText(
      key: Key('${_identifier}_AN_Title'),
      text: const TextUIDataModel(
        'AN_Title',
        styleVariant: CrayonPaymentTextStyleVariant.headlineThirtyTwo,
        fontWeight: FontWeight.bold,
        color: AN_TitleColor,
      ),
    );
  }

  Widget _buildSearchField(context, AgentNearbyCoordinator coordinator) {
    return SearchBarWidget(
      onSearch: (value) {},
      onTextChanged: (v) {
        coordinator.search(v);
      },
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
            ),
          ),
          dataModel: const SearchBarDataModel(
              hint: 'AN_Search',
              variant: CrayonPaymentTextStyleVariant.headline5)),
    );
  }

  Widget _buildNearByAgentList(
      context, AgentNearbyCoordinator coordinator, AgentNearByState state) {
    return ListView.separated(
      separatorBuilder: (context, index) => divider(),
      shrinkWrap: true,
      itemCount: state.agentNearbyList.length,
      itemBuilder: (context, index) =>
          _buildAgentCard(context, state.agentNearbyList[index], coordinator),
    );
  }

  Widget _buildAgentCard(
      context, Datum agent, AgentNearbyCoordinator coordinator) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _userImage(agent.firstName!, agent.lastName!),
        dynamicWSpacer(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CrayonPaymentText(
              key: Key('${_identifier}_' + agent.firstName!),
              text: TextUIDataModel(agent.firstName! + ' ' + agent.lastName!,
                  styleVariant: CrayonPaymentTextStyleVariant.headline18,
                  color: AN_CardTitle,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                CrayonPaymentText(
                  key: Key('${_identifier}_Id_label'),
                  text: const TextUIDataModel('AN_AgentName',
                      styleVariant: CrayonPaymentTextStyleVariant.headline4,
                      color: AN_CardSubTitle,
                      fontWeight: FontWeight.w500),
                ),
                CrayonPaymentText(
                  key: Key('${_identifier}_' + agent.y9AgentId!),
                  text: TextUIDataModel(agent.y9AgentId!,
                      styleVariant: CrayonPaymentTextStyleVariant.headline4,
                      color: AN_CardSubTitle,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            dynamicHSpacer(4),
            SizedBox(
              width: MediaQuery.of(context).size.width * .55,
              child: CrayonPaymentText(
                key: Key('${_identifier}_' + agent.address!),
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
              actionButton(context, AN_Call, 'Call', () {
                LauncherUtils.launcherUtilsInstance
                    .makePhoneCall(phoneNumber: agent.mobileNo);
              }),
              dynamicWSpacer(10),
              actionButton(
                  context,
                  AN_MapDirection,
                  agent.distance == 0.0
                      ? 'N/A'
                      : agent.distance!.toStringAsFixed(2) + 'Km', () {
                if (agent.distance == 0.0) {
                } else {
                  coordinator.navigateToMap(agent.lat!, agent.long!);
                }
              }),
            ],
          ),
        )
      ],
    );
  }

  Widget actionButton(context, String image, String label, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: AN_CardActionBG1,
                borderRadius: BorderRadius.circular(4.0)),
            child: Image.asset(image, height: 12, width: 12),
          ),
          dynamicHSpacer(4),
          Text(
            label,
            style: const TextStyle(fontSize: 10, color: AN_ActionText),
          )
        ],
      ),
    );
  }

  Widget _createLoading() {
    return Center(
      child: Container(
        color: Colors.black.withOpacity(0.4),
        child: const CenteredCircularProgressBar(color: PRIMARY_COLOR),
      ),
    );
  }

  Widget _createLocationFetchingLoader() {
    return Center(
      child: Material(
        child: Container(
          child: const Text('Fetching your location..',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              )),
        ),
      ),
    );
  }

  _userImage(String firstName, String lastName) {
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
        '${firstName[0]}' + '${lastName[0]}',
        style: AN_TextFieldLabel_FF,
      )),
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Divider(),
    );
  }
}
