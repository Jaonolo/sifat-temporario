part of openapi.api;

class CredenciaisIfood {

  String? clientID;

  String? clientSecret;

  CredenciaisIfood();

  @override
  String toString() {
    return 'CredenciaisIfood[clientID=$clientID, clientSecret=$clientSecret, ]';
  }

  CredenciaisIfood.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['clientID'] == null) {
      clientID = null;
    } else {
      clientID = json['clientID'];
    }
    if (json['clientSecret'] == null) {
      clientSecret = null;
    } else {
      clientSecret = json['clientSecret'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (clientID != null)
      json['clientID'] = clientID;
    if (clientSecret != null)
      json['clientSecret'] = clientSecret;
    return json;
  }

  static List<CredenciaisIfood> listFromJson(List<dynamic> json) {
    return json.map((value) => CredenciaisIfood.fromJson(value)).toList();
  }

  static Map<String, CredenciaisIfood> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, CredenciaisIfood>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = CredenciaisIfood.fromJson(value));
    }
    return map;
  }
}

