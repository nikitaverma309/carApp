import 'package:car_rental_app/constants/app_constants.dart';
import 'package:car_rental_app/healper/app_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<String> getCurrentAddressName(
      {required BuildContext context}) async {
    Position position = await getCurrentLatLong(context: context);

    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);

    String? city = placemarks.first.locality;
    String? state = placemarks.first.administrativeArea;
    String? country = placemarks.first.country;
    String? street = placemarks.first.street;
    String? subUrb = placemarks.first.subAdministrativeArea;
    return "${street ?? ""}, ${subUrb ?? ""}";
  }

  static Future<Position> getCurrentLatLong(
      {required BuildContext context}) async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return AppHelper.getToast(
          "Please allow location permission",
        );
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return AppHelper.getToast("Please allow location permission");
    }

    return await Geolocator.getCurrentPosition();
  }

  static Future<String> getLocationNameFromLatLong(
      {required double lat, required double long}) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    String? city = placemarks.first.locality;
    String? state = placemarks.first.administrativeArea;
    String? country = placemarks.first.country;
    String? street = placemarks.first.street;
    String? subUrb = placemarks.first.subAdministrativeArea;
    String? location = placemarks.first.locality;

    return "${street ?? ""}, ${subUrb ?? ""}, ${city ?? ""}, ${country ?? ""}";
  }

  static Future<String> getCountryNameFormLatLong(
      {required double lat, required double long}) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

    String? country = placemarks.first.country;

    return country ?? "Australia";
  }
}
