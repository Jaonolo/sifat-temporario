import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart' as http;

class MovimentoRequester {
  static Future<ResponsePws> buscarAtivo(PWSConfig config, String token) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getMovimentoAtivo(),
      headerParams: {
        'token': token,
      },
    );
    return ResponsePws(
        response: response, converter: (json) => Movimento.fromJson(json));
  }

  static Future<ResponsePws> abrir(PWSConfig config, String token,
      Movimento movimento) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postMovimento(),
      headerParams: {
        'token': token,
      },
      body: movimento.toJson(),
    );
    return ResponsePws(
        response: response, converter: (json) => Movimento.fromJson(json));
  }
}
