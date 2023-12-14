import 'package:flutter/material.dart';
import 'package:weather_app/product/models/temperature_unit/temperature_unit_model.dart';

class SettingsViewModel extends ChangeNotifier {

  List<TemperatureUnitModel> temperatureUnitList = [
    TemperatureUnitModel(
      unit: 'Celsius',
      isSelected: true,
    ),
    TemperatureUnitModel(
      unit: 'Fahrenheit',
      isSelected: false,
    ),
  ];

  void changeTemperatureUnit(TemperatureUnitModel selectedUnit) {
    for (var element in temperatureUnitList) {
      if (element.unit == selectedUnit.unit) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }
    notifyListeners();
  }
}