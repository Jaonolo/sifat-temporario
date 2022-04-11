part of openapi.api;

class TRetConsStatServ {

  String? tpAmb;

  String? verAplic;

  String? cuf;

  String? dhRecbto;

  String? dhRetorno;

  String? versao;

  String? xmotivo;

  String? cstat;

  String? xobs;

  String? tmed;

  TRetConsStatServ();

  @override
  String toString() {
    return 'TRetConsStatServ[tpAmb=$tpAmb, verAplic=$verAplic, cuf=$cuf, dhRecbto=$dhRecbto, dhRetorno=$dhRetorno, versao=$versao, xmotivo=$xmotivo, cstat=$cstat, xobs=$xobs, tmed=$tmed, ]';
  }

  TRetConsStatServ.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['tpAmb'] == null) {
      tpAmb = null;
    } else {
      tpAmb = json['tpAmb'];
    }
    if (json['verAplic'] == null) {
      verAplic = null;
    } else {
      verAplic = json['verAplic'];
    }
    if (json['cuf'] == null) {
      cuf = null;
    } else {
      cuf = json['cuf'];
    }
    if (json['dhRecbto'] == null) {
      dhRecbto = null;
    } else {
      dhRecbto = json['dhRecbto'];
    }
    if (json['dhRetorno'] == null) {
      dhRetorno = null;
    } else {
      dhRetorno = json['dhRetorno'];
    }
    if (json['versao'] == null) {
      versao = null;
    } else {
      versao = json['versao'];
    }
    if (json['xmotivo'] == null) {
      xmotivo = null;
    } else {
      xmotivo = json['xmotivo'];
    }
    if (json['cstat'] == null) {
      cstat = null;
    } else {
      cstat = json['cstat'];
    }
    if (json['xobs'] == null) {
      xobs = null;
    } else {
      xobs = json['xobs'];
    }
    if (json['tmed'] == null) {
      tmed = null;
    } else {
      tmed = json['tmed'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (tpAmb != null)
      json['tpAmb'] = tpAmb;
    if (verAplic != null)
      json['verAplic'] = verAplic;
    if (cuf != null)
      json['cuf'] = cuf;
    if (dhRecbto != null)
      json['dhRecbto'] = dhRecbto;
    if (dhRetorno != null)
      json['dhRetorno'] = dhRetorno;
    if (versao != null)
      json['versao'] = versao;
    if (xmotivo != null)
      json['xmotivo'] = xmotivo;
    if (cstat != null)
      json['cstat'] = cstat;
    if (xobs != null)
      json['xobs'] = xobs;
    if (tmed != null)
      json['tmed'] = tmed;
    return json;
  }

  static List<TRetConsStatServ> listFromJson(List<dynamic> json) {
    return json.map((value) => TRetConsStatServ.fromJson(value)).toList();
  }

  static Map<String, TRetConsStatServ> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, TRetConsStatServ>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = TRetConsStatServ.fromJson(value));
    }
    return map;
  }
}

