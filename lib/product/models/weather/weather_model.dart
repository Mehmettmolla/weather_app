class WeatherModelDaily {
  List<String?>? time;
  List<int?>? weatherCode;

  WeatherModelDaily({
    this.time,
    this.weatherCode,
  });
  WeatherModelDaily.fromJson(Map<String, dynamic> json) {
    if (json['time'] != null && (json['time'] is List)) {
      final v = json['time'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      time = arr0;
    }
    if (json['weather_code'] != null && (json['weather_code'] is List)) {
      final v = json['weather_code'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(int.tryParse(v.toString()) ?? 0);
      });
      weatherCode = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (time != null) {
      final v = time;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['time'] = arr0;
    }
    if (weatherCode != null) {
      final v = weatherCode;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['weather_code'] = arr0;
    }
    return data;
  }
}

class WeatherModelDailyUnits {
  String? time;
  String? weatherCode;

  WeatherModelDailyUnits({
    this.time,
    this.weatherCode,
  });
  WeatherModelDailyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time']?.toString();
    weatherCode = json['weather_code']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time'] = time;
    data['weather_code'] = weatherCode;
    return data;
  }
}

class WeatherModelHourly {
  List<String?>? time;
  List<double?>? temperature_2m;
  List<int?>? weatherCode;

  WeatherModelHourly({
    this.time,
    this.temperature_2m,
    this.weatherCode,
  });
  WeatherModelHourly.fromJson(Map<String, dynamic> json) {
    if (json['time'] != null && (json['time'] is List)) {
      final v = json['time'];
      final arr0 = <String>[];
      v.forEach((v) {
        arr0.add(v.toString());
      });
      time = arr0;
    }
    if (json['temperature_2m'] != null && (json['temperature_2m'] is List)) {
      final v = json['temperature_2m'];
      final arr0 = <double>[];
      v.forEach((v) {
        arr0.add(double.tryParse(v.toString()) ?? 0.0);
      });
      temperature_2m = arr0;
    }
    if (json['weather_code'] != null && (json['weather_code'] is List)) {
      final v = json['weather_code'];
      final arr0 = <int>[];
      v.forEach((v) {
        arr0.add(int.tryParse(v.toString()) ?? 0);
      });
      weatherCode = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (time != null) {
      final v = time;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['time'] = arr0;
    }
    if (temperature_2m != null) {
      final v = temperature_2m;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['temperature_2m'] = arr0;
    }
    if (weatherCode != null) {
      final v = weatherCode;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v);
      });
      data['weather_code'] = arr0;
    }
    return data;
  }
}

class WeatherModelHourlyUnits {
  String? time;
  String? temperature_2m;
  String? weatherCode;

  WeatherModelHourlyUnits({
    this.time,
    this.temperature_2m,
    this.weatherCode,
  });
  WeatherModelHourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time']?.toString();
    temperature_2m = json['temperature_2m']?.toString();
    weatherCode = json['weather_code']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time'] = time;
    data['temperature_2m'] = temperature_2m;
    data['weather_code'] = weatherCode;
    return data;
  }
}

class WeatherModelCurrent {
  String? time;
  int? interval;
  double? temperature_2m;
  int? weatherCode;

  WeatherModelCurrent({
    this.time,
    this.interval,
    this.temperature_2m,
    this.weatherCode,
  });
  WeatherModelCurrent.fromJson(Map<String, dynamic> json) {
    time = json['time']?.toString();
    interval = int.tryParse(json['interval']?.toString() ?? '');
    temperature_2m = double.tryParse(json['temperature_2m']?.toString() ?? '');
    weatherCode = int.tryParse(json['weather_code']?.toString() ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time'] = time;
    data['interval'] = interval;
    data['temperature_2m'] = temperature_2m;
    data['weather_code'] = weatherCode;
    return data;
  }
}

class WeatherModelCurrentUnits {
  String? time;
  String? interval;
  String? temperature_2m;
  String? weatherCode;

  WeatherModelCurrentUnits({
    this.time,
    this.interval,
    this.temperature_2m,
    this.weatherCode,
  });
  WeatherModelCurrentUnits.fromJson(Map<String, dynamic> json) {
    time = json['time']?.toString();
    interval = json['interval']?.toString();
    temperature_2m = json['temperature_2m']?.toString();
    weatherCode = json['weather_code']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['time'] = time;
    data['interval'] = interval;
    data['temperature_2m'] = temperature_2m;
    data['weather_code'] = weatherCode;
    return data;
  }
}

class WeatherModel {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  int? elevation;
  WeatherModelCurrentUnits? currentUnits;
  WeatherModelCurrent? current;
  WeatherModelHourlyUnits? hourlyUnits;
  WeatherModelHourly? hourly;
  WeatherModelDailyUnits? dailyUnits;
  WeatherModelDaily? daily;

  WeatherModel({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
    this.hourlyUnits,
    this.hourly,
    this.dailyUnits,
    this.daily,
  });
  WeatherModel.fromJson(Map<String, dynamic> json) {
    latitude = double.tryParse(json['latitude']?.toString() ?? '');
    longitude = double.tryParse(json['longitude']?.toString() ?? '');
    generationtimeMs =
        double.tryParse(json['generationtime_ms']?.toString() ?? '');
    utcOffsetSeconds =
        int.tryParse(json['utc_offset_seconds']?.toString() ?? '');
    timezone = json['timezone']?.toString();
    timezoneAbbreviation = json['timezone_abbreviation']?.toString();
    elevation = int.tryParse(json['elevation']?.toString() ?? '');
    currentUnits =
        (json['current_units'] != null && (json['current_units'] is Map))
            ? WeatherModelCurrentUnits.fromJson(json['current_units'])
            : null;
    current = (json['current'] != null && (json['current'] is Map))
        ? WeatherModelCurrent.fromJson(json['current'])
        : null;
    hourlyUnits =
        (json['hourly_units'] != null && (json['hourly_units'] is Map))
            ? WeatherModelHourlyUnits.fromJson(json['hourly_units'])
            : null;
    hourly = (json['hourly'] != null && (json['hourly'] is Map))
        ? WeatherModelHourly.fromJson(json['hourly'])
        : null;
    dailyUnits = (json['daily_units'] != null && (json['daily_units'] is Map))
        ? WeatherModelDailyUnits.fromJson(json['daily_units'])
        : null;
    daily = (json['daily'] != null && (json['daily'] is Map))
        ? WeatherModelDaily.fromJson(json['daily'])
        : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['generationtime_ms'] = generationtimeMs;
    data['utc_offset_seconds'] = utcOffsetSeconds;
    data['timezone'] = timezone;
    data['timezone_abbreviation'] = timezoneAbbreviation;
    data['elevation'] = elevation;
    if (currentUnits != null) {
      data['current_units'] = currentUnits!.toJson();
    }
    if (current != null) {
      data['current'] = current!.toJson();
    }
    if (hourlyUnits != null) {
      data['hourly_units'] = hourlyUnits!.toJson();
    }
    if (hourly != null) {
      data['hourly'] = hourly!.toJson();
    }
    if (dailyUnits != null) {
      data['daily_units'] = dailyUnits!.toJson();
    }
    if (daily != null) {
      data['daily'] = daily!.toJson();
    }
    return data;
  }
}
