import 'package:get_storage/get_storage.dart';

class LocalService {

  static getTemp() => GetStorage().read("temp");

  static Future setTemp(String temp) => GetStorage().write("temp", temp);
}
