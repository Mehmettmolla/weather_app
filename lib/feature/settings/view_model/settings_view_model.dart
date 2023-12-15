import 'package:flutter/material.dart';
import 'package:weather_app/core/service/api/api_service.dart';
import 'package:weather_app/core/service/local/local_service.dart';
import 'package:weather_app/product/constant/app_constant.dart';
import 'package:weather_app/product/models/dropdown/dropdown_item.dart';
import 'package:weather_app/product/models/location/province/province_model.dart';
import 'package:weather_app/product/models/temperature_unit/temperature_unit_model.dart';

class SettingsViewModel with ChangeNotifier {
  List<TemperatureUnitModel> temperatureUnitList = [
    TemperatureUnitModel(
      unit: 'Celsius',
      isSelected: LocalService.getTemp() != "true" ? true : false,
      
    ),
    TemperatureUnitModel(
      unit: 'Fahrenheit',
      isSelected: LocalService.getTemp() == "true" ? true : false,
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

  bool? temp = LocalService.getTemp() == "true" ? true : false;

  Future saveTemperatureUnit(TemperatureUnitModel selectedUnit) async {
    await LocalService.setTemp(
        selectedUnit.unit == 'Celsius' ? "false" : "true");
    temp = selectedUnit.unit == 'Celsius' ? false : true;
    notifyListeners();
  }

  final apiService = ApiService();

  DropdownItem? selectedProvince;
  double? selectedLat;
  double? selectedLong;

  ProvinceModel? provinceModel;
  Future<ProvinceModel> getProvinceList() async {
    try {
      final result = await apiService.getRequest(
        url:
            "${AppConstant.locationUrl}/provinces?fields=name,areaCode,coordinates",
        fromJson: (json) => ProvinceModel.fromJson(json),
      );
      provinceModel = result;
      notifyListeners();
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }

  void selectCityLocation(String selectedCity) {
    for (var element in provinceModel!.data!) {
      if (element!.name == selectedCity) {
        selectedLat = element.coordinates!.latitude;
        selectedLong = element.coordinates!.longitude;
        selectedProvince = DropdownItem(id: element.name!, name: element.name!);
        notifyListeners();
      }
    }
  }
}
