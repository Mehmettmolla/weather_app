import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/core/service/api/api_service.dart';
import 'package:weather_app/product/models/weather/weather_model.dart';

class HomeViewModel with ChangeNotifier {
  final apiService = ApiService();
  WeatherModel? weatherModel;
  Future<WeatherModel> getWeather(double? lat, double? long) async {
    try {
      final result = await apiService.getRequest(
        endPoint:
            "?latitude=$lat&longitude=$long&current=temperature_2m,weather_code&hourly=temperature_2m,weather_code&daily=weather_code",
        fromJson: (json) => WeatherModel.fromJson(json),
      );
      weatherModel = result;
      notifyListeners();
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  String? location;
  Future<void> getPlaceMarkFromCoordinates(double? lat, double long) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat!, long);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        location = "${place.locality}";
        notifyListeners();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
