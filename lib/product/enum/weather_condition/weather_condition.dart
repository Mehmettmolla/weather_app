import 'package:weather_app/product/gen/assets.gen.dart';

enum WeatherCondition {
  Clear,
  Cloudy,
  Drizzle,
  Rain, 
  Snow, 
  Windy,
}

extension WeatherConditionExtension on WeatherCondition {
  static String fromCode(int code) {
    if (code >= 0 && code <= 19) {
      return "Clear";
    } else if (code >= 40 && code <= 49) {
      return "Cloudy";
    } else if (code >= 50 && code <= 59) {
      return "Drizzle";
    } else if (code >= 60 && code <= 69) {
      return "Rain";
    } else if (code == 22 || (code >= 70 && code <= 79)) {
      return "Snow";
    } else if (code >= 30 && code <= 39) {
      return "Windy";
    } else {
      return "Clear"; 
    }
  }
}

extension WeatherConditionLottieExtension on String {
  String get lottieAsset {
    switch (this) {
      case "Clear":
        return Assets.lottie.openAirLottie;
      case "Cloudy":
        return Assets.lottie.cloudyLottie;
      case "Drizzle":
        return Assets.lottie.rainyLottie;
      case "Rain":
        return Assets.lottie.rainyLottie;
      case "Snow":
        return Assets.lottie.snowyLottie;
      case "Windy":
        return Assets.lottie.windyLottie;
      default:
        return Assets.lottie.openAirLottie;
    }
  }
}
