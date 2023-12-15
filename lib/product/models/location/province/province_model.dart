class ProvinceModelDataCoordinates {

  double? latitude;
  double? longitude;

  ProvinceModelDataCoordinates({
    this.latitude,
    this.longitude,
  });
  ProvinceModelDataCoordinates.fromJson(Map<String, dynamic> json) {
    latitude = double.tryParse(json['latitude']?.toString() ?? '');
    longitude = double.tryParse(json['longitude']?.toString() ?? '');
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class ProvinceModelData {

  String? name;
  List<int?>? areaCode;
  ProvinceModelDataCoordinates? coordinates;

  ProvinceModelData({
    this.name,
    this.areaCode,
    this.coordinates,
  });
  ProvinceModelData.fromJson(Map<String, dynamic> json) {
    name = json['name']?.toString();
  if (json['areaCode'] != null && (json['areaCode'] is List)) {
  final v = json['areaCode'];
  final arr0 = <int>[];
  v.forEach((v) {
  arr0.add(int.tryParse(v.toString()) ?? 0);
  });
    areaCode = arr0;
    }
    coordinates = (json['coordinates'] != null && (json['coordinates'] is Map)) ? ProvinceModelDataCoordinates.fromJson(json['coordinates']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    if (areaCode != null) {
      final v = areaCode;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v);
  });
      data['areaCode'] = arr0;
    }
    if (coordinates != null) {
      data['coordinates'] = coordinates!.toJson();
    }
    return data;
  }
}

class ProvinceModel {

  String? status;
  List<ProvinceModelData?>? data;

  ProvinceModel({
    this.status,
    this.data,
  });
  ProvinceModel.fromJson(Map<String, dynamic> json) {
    status = json['status']?.toString();
  if (json['data'] != null && (json['data'] is List)) {
  final v = json['data'];
  final arr0 = <ProvinceModelData>[];
  v.forEach((v) {
  arr0.add(ProvinceModelData.fromJson(v));
  });
    this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
  v!.forEach((v) {
  arr0.add(v!.toJson());
  });
      data['data'] = arr0;
    }
    return data;
  }
}
