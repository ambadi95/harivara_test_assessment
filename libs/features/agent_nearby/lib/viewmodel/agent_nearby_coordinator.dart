import 'package:core/view/analytics_state_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_data_models/agent_nearby/agents_near_by_response/datum.dart';
import 'package:widget_library/utils/launcher_utils.dart';
import '../navigation_handler/agent_nearby_navigation_handler.dart';
import '../state/agent_nearby_state.dart';
import 'agent_nearby_usecase.dart';
import 'package:url_launcher/url_launcher.dart';

class AgentNearbyCoordinator extends AnalyticsStateNotifier<AgentNearByState> {
  final AgentNearbyNavigationHandler _navigationHandler;
  final AgentNearbyUseCase _agentNearbyUseCase;

  AgentNearbyCoordinator(
    this._navigationHandler,
    this._agentNearbyUseCase,
  ) : super(const AgentNearByState());

  var _currentLocation;
  Future<void> hasValidLocation(BuildContext context) async {
    var locationPermissionError =
        await _agentNearbyUseCase.hasLocationPermission();
    if (locationPermissionError.isEmpty) {
      state = state.copyWith(
        isLoading: true,
      );
      var location = await _agentNearbyUseCase.hasValidLocation();
      if (location.isNotEmpty) {
        _currentLocation = await _agentNearbyUseCase.getCurrentLocation();
        print(_currentLocation);
        state = state.copyWith(
          isLoading: false,
        );
      }
    } else {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  distance(double lat, double long) {
    double distance = _agentNearbyUseCase.calculateDistance(
        _currentLocation.latitude, _currentLocation.longitude, lat, long);
    return distance;
  }

  void navigateToMap(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  List<Datum> get nearByAgent => [
        const Datum(
          y9AgentId: '356HYT6584',
          firstName: 'Christine',
          lastName: 'Nshengoma',
          middleName: null,
          mobileNo: '255755781425',
          address: '28081994',
          poBoxNumber: '67QV+43P',
          district: 'Tanzina',
          imageUrl: '',
          region: 'Dodoma',
          lat: 13.063831,
          long: 80.249931,
        ),
        const Datum(
            y9AgentId: '356HYT6583',
            firstName: 'Dennis ',
            lastName: 'Nakajumo',
            middleName: null,
            mobileNo: '255786713333',
            address: '28081994',
            poBoxNumber: '57QV+43P',
            district: 'Africa',
            imageUrl: '',
            region: 'Tabora',
            lat: 13.0768943,
            long: 80.1381482),
        const Datum(
            y9AgentId: '356HYT6583',
            firstName: 'Mark ',
            lastName: 'Lucas',
            middleName: null,
            mobileNo: '255786713333',
            address: '28081994',
            poBoxNumber: '57QV+43P',
            district: 'Africa',
            imageUrl: '',
            region: 'Tabora',
            lat: 13.063866,
            long: 80.149900),
      ];

  List<Datum> newList = [];

  Future<void> agentNearbyList(String search) async {
    newList = [];
    state = state.copyWith(
      isLoading: true,
    );
    var response = await _agentNearbyUseCase.agentsNearBy(search, (p0) => null);
    if (response?.status == true) {
      for (int i = 0; i < response!.data!.length; i++) {
        double dis = distance(13.0768943,80.149900);
        if(newList.contains(response.data)){}
        else {
          newList.add(Datum(
              firstName: response.data![i].firstName,
              lastName: response.data![i].lastName,
              address: '',
              y9AgentId: response.data![i].y9AgentId,
              poBoxNumber: '',
              region: response.data![i].region,
              district: response.data![i].district,
              mobileNo: response.data![i].mobileNo,
              imageUrl: '',
              middleName: response.data![i].middleName,
              distance: dis,
              long: 80.149900,
              lat: 13.0768943));
        }
      }
      state = state.copyWith(
          agentNearbyList: newList
            ..sort((a, b) => a.distance!.compareTo(b.distance!)));
      state = state.copyWith(
        isLoading: false,
      );
    } else {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }

  List<Datum> list = [];
  Future search(String searchText) async {
    if (searchText.isEmpty) {
      list = newList;
      state = state.copyWith(agentNearbyList: list);
    } else {
      List<Datum> list1 = [];
      List<Datum> list2 = [];
      List<Datum> list3 = [];
      list = newList
          .where((agents) =>
              agents.region!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      list1 = newList
          .where((agents) =>
              agents.region!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      list2 = newList
          .where((agents) =>
              agents.district!.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
      list3 = newList
          .where((agents) => agents.poBoxNumber!
              .toLowerCase()
              .contains(searchText.toLowerCase()))
          .toList();
      if (list1.isNotEmpty) {
        state = state.copyWith(agentNearbyList: list1);
      } else if (list2.isNotEmpty) {
        state = state.copyWith(agentNearbyList: list2);
      } else if (list3.isNotEmpty) {
        state = state.copyWith(agentNearbyList: list3);
      } else {
        state = state.copyWith(agentNearbyList: list);
      }
    }
  }
}
