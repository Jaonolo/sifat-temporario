part of openapi.api;

class ApiResponse {

  int? code;

  String? type;

  String? message;

  ApiResponse();

  @override
  String toString() {
    return 'ApiResponse[code=$code, type=$type, message=$message, ]';
  }

  ApiResponse.fromJson(Map<String, dynamic> json) {
    if (json['code'] == null) {
      code = null;
    } else {
      code = json['code'];
    }
    if (json['type'] == null) {
      type = null;
    } else {
      type = json['type'];
    }
    if (json['message'] == null) {
      message = null;
    } else {
      message = json['message'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (code != null) {
      json['code'] = code;
    }
    if (type != null) {
      json['type'] = type;
    }
    if (message != null) {
      json['message'] = message;
    }
    return json;
  }

  static List<ApiResponse> listFromJson(List<dynamic> json) {
    return json.map((value) => ApiResponse.fromJson(value)).toList();
  }

  static Map<String, ApiResponse> mapFromJson(Map<String, dynamic> json) {
    Map<String, ApiResponse> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ApiResponse.fromJson(value));
    }
    return map;
  }
}

