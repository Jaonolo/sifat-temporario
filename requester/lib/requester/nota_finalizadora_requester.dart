import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class NotaFinalizadoraRequester {
  static Future<ResponsePws> inserirNotaFinalizadora(PWSConfig config,
      String token, int idNota, NotaFinalizadora notaFinalizadora) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.postInserirNotaFinalizadora(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idNota}": idNota.toString(),
        },
        body: notaFinalizadora,
        converter: (json) => NotaFinalizadora.fromJson(json));
  }

  static Future<ResponsePws> deletarNotaFinalizadora(PWSConfig config,
      String token, int idNota, int idNotaFinalizadora) async {
    return await RequesterPws(config: config)
        .consome(urlPws: UrlPws.deleteNotaFinalizadora(), headerParams: {
      "token": token,
    }, pathParams: {
      "{idNota}": idNota.toString(),
      "{idNotaFinalizadora}": idNotaFinalizadora.toString()
    });
  }

  static Future<ResponsePws> deletarTodasNotaFinalizadora(
      PWSConfig config, String token, int idNota) async {
    return await RequesterPws(config: config)
        .consome(urlPws: UrlPws.deleteTodasFinalizadoras(), headerParams: {
      "token": token,
    }, pathParams: {
      "{idNota}": idNota.toString(),
    });
  }
}
