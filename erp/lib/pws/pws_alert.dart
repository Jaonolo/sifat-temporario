class PwsAlert {
  
  String code = '';
  
  String message = '';
  
  String description = '';
  PwsAlert();

  @override
  String toString() {
    return 'PwsAlert[code=$code, message=$message, description=$description, ]';
  }

  PwsAlert.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    if (json['code'] == null) {
      code = '';
    } else {
          code = json['code'];
    }
    if (json['message'] == null) {
      message = '';
    } else {
          message = json['message'];
    }
    if (json['description'] == null) {
      description = '';
    } else {
          description = json['description'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (code != null)
      json['code'] = code;
    if (message != null)
      json['message'] = message;
    if (description != null)
      json['description'] = description;
    return json;
  }

  static List<PwsAlert> listFromJson(List<dynamic> json) {
    return json == null ? <PwsAlert>[] : json.map((value) => PwsAlert.fromJson(value)).toList();
  }

  static Map<String, PwsAlert> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, PwsAlert>();
    if (json != null && json.isNotEmpty) {
      json.forEach((String key, dynamic value) => map[key] = PwsAlert.fromJson(value));
    }
    return map;
  }
}

