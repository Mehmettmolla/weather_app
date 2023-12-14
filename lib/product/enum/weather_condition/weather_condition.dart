import 'package:weather_app/gen/assets.gen.dart';

enum WeatherCondition {
  Clear,
  Cloudy,
  Drizzle,
  Rain, 
  Snow, 
  Windy,
}

extension WeatherConditionExtension on WeatherCondition {
  static WeatherCondition fromCode(int code) {
    if (code >= 0 && code <= 19) {
      return WeatherCondition.Clear;
    } else if (code >= 40 && code <= 49) {
      return WeatherCondition.Cloudy;
    } else if (code >= 50 && code <= 59) {
      return WeatherCondition.Drizzle;
    } else if (code >= 60 && code <= 69) {
      return WeatherCondition.Rain;
    } else if (code == 22 || (code >= 70 && code <= 79)) {
      return WeatherCondition.Snow;
    } else if (code >= 30 && code <= 39) {
      return WeatherCondition.Windy;
    } else {
      return WeatherCondition.Clear; 
    }
  }
}

extension WeatherConditionLottieExtension on WeatherCondition {
  String get lottieAsset {
    switch (this) {
      case WeatherCondition.Clear:
        return Assets.lottie.openAirLottie;
      case WeatherCondition.Cloudy:
        return Assets.lottie.cloudyLottie;
      case WeatherCondition.Drizzle:
        return Assets.lottie.rainyLottie;
      case WeatherCondition.Rain:
        return Assets.lottie.rainyLottie;
      case WeatherCondition.Snow:
        return Assets.lottie.snowyLottie;
      case WeatherCondition.Windy:
        return Assets.lottie.windyLottie;
    }
  }
}
