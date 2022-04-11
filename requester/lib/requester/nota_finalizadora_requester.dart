import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class NotaFinalizadoraRequester {

  static Future<ResponsePws> inserirNotaFinalizadora(PWSConfig config,
      String token, int idNota, NotaFinalizadora notaFinalizadora) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postInserirNotaFinalizadora(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idNota}": idNota.toString(),
      },
      body: notaFinalizadora,
    );
    return ResponsePws(response: response,
        converter: (json) => NotaFinalizadora.fromJson(json));
  }

  static Future<ResponsePws> deletarNotaFinalizadora(PWSConfig config,
      String token, int idNota, int idNotaFinalizadora) async {
    Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.deleteNotaFinalizadora(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idNota}": idNota.toString(),
          "{idNotaFinalizadora}": idNotaFinalizadora.toString()
        }
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> deletarTodasNotaFinalizadora(PWSConfig config,
      String token, int idNota) async {
    Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.deleteTodasFinalizadoras(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idNota}": idNota.toString(),
        }
    );
    return ResponsePws(response: response);
  }
}