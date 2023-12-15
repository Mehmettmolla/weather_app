class BaseModel<T,R> {
  bool? status;
  String? message;
  T? data;
  BaseModel({
    this.status,
    this.message,
    required this.data,
  });
  BaseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'] as bool?;
    message = json['message']?.toString();
    data = json['data'] as T;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = data;
    return data;
  }
}




