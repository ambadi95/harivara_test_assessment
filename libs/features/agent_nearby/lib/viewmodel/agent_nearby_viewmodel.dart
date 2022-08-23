import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:geocoding/geocoding.dart' as reversegeocoding;

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
      return 'welcome-coming-soon';
    } catch (e) {
      return 'welcome-unable-to-detect-location';
    }
  }
}
