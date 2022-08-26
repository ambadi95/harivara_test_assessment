import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as reversegeocoding;
import 'dart:math' show cos, sqrt, asin;

class AgentNearbyViewModel {
  final int _scanLocationTimeout = 15;

  Location _location = Location();

  Future<bool> isServiceEnabled() async {
    var isServiceEnabled = false;
    for (int i = 0; i < 10; i++) {
      try {
        Location location = Location();
        bool serviceEnabled = await location.serviceEnabled();
        if (!serviceEnabled) {
          serviceEnabled = await location.requestService();
        }
        isServiceEnabled = serviceEnabled;
        if (isServiceEnabled) {
          break;
        }
      } on PlatformException catch (err) {
        print('Platform exception calling serviceEnabled(): $err');
        await Future.delayed(Duration(milliseconds: 100));
      }
    }
    return isServiceEnabled;
  }

  Future<bool> isPermissionGranted() async {
    var _isPermissionGranted = true;
    PermissionStatus _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _isPermissionGranted = false;
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted == PermissionStatus.granted) {
        _isPermissionGranted = true;
      }
    }
    return _isPermissionGranted;
  }

  Future<String> hasValidLocation() async {
    try {
      var _locationData = await Future.any([
        _location.getLocation(),
        Future.delayed(Duration(seconds: _scanLocationTimeout), () => null),
      ]);

      if (_locationData == null ||
          _locationData.latitude == null ||
          _locationData.longitude == null) {
        return 'welcome-unable-to-detect-location';
      }

      List<reversegeocoding.Placemark> placeMarks =
          await reversegeocoding.placemarkFromCoordinates(
        _locationData.latitude!,
        _locationData.longitude!,
      );
      if (placeMarks.isEmpty) {
        return 'welcome-unable-to-detect-location';
      }
      return 'Location Detected';
    } catch (e) {
      return 'welcome-unable-to-detect-location';
    }
  }

  Future<LocationData> getCurrentLocation()async{
    var _locationData = await Future.any([
      _location.getLocation(),
      Future.delayed(Duration(seconds: _scanLocationTimeout), () => null),
    ]);
    if(_locationData != null){
      return _locationData;
    }else{
      return _locationData!;
    }
  }

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }
}
