import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_data_models/agent_nearby/agents_near_by_response/datum.dart';
import '../navigation_handler/agent_nearby_navigation_handler.dart';
import '../state/agent_nearby_state.dart';
import 'agent_nearby_usecase.dart';

class AgentNearbyCoordinator extends AnalyticsStateNotifier<AgentNearByState> {
  final AgentNearbyNavigationHandler _navigationHandler;
  final AgentNearbyUseCase _agentNearbyUseCase;

  AgentNearbyCoordinator(
    this._navigationHandler,
    this._agentNearbyUseCase,
  ) : super(const AgentNearByState());

  Future<void> hasValidLocation(BuildContext context) async {
    var locationPermissionError =
        await _agentNearbyUseCase.hasLocationPermission();
    if (locationPermissionError.isEmpty) {
      state = state.copyWith(
        isLoading: true,
      );
      var locationError = await _agentNearbyUseCase.hasValidLocation();
      if (locationError.isNotEmpty) {
        print(locationError);
      }
    } else {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  List<Datum> get nearByAgent => [
    const Datum(y9AgentId: '356HYT6584',firstName: 'Christine',
        lastName: 'Nshengoma',middleName: null,mobileNo: '255755781425',
      address: '28081994',poBoxNumber: '67QV+43P', district: 'Tanzina',imageUrl: '',region: 'Dodoma'
    ),
    const Datum(y9AgentId: '356HYT6583',firstName: 'Dennis ',
        lastName: 'Nakajumo',middleName: null,mobileNo: '255786713333',
        address: '28081994',poBoxNumber: '57QV+43P', district: 'Africa',imageUrl: '',region: 'Tabora'
    ),
  ];

  List<Datum> list = [];
  Future search(String searchText)async{
    if(searchText.isEmpty){
      list = nearByAgent;
      state = state.copyWith(agentNearbyList: list);
    }else{
      List<Datum> list1 = [];
      List<Datum> list2 = [];
      List<Datum> list3 = [];
      list = nearByAgent.where((agents)=> agents.region!.toLowerCase().contains(searchText.toLowerCase())).toList();
      list1 = nearByAgent.where((agents)=> agents.region!.toLowerCase().contains(searchText.toLowerCase())).toList();
      list2 = nearByAgent.where((agents)=> agents.district!.toLowerCase().contains(searchText.toLowerCase())).toList();
      list3 = nearByAgent.where((agents)=> agents.poBoxNumber!.toLowerCase().contains(searchText.toLowerCase())).toList();
      if(list1.isNotEmpty){
        state = state.copyWith(agentNearbyList: list1);
      }else if(list2.isNotEmpty){
        state = state.copyWith(agentNearbyList: list2);
      }else if(list3.isNotEmpty){
        state = state.copyWith(agentNearbyList: list3);
      }else {
        state = state.copyWith(agentNearbyList: list);
      }
    }
  }

}
