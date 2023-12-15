import 'package:flutter/material.dart';
import 'package:weather_app/core/service/local/local_service.dart';
import 'package:weather_app/product/models/temperature_unit/temperature_unit_model.dart';

class SettingsViewModel with ChangeNotifier {
  List<TemperatureUnitModel> temperatureUnitList = [
    TemperatureUnitModel(
      unit: 'Celsius',
      isSelected: LocalService.getTemp() == null
          ? true
          : LocalService.getTemp() == "true"
              ? false
              : true,
    ),
    TemperatureUnitModel(
      unit: 'Fahrenheit',
      isSelected: LocalService.getTemp() == null
          ? false
          : LocalService.getTemp() == "true"
              ? true
              : false,
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

  bool? temp = LocalService.getTemp() == null
      ? false
      : LocalService.getTemp() == "true"
          ? true
          : false;

  Future saveTemperatureUnit(TemperatureUnitModel selectedUnit) async {
    await LocalService.setTemp(
    selectedUnit.unit == 'Celsius' ? "false" : "true");
    temp = selectedUnit.unit == 'Celsius' ? false : true;
    notifyListeners();
  }
}
